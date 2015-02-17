Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Imports System.Net
Imports System.Net.Mail

Partial Class rev_notification_center_ui
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getMail As String
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
    Public Shared Function pushNotification(ByVal notificationSMS As String, ByVal email As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()

            sqlStr = "INSERT INTO tblSms(message,status) VALUES(@p1,0)"

            cmd = New SqlCommand(sqlStr, sqlCon)
            cmd.Parameters.AddWithValue("@p1", notificationSMS)

            cmd.ExecuteNonQuery()

            getMail = "SELECT email_address FROM tblAccounts"
            cmd = New SqlCommand(getMail, sqlCon)
            cmd.ExecuteNonQuery()

            sqlCon.Close()



            Dim mm As New MailMessage()
            mm.From = New MailAddress("tsualumnitracer@gmail.com")
            For Each recipeients As String In email.Split(","c)
                mm.To.Add(recipeients)
            Next

            mm.Subject = "A friendly reminder"
            mm.Body = notificationSMS
            mm.IsBodyHtml = True
            Dim smtp As New SmtpClient()
            smtp.Host = "smtp.gmail.com"
            smtp.EnableSsl = True
            Dim NetworkCred As New NetworkCredential()
            NetworkCred.UserName = "tsualumnitracer@gmail.com"
            NetworkCred.Password = "Kjhjt8765"
            smtp.UseDefaultCredentials = True
            smtp.Credentials = NetworkCred
            smtp.Port = 587
            smtp.Send(mm)


            'Returning Message : Fail or Successful

            Return "Notification sent!"
        End Using

    End Function

    <System.Web.Services.WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullEmail() As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()


            Using da = New SqlDataAdapter(" SELECT email_address FROM tblAccounts ", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using



            sqlCon.Close()
            'Returning Message : Fail or Successful


        End Using

    End Function
End Class
