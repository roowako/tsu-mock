Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Imports System.Net
Imports System.Net.Mail
Imports System.IO


Partial Class rev_password_recovery
    Inherits System.Web.UI.Page


    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property mailing As String
    Public Shared Property imgPath As String
    Public Shared Property name As String
    Public Shared Property um As String


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
    Public Shared Function pullMail(ByVal r As String) As String

        Dim uid As Integer

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT account_idpk as aid,given_name+ ' ' +middle_name+ ' ' +family_name as u,email_address as um,img_path as imp  FROM tblAccounts WHERE email_address = @p1 OR student_id = @p1 OR given_name+ ' ' +middle_name+ ' ' +family_name = @p1 OR telephone_number = @p1 AND account_status = 1 ", sqlCon)
            cmd.Parameters.AddWithValue("@p1", r)

            dr = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()

                uid = dr.GetValue(0)
                name = dr.GetString(1)
                um = dr.GetString(2)
                imgPath = dr.GetString(3)


            Else
                Return "None"
            End If


            sqlCon.Close()
        End Using

    End Function



    Public Sub sendResetTemplate()
        Dim strReader As New StreamReader(Server.MapPath("./resetTemplate.html"))
        Dim readFile As String = strReader.ReadToEnd()
        Dim m As New MailMessage()
        Dim stringify As String = ""
        Dim clean As String
        clean = imgPath.Remove(0, 2)
        stringify = readFile
        Dim plainView As AlternateView = AlternateView.CreateAlternateViewFromString("Password reset notification", Nothing, "text/plain")
        Dim htmlViewas As AlternateView = AlternateView.CreateAlternateViewFromString("<img src=cid:tsulogo>", Nothing, "text/html")
        Dim logo As New LinkedResource("C:\Users\Mac\Desktop\tsu-mock\rev\assets\uploads13929_857219780957439_7106738958723258341_n")
        logo.ContentId = "tsulogo"
        htmlViewas.LinkedResources.Add(logo)


       



       

        m.AlternateViews.Add(plainView)
        m.AlternateViews.Add(htmlViewas)

        m.From = New MailAddress("tsualumnitracer@gmail.com")
        m.To.Add(um.ToString())
        m.Subject = "Password Reset"
        m.Body = stringify.ToString()
        m.IsBodyHtml = True
        Dim smtp As New SmtpClient()
        smtp.Host = "smtp.gmail.com"
        smtp.EnableSsl = True
        Dim credentials As New NetworkCredential
        credentials.UserName = "tsualumnitracer@gmail.com"
        credentials.Password = "Kjhjt8765"
        smtp.UseDefaultCredentials = True
        smtp.Credentials = credentials
        smtp.Port = 587
        smtp.Send(m)
        strReader.Dispose()

    End Sub

    Protected Sub sendResetTemplate(sender As Object, e As EventArgs) Handles trigger.Click
        sendResetTemplate()

    End Sub
End Class
