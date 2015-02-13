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
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using da = New SqlDataAdapter(" SELECT * FROM tblAccounts WHERE account_status = 0 ", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using

            sqlCon.Close()

            'Returning Message : Fail or Successful


        End Using

    End Function


    <System.Web.Services.WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function approveAccount(ByVal accId As String, ByVal emailAdd As String, ByVal name As String, ByVal id As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database
        Try
            Dim Smtp_Server As New SmtpClient
            Dim e_mail As New MailMessage()
            Smtp_Server.UseDefaultCredentials = False
            Smtp_Server.Credentials = New Net.NetworkCredential("roowbergonia@gmail.com", "castme30")
            Smtp_Server.Port = 587
            Smtp_Server.EnableSsl = True
            Smtp_Server.Host = "smtp.gmail.com"

            e_mail = New MailMessage()
            e_mail.From = New MailAddress("roowbergonia@gmail.com")
            e_mail.To.Add(emailAdd)
            e_mail.Subject = "Congratulations! This is to notify you that your account has been approved."
            e_mail.IsBodyHtml = True
            e_mail.Body = "Hello! " + name + ", This is to notify you that your account has been verified and approved. Here's your Student ID Number " + id + ", Please log in here : <a href='Default.aspx'> Home </a> "


            Smtp_Server.Send(e_mail)
            MsgBox("Mail Sent")

        Catch error_t As Exception
            MsgBox(error_t.ToString)
        End Try



        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using dat = New SqlDataAdapter("UPDATE tblAccounts SET account_status = 1 WHERE account_idpk = '" & accId & "' ", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)

                Dim accIdPK As String = GetJson2(table2)
                Return accId
            End Using

            sqlCon.Close()

            'Returning Message : Fail or Successful
        End Using

    End Function


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

            'Returning Message : Fail or Successful
        End Using

    End Function
    <System.Web.Services.WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function fetchAccountInfo(ByVal accId As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using dat = New SqlDataAdapter("SELECT * FROM tblAccounts WHERE account_idpk = '" & accId & "'", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)


                Dim accIdPK As String = GetJson2(table2)
                Return accIdPK
            End Using

            sqlCon.Close()

            'Returning Message : Fail or Successful
        End Using

    End Function

    <System.Web.Services.WebMethod()> _
  <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function updateStudentNumber(ByVal accId As String, ByVal studNmber As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using dat = New SqlDataAdapter("UPDATE tblAccounts set student_id = '" & studNmber & "' WHERE account_idpk = '" & accId & "'", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)


                Dim accIdPK As String = GetJson2(table2)
                Return accId
            End Using




            sqlCon.Close()

            'Returning Message : Fail or Successful


        End Using

    End Function
End Class
