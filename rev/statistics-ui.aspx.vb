Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic

Partial Class statistics_ui
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String
    Public Shared Property user_id As String
    'SERIALIZER
    Public Shared Function GetJson(ByVal dt As DataTable) As String
        Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
        serializer.MaxJsonLength = Integer.MaxValue

        Dim rows As New List(Of Dictionary(Of String, Object))()
        Dim row As Dictionary(Of String, Object) = Nothing
        Dim row2 As Dictionary(Of Integer, Object) = Nothing
        For Each dr As DataRow In dt.Rows
            row = New Dictionary(Of String, Object)()
            row2 = New Dictionary(Of Integer, Object)()
            For Each dc As DataColumn In dt.Columns
                row.Add(dc.ColumnName.Trim(), dr(dc))
            Next
            rows.Add(row)
        Next
        Return serializer.Serialize(rows)
    End Function

    'FILTER VIEW
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullQ(ByVal filterView As String, ByVal cid As Integer, ByVal college_desc As String) As String
        Dim college_id As Integer

        'FETCH COLLEGE ID
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT college_idpk FROM tblColleges WHERE description = '" & college_desc & "' ", sqlCon)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                college_id = dr.GetValue(0)
                dr.Close()
            End If

            sqlCon.Close()
        End Using


        If filterView = "survey" Then
            Using da = New SqlDataAdapter(" SELECT * FROM tblEmployment ", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using


        ElseIf filterView = "poll" And cid <> 0 Then
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()
                Using da = New SqlDataAdapter("SELECT DISTINCT tblPolls.description as t, tblPolls.question as q, tblPolls.polls_idpk as pid, c = CASE WHEN tblPolls.target_id <> 0 THEN (SELECT description FROM tblColleges WHERE college_idpk = tblPolls.target_id) ELSE 'Director Survey' END FROM tblPolls,tblColleges WHERE tblPolls.status = 1 AND tblPolls.target_id = '" & cid & "' ", sqlCon)
                    Dim table = New DataTable()
                    da.Fill(table)

                    Dim jsndata As String = GetJson(table)
                    Return jsndata
                End Using
                sqlCon.Close()
            End Using

        ElseIf filterView = "poll" And cid = 0 Then
                If college_desc = "ALL COLLEGES" Then
                    sqlStr = "SELECT DISTINCT tblPolls.description as t, tblPolls.question as q, tblPolls.polls_idpk as pid, c = CASE WHEN tblPolls.target_id <> 0 THEN (SELECT description FROM tblColleges WHERE college_idpk = tblPolls.target_id) ELSE 'Director Survey' END FROM tblPolls,tblColleges WHERE tblPolls.status = 1"
                Else
                    sqlStr = "SELECT DISTINCT tblPolls.description as t, tblPolls.question as q, tblPolls.polls_idpk as pid, c = CASE WHEN tblPolls.target_id <> 0 THEN (SELECT description FROM tblColleges WHERE college_idpk = tblPolls.target_id) ELSE 'Director Survey' END FROM tblPolls,tblColleges WHERE tblPolls.status = 1 AND tblPolls.target_id = '" & college_id & "' "
                End If

                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using da = New SqlDataAdapter(sqlStr, sqlCon)
                        Dim table = New DataTable()
                        da.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                End Using

        End If

    End Function

    'Delete poll
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function deletePoll(ByVal poll_id As String) As String

        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("DELETE FROM  tblPolls WHERE polls_idpk = '" & poll_id & "'", sqlcon)
            cmd.ExecuteNonQuery()

            sqlcon.Close()
        End Using
        Return "Deleted."
    End Function

    'PULL GENERAL SURVEY STATS
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function empstat(ByVal college_desc As String, ByVal course_desc As String) As String
        Dim college_id As Integer
        Dim course_id As Integer
        Dim sqlstr As String = ""

        'FETCH COLLEGE ID
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT college_idpk FROM tblColleges WHERE description = '" & college_desc & "' ", sqlCon)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                college_id = dr.GetValue(0)
                dr.Close()
            End If

            sqlCon.Close()
        End Using

        'FETCH COURSE ID
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT course_idpk FROM tblCourses WHERE description = '" & course_desc & "' ", sqlCon)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                course_id = dr.GetValue(0)
                dr.Close()
            End If

            sqlCon.Close()
        End Using

        'FETCH STATS DATA
        Using sqlCon As New SqlConnection(constr)

            If college_desc = "ALL COLLEGES" And course_desc = "ALL COURSES" Then
                sqlstr = "SELECT " +
                    "COUNT(CASE WHEN employment_status = 'employed_no' then 1 else NULL end) Unmployed, COUNT(CASE when employment_status = 'employed_yes' then 1 else NULL end) Employed, " +
                    "COUNT(CASE WHEN q1 = '1 to 3 months' then 1 else NULL end) Q1A, COUNT(CASE when q1 = '4 to 6 months' then 1 else NULL end) Q1B, COUNT(CASE when q1 = '7 months to 1 year' then 1 else NULL end) Q1C, COUNT(CASE when q1 = 'Others' then 1 else NULL end) Q1D, " +
                    "COUNT(CASE WHEN q2 = 'Yes' then 1 else NULL end) Q2A, COUNT(CASE when q2 = 'No' then 1 else NULL end) Q2B, " +
                    "COUNT(CASE WHEN q3 = 'Abroad' then 1 else NULL end) Q3A, COUNT(CASE when q3 = 'Local' then 1 else NULL end) Q3B, " +
                    "COUNT(CASE WHEN q4 = 'Private' then 1 else NULL end) Q4A, COUNT(CASE when q4 = 'Public' then 1 else NULL end) Q4B, " +
                    "COUNT(CASE WHEN q5 = 'nat_app_reg' then 1 else NULL end) Q5A, COUNT(CASE when q5 = 'nat_app_prob' then 1 else NULL end) Q5B, COUNT(CASE when q5 = 'self_emp_opt' then 1 else NULL end) Q5C, " +
                    "COUNT(CASE WHEN q6 = 'Rank and File' then 1 else NULL end) Q6A, COUNT(CASE when q6 = 'Supervisory Level' then 1 else NULL end) Q6B, COUNT(CASE when q6 = 'Managerial Level' then 1 else NULL end) Q6C, COUNT(CASE when q6 = 'Others' then 1 else NULL end) Q6D, " +
                    "COUNT(CASE WHEN q7 = '1 to 6 months' then 1 else NULL end) Q7A, COUNT(CASE when q7 = '7 months to 1 year' then 1 else NULL end) Q7B, COUNT(CASE when q7 = '1 year to 3 years' then 1 else NULL end) Q7C, COUNT(CASE when q7 = 'Others' then 1 else NULL end) Q7D, " +
                    "COUNT(CASE WHEN further_study = 'fu_opt_yes' THEN 1 ELSE NULL end) FSA, COUNT(CASE WHEN further_study = 'fu_opt_no' THEN 1 ELSE NULL end) FSB, " +
                    "COUNT(CASE WHEN highest_educ_attainment = 'Doctoral' THEN 1 ELSE NULL end) HEA1, COUNT(CASE WHEN highest_educ_attainment = 'Masteral' THEN 1 ELSE NULL end) HEA2, COUNT(CASE WHEN highest_educ_attainment = 'Others' THEN 1 ELSE NULL end) HEA3 " +
                    "FROM tblEmployment"
            ElseIf college_desc <> "ALL COLLEGES" And course_desc = "ALL COURSES" Then
                sqlstr = "SELECT " +
                    "COUNT(CASE WHEN employment_status = 'employed_no' then 1 else NULL end) Unmployed, COUNT(CASE when employment_status = 'employed_yes' then 1 else NULL end) Employed, " +
                    "COUNT(CASE WHEN q1 = '1 to 3 months' then 1 else NULL end) Q1A, COUNT(CASE when q1 = '4 to 6 months' then 1 else NULL end) Q1B, COUNT(CASE when q1 = '7 months to 1 year' then 1 else NULL end) Q1C, COUNT(CASE when q1 = 'Others' then 1 else NULL end) Q1D, " +
                    "COUNT(CASE WHEN q2 = 'Yes' then 1 else NULL end) Q2A, COUNT(CASE when q2 = 'No' then 1 else NULL end) Q2B, " +
                    "COUNT(CASE WHEN q3 = 'Abroad' then 1 else NULL end) Q3A, COUNT(CASE when q3 = 'Local' then 1 else NULL end) Q3B, " +
                    "COUNT(CASE WHEN q4 = 'Private' then 1 else NULL end) Q4A, COUNT(CASE when q3 = 'Public' then 1 else NULL end) Q4B, " +
                    "COUNT(CASE WHEN q5 = 'nat_app_reg' then 1 else NULL end) Q5A, COUNT(CASE when q5 = 'nat_app_prob' then 1 else NULL end) Q5B, COUNT(CASE when q5 = 'self_emp_opt' then 1 else NULL end) Q5C, " +
                    "COUNT(CASE WHEN q6 = 'Rank and File' then 1 else NULL end) Q6A, COUNT(CASE when q6 = 'Supervisory Level' then 1 else NULL end) Q6B, COUNT(CASE when q6 = 'Managerial Level' then 1 else NULL end) Q6C, COUNT(CASE when q6 = 'Others' then 1 else NULL end) Q6D, " +
                    "COUNT(CASE WHEN q7 = '1 to 6 months' then 1 else NULL end) Q7A, COUNT(CASE when q7 = '7 months to 1 year' then 1 else NULL end) Q7B, COUNT(CASE when q7 = '1 year to 3 years' then 1 else NULL end) Q7C, COUNT(CASE when q7 = 'Others' then 1 else NULL end) Q7D, " +
                    "COUNT(CASE WHEN further_study = 'fu_opt_yes' THEN 1 ELSE NULL end) FSA, COUNT(CASE WHEN further_study = 'fu_opt_no' THEN 1 ELSE NULL end) FSB, " +
                    "COUNT(CASE WHEN highest_educ_attainment = 'Doctoral' THEN 1 ELSE NULL end) HEA1, COUNT(CASE WHEN highest_educ_attainment = 'Masteral' THEN 1 ELSE NULL end) HEA2, COUNT(CASE WHEN highest_educ_attainment = 'Others' THEN 1 ELSE NULL end) HEA3 " +
                    "FROM tblEmployment WHERE college_idfk = '" & college_id & "' "
            ElseIf college_desc <> "ALL COLLEGES" And course_desc <> "ALL COURSES" Then
                sqlstr = "SELECT " +
                    "COUNT(CASE WHEN employment_status = 'employed_no' then 1 else NULL end) Unmployed, COUNT(CASE when employment_status = 'employed_yes' then 1 else NULL end) Employed, " +
                    "COUNT(CASE WHEN q1 = '1 to 3 months' then 1 else NULL end) Q1A, COUNT(CASE when q1 = '4 to 6 months' then 1 else NULL end) Q1B, COUNT(CASE when q1 = '7 months to 1 year' then 1 else NULL end) Q1C, COUNT(CASE when q1 = 'Others' then 1 else NULL end) Q1D, " +
                    "COUNT(CASE WHEN q2 = 'Yes' then 1 else NULL end) Q2A, COUNT(CASE when q2 = 'No' then 1 else NULL end) Q2B, " +
                    "COUNT(CASE WHEN q3 = 'Abroad' then 1 else NULL end) Q3A, COUNT(CASE when q3 = 'Local' then 1 else NULL end) Q3B, " +
                    "COUNT(CASE WHEN q4 = 'Private' then 1 else NULL end) Q4A, COUNT(CASE when q3 = 'Public' then 1 else NULL end) Q4B, " +
                    "COUNT(CASE WHEN q5 = 'nat_app_reg' then 1 else NULL end) Q5A, COUNT(CASE when q5 = 'nat_app_prob' then 1 else NULL end) Q5B, COUNT(CASE when q5 = 'self_emp_opt' then 1 else NULL end) Q5C, " +
                    "COUNT(CASE WHEN q6 = 'Rank and File' then 1 else NULL end) Q6A, COUNT(CASE when q6 = 'Supervisory Level' then 1 else NULL end) Q6B, COUNT(CASE when q6 = 'Managerial Level' then 1 else NULL end) Q6C, COUNT(CASE when q6 = 'Others' then 1 else NULL end) Q6D, " +
                    "COUNT(CASE WHEN q7 = '1 to 6 months' then 1 else NULL end) Q7A, COUNT(CASE when q7 = '7 months to 1 year' then 1 else NULL end) Q7B, COUNT(CASE when q7 = '1 year to 3 years' then 1 else NULL end) Q7C, COUNT(CASE when q7 = 'Others' then 1 else NULL end) Q7D, " +
                    "COUNT(CASE WHEN further_study = 'fu_opt_yes' THEN 1 ELSE NULL end) FSA, COUNT(CASE WHEN further_study = 'fu_opt_no' THEN 1 ELSE NULL end) FSB, " +
                    "COUNT(CASE WHEN highest_educ_attainment = 'Doctoral' THEN 1 ELSE NULL end) HEA1, COUNT(CASE WHEN highest_educ_attainment = 'Masteral' THEN 1 ELSE NULL end) HEA2, COUNT(CASE WHEN highest_educ_attainment = 'Others' THEN 1 ELSE NULL end) HEA3 " +
                    "FROM tblEmployment WHERE college_idfk = '" & college_id & "' AND course_idfk = '" & course_id & "' "
            End If

            sqlCon.Open()

            Using da = New SqlDataAdapter(sqlstr, sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using

            sqlCon.Close()
        End Using

    End Function

    'PAGE LOAD
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session.Item("id") Is Nothing Then
            Console.Write("sd")
            Response.Redirect("Default.aspx")
        Else

            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", Session("id"))
                dr = cmd.ExecuteReader

                While dr.Read
                    alumni_name.Text = dr.GetString(6)
                    account_idpk.Text = Session("id")
                    user_id = dr.GetValue(18)
                    college_id.Text = dr.GetValue(18)
                    undeditable.ImageUrl = dr.GetString(20)
                End While

                sqlCon.Close()
            End Using

            fetch_college()
        End If
    End Sub

    'FETCH COLLEGES
    Sub fetch_college()
        cboCollege.Items.Clear()
        cboCollege.Items.Add("ALL COLLEGES")

        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("SELECT description from tblColleges", sqlcon)
            dr = cmd.ExecuteReader

            Do While dr.Read
                cboCollege.Items.Add(dr.GetString(0))
            Loop

            sqlcon.Close()
        End Using
    End Sub

    'PULL DYNAMIC SURVEY STATS
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullPollOptions(ByVal optFk As String, ByVal college_desc As String, ByVal course_desc As String) As String
        Dim college_id As Integer
        Dim course_id As Integer
        Dim sqlstr As String = ""

        'FETCH COLLEGE ID
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT college_idpk FROM tblColleges WHERE description = '" & college_desc & "' ", sqlCon)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                college_id = dr.GetValue(0)
                dr.Close()
            End If

            sqlCon.Close()
        End Using

        'FETCH COURSE ID
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT course_idpk FROM tblCourses WHERE description = '" & course_desc & "' ", sqlCon)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                course_id = dr.GetValue(0)
                dr.Close()
            End If

            sqlCon.Close()
        End Using

        'FETCH STATS DATA
        Using sqlCon As New SqlConnection(constr)
            If college_desc = "ALL COLLEGES" And course_desc = "ALL COURSES" Then
                sqlstr = "SELECT option_description, COUNT(tblPollsdata.pollsoption_idfk) as stats_data FROM tblPollsoption LEFT JOIN tblPollsdata ON tblPollsoption.pollsoption_idpk=tblPollsdata.pollsoption_idfk WHERE tblPollsoption.polls_idfk='" & optFk & "' GROUP BY option_description ORDER BY stats_data DESC "

            ElseIf college_desc <> "ALL COLLEGES" And course_desc = "ALL COURSES" Then
                sqlstr = "SELECT option_description, COUNT(CASE WHEN college_idfk = '" & college_id & "' THEN 1 ELSE NULL END) as stats_data FROM tblPollsoption LEFT JOIN tblPollsdata ON tblPollsoption.pollsoption_idpk=tblPollsdata.pollsoption_idfk WHERE tblPollsoption.polls_idfk='" & optFk & "' GROUP BY option_description ORDER BY stats_data DESC "

            ElseIf college_desc <> "ALL COLLEGES" And course_desc <> "ALL COURSES" Then
                sqlstr = "SELECT option_description, COUNT(CASE WHEN college_idfk = '" & college_id & "' AND course_idfk = '" & course_id & "' THEN 1 ELSE NULL END) as stats_data FROM tblPollsoption LEFT JOIN tblPollsdata ON tblPollsoption.pollsoption_idpk=tblPollsdata.pollsoption_idfk WHERE tblPollsoption.polls_idfk='" & optFk & "' GROUP BY option_description ORDER BY stats_data DESC "

            End If

            sqlCon.Open()

            Using dat = New SqlDataAdapter(sqlstr, sqlCon)
                Dim table2 = New DataTable()
                dat.Fill(table2)

                Dim pollOptionsJsonData As String = GetJson(table2)
                Return pollOptionsJsonData
            End Using

            sqlCon.Close()
        End Using

    End Function

    'Log out
    Protected Sub alumni_logout_Click(sender As Object, e As EventArgs) Handles alumni_logout.ServerClick
        Session.Abandon()
        Response.Redirect("default.aspx")
    End Sub
  
End Class
