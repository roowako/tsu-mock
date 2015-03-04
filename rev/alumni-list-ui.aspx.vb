Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic

Partial Class rev_alumni_list_ui
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String

    Public Shared Property student_status As String
    Public Shared Property employement_status As String
    Public Shared Property nature_appointment As String
    Dim isEmployed As Boolean
    Dim course_id As String

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

    Public Shared Function GetJson2(ByVal dt As DataTable) As String
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

    'DISPLAY REPORT
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function userlist_report(ByVal sortBy As String, ByVal collegeDesc As String, ByVal yearGrad As String) As String
        Dim sqlSTR As String
        Dim userlevel_id As Integer
        Dim college_id As Integer


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()

            Using da As New SqlDataAdapter("SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE course_idfk = course_idpk AND userlevel_idfk<>2 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1", sqlCon)
                Dim ds As New DataSet
                da.Fill(ds, "DTalumni_list")

                If ds.Tables(0).Rows.Count <> 0 Then
                    Return CStr(ds.Tables("DTalumni_list").Rows.Count)
                End If
            End Using

            sqlCon.Close()
        End Using
    End Function

    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullAll(ByVal sortBy As String) As String

        If sortBy = "all" Then
            Using sqlCon As New SqlConnection(constr)

                sqlCon.Open()
                Using da = New SqlDataAdapter(" SELECT *,tblColleges.description as collegeDes,tblCourses.description as courseDes FROM tblAccounts,tblCourses,tblColleges WHERE course_idfk = course_idpk AND userlevel_idfk<>2 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1", sqlCon)
                    Dim table = New DataTable()
                    da.Fill(table)

                    Dim jsndata As String = GetJson(table)
                    Return jsndata
                End Using

                sqlCon.Close()

                'Returning Message : Fail or Successful
            End Using
        ElseIf sortBy = "alumni" Then
            Using sqlCon As New SqlConnection(constr)

                sqlCon.Open()
                Using da = New SqlDataAdapter(" SELECT *,tblColleges.description as collegeDes,tblCourses.description as courseDes FROM tblAccounts,tblCourses,tblColleges WHERE course_idfk = course_idpk AND userlevel_idfk = 1 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1 ", sqlCon)
                    Dim table = New DataTable()
                    da.Fill(table)

                    Dim jsndata As String = GetJson(table)
                    Return jsndata
                End Using

                sqlCon.Close()

            End Using
        ElseIf sortBy = "graduating" Then
            Using sqlCon As New SqlConnection(constr)

                sqlCon.Open()
                Using da = New SqlDataAdapter("  SELECT *,tblColleges.description as collegeDes,tblCourses.description as courseDes FROM tblAccounts,tblCourses,tblColleges WHERE course_idfk = course_idpk AND userlevel_idfk = 0 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1 ", sqlCon)
                    Dim table = New DataTable()
                    da.Fill(table)

                    Dim jsndata As String = GetJson(table)
                    Return jsndata
                End Using

                sqlCon.Close()

            End Using
        End If
    End Function

    'Textbox Search
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function searchQ(ByVal q As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database
        Dim jsndata As String


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using da = New SqlDataAdapter(" SELECT *,  given_name+ ' ' +family_name+ ' ' +middle_name ,CONVERT(VARCHAR, birthday,7) as formatedB,tblColleges.description as collegeDes,tblCourses.description as courseDes   FROM tblAccounts,tblCourses,tblColleges WHERE  given_name+ ' ' +family_name+ ' ' +middle_name LIKE '%" & q & "%' AND tblAccounts.course_idfk = tblCourses.course_idpk AND tblColleges.college_idpk = tblCourses.college_idfk AND account_status = 1 ", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                jsndata = GetJson(table)
                Return jsndata
            End Using
            sqlCon.Close()
            'Returning Message : Fail or Successful
            sqlCon.Close()
        End Using





        'Returning Message : Fail or Successful
    End Function

    'Filter College
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function filterView(ByVal sortBy As String, ByVal college_id As String) As String
        
        If sortBy = "alumni" Then
            If college_id = "0" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes ,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk =   tblColleges.college_idpk AND tblAccounts.userlevel_idfk = 1 AND tblAccounts.account_status = 1 ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using
            Else
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk = '" + college_id + "' AND  tblColleges.college_idpk = '" + college_id + "' AND tblAccounts.userlevel_idfk = 1 AND tblAccounts.account_status = 1 ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using

            End If
            
        ElseIf sortBy = "all" Then
            If college_id = "0" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk =   tblColleges.college_idpk AND tblAccounts.userlevel_idfk <> 2 AND tblAccounts.account_status = 1 ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using
            Else
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk = '" + college_id + "' AND  tblColleges.college_idpk = '" + college_id + "' AND tblAccounts.userlevel_idfk <> 2 AND tblAccounts.account_status = 1 ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using
            End If
           

            ElseIf sortBy = "graduating" Then
                If college_id = "0" Then
                    Using sqlCon As New SqlConnection(constr)
                        sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk =   tblColleges.college_idpk AND tblAccounts.userlevel_idfk = 0 AND tblAccounts.account_status = 1", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                        sqlCon.Close()
                        'Returning Message : Fail or Successful

                    End Using
                Else
                    Using sqlCon As New SqlConnection(constr)
                        sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk = '" + college_id + "' AND  tblColleges.college_idpk = '" + college_id + "' AND tblAccounts.userlevel_idfk = 0 AND tblAccounts.account_status = 1 ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                        sqlCon.Close()
                        'Returning Message : Fail or Successful

                    End Using

                End If
            End If
    End Function

    'PAGE LOAD
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
       If Session.Item("id") Is Nothing Then
            Console.Write("sd")
            Response.Redirect("Default.aspx")
        Else

            For i As Integer = 1970 To CInt(Year(Now()))
                filterYear.Items.Add(New ListItem(i.ToString(), i.ToString()))
            Next

            Image2.ID = "non"
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", Session("id"))
                dr = cmd.ExecuteReader

                While dr.Read
                    alumni_name.Text = dr.GetString(6)
                    account_idpk.Text = Session("id")
                End While

                sqlCon.Close()
            End Using
        End If
    End Sub

    'LOGOUT
    Protected Sub alumni_logout_Click(sender As Object, e As EventArgs) Handles alumni_logout.ServerClick
        Session.Abandon()
        Response.Redirect("default.aspx")
    End Sub

    'DISPLAY ACCOUNT INFO
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function fetchAccountInfo(ByVal accId As String) As String
        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using dat = New SqlDataAdapter("SELECT *,CONVERT(VARCHAR, birthday,7) as formatedB FROM tblAccounts WHERE account_idpk = '" & accId & "'", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)

                Dim accIdPK As String = GetJson2(table2)
                Return accIdPK
            End Using

            sqlCon.Close()

        End Using

    End Function

    'Fetch colleges
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullColleges() As String

        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using da = New SqlDataAdapter(" SELECT * FROM tblColleges", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using

            sqlCon.Close()
        End Using

    End Function

    'Filter Year
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function filterByYear(ByVal sortBy As String, ByVal college_id As String, ByVal year As String) As String

        If sortBy = "alumni" Then
            If college_id = "0" And year = "all" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes ,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk =   tblColleges.college_idpk AND tblAccounts.userlevel_idfk = 1  AND tblAccounts.account_status = 1 ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using
            ElseIf college_id > 0 And year = "all" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk = '" + college_id + "' AND  tblColleges.college_idpk = '" + college_id + "' AND tblAccounts.userlevel_idfk = 1 AND tblAccounts.account_status = 1", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using

            ElseIf college_id = "0" And year <> "all" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk = tblColleges.college_idpk AND   tblAccounts.userlevel_idfk = 1 AND tblAccounts.account_status = 1 AND year_graduated = '" & year & "' ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using

            ElseIf college_id > 0 And year <> "all" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk = '" + college_id + "' AND  tblColleges.college_idpk = '" + college_id + "' AND tblAccounts.userlevel_idfk = 1 AND tblAccounts.account_status = 1 AND year_graduated = '" & year & "' ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using

            End If

        ElseIf sortBy = "all" Then
            If college_id = "0" And year = "all" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk =   tblColleges.college_idpk AND tblAccounts.userlevel_idfk <> 2  AND tblAccounts.account_status = 1 ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using

            ElseIf college_id = "0" And year <> "all" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk =   tblColleges.college_idpk AND tblAccounts.userlevel_idfk <> 2  AND tblAccounts.account_status = 1 AND year_graduated = '" & year & "' ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using
            ElseIf college_id > 0 And year = "all" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk = '" + college_id + "' AND  tblColleges.college_idpk = '" + college_id + "' AND tblAccounts.userlevel_idfk <> 2 AND tblAccounts.account_status = 1   ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using
            ElseIf college_id > 0 And sortBy = "all" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk = '" + college_id + "' AND  tblColleges.college_idpk = '" + college_id + "' AND tblAccounts.userlevel_idfk <> 2 AND tblAccounts.account_status = 1 AND year_graduated = '" & year & "'  ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using
            End If

        

        ElseIf sortBy = "graduating" Then
            If college_id = "0" And year = "all" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk =   tblColleges.college_idpk AND tblAccounts.userlevel_idfk = 0 AND   tblAccounts.account_status = 1", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using

            ElseIf college_id = "0" And year <> "all" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk = tblColleges.college_idpk  AND tblAccounts.userlevel_idfk = 0 AND tblAccounts.account_status = 1 AND year_graduated = '" & year & "' ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using

            ElseIf college_id > 0 And year <> "all" Then
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()
                    Using dataAdapter = New SqlDataAdapter("SELECT *, tblColleges.description as collegeDes,tblCourses.description as courseDes  FROM tblAccounts,tblCourses,tblColleges  WHERE  tblCourses.course_idpk = tblAccounts.course_idfk AND tblCourses.college_idfk = '" + college_id + "' AND  tblColleges.college_idpk = '" + college_id + "' AND tblAccounts.userlevel_idfk = 0 AND tblAccounts.account_status = 1 AND year_graduated = '" & year & "' ", sqlCon)
                        Dim table = New DataTable()
                        dataAdapter.Fill(table)

                        Dim jsndata As String = GetJson(table)
                        Return jsndata
                    End Using
                    sqlCon.Close()
                    'Returning Message : Fail or Successful

                End Using

            End If

       

        End If

    End Function
End Class
