Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Imports System.Net.Mail


Partial Class rev_pending_reg_ui
    Inherits System.Web.UI.Page


    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String
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


    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullFromServer() As String
        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using da = New SqlDataAdapter(" SELECT *,tblColleges.description as collegeDes, tblCourses.description as courseDes FROM tblAccounts,tblCourses,tblColleges WHERE account_status = 0  AND tblAccounts.course_idfk = tblCourses.course_idpk AND tblColleges.college_idpk = tblCourses.college_idfk ", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using

            sqlCon.Close()
        End Using

    End Function

    'APPROVE ACCOUNT
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function approveAccount(ByVal accId As String, ByVal emailAdd As String, ByVal name As String, ByVal id As String) As String
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            cmd = New SqlCommand("UPDATE tblAccounts SET account_status = 1 WHERE  account_idpk = '" & accId & "' ", sqlCon)
            cmd.ExecuteNonQuery()
            sqlCon.Close()
        End Using

        Try
            Dim Smtp_Server As New SmtpClient
            Dim e_mail As New MailMessage()
            Smtp_Server.UseDefaultCredentials = False
            Smtp_Server.Credentials = New Net.NetworkCredential("tsualumnitracer@gmail.com", "Kjhjt87651")
            Smtp_Server.Port = 587
            Smtp_Server.EnableSsl = True
            Smtp_Server.Host = "smtp.gmail.com"

            e_mail = New MailMessage()
            e_mail.From = New MailAddress("tsualumnitracer@gmail.com")
            e_mail.To.Add(emailAdd)
            e_mail.Subject = "Congratulations! Approval Notification"
            e_mail.IsBodyHtml = True
            e_mail.Body = "Hello! " + name + ", This is to notify you that your account has been verified and approved. Here's your Student ID Number " + id + ", Please log in here : <a href='http://tsualumnitracer-001-site1.smarterasp.net/'> Home </a> "

            Smtp_Server.Send(e_mail)
            Return "Mail Sent"

        Catch error_t As Exception
            Return error_t.ToString
        End Try
    End Function

    'REJECT ACCOUNT
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function rejectAccount(ByVal accIdTobeRejected As String) As String
        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using dat = New SqlDataAdapter("UPDATE tblAccounts SET account_status = 3 WHERE account_idpk = '" & accIdTobeRejected & "' ", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)


                Dim accIdPK As String = GetJson2(table2)
                Return accIdTobeRejected
            End Using

            sqlCon.Close()
        End Using

    End Function

    'FETCH ACCOUNT INFO
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

    'UPDATE STUDENT NUMBER
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function updateStudentNumber(ByVal accId As String, ByVal studNmber As String) As String

        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using dat = New SqlDataAdapter("UPDATE tblAccounts set student_id = '" & studNmber & "' WHERE account_idpk = '" & accId & "'", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)


                Dim accIdPK As String = GetJson2(table2)
                Return accId
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
            Image2.ID = "mon"
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", Session("id"))
                dr = cmd.ExecuteReader

                While dr.Read
                    alumni_name.Text = dr.GetString(6)
                    account_idpk.Text = CStr(Session("id"))

                End While

                sqlCon.Close()
            End Using
        End If
    End Sub

    'LOG OUT
    Protected Sub alumni_logout_Click(sender As Object, e As EventArgs) Handles alumni_logout.ServerClick
        Session.Abandon()
        Response.Redirect("default.aspx")
    End Sub
End Class
