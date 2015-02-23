Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic

Partial Class director_report
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader
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

    'PAGE LOAD
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim s As String
        Dim t As String

        s = Request.QueryString("course_desc")
        t = Request.QueryString("college_desc")

        Label1.Text = s.ToString()
        Label2.Text = t.ToString()
    End Sub

    'GENERAL EMPLOYMENT STATISTICS
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
                    "COUNT(CASE WHEN q4 = 'Private' then 1 else NULL end) Q4A, COUNT(CASE when q3 = 'Public' then 1 else NULL end) Q4B, " +
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
End Class
