Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Imports System.IO
Imports System.Net
Imports System.Net.Mail

Partial Class reset_password
    Inherits System.Web.UI.Page


    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;MultipleActiveResultSets=True;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property name As String
    Public Shared Property um As String
    Public Shared Property uidu As String


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim uid As Integer

        If Integer.TryParse(Request.Params("id"), uid) Then

            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT given_name as u,email_address FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", uid)
                dr = cmd.ExecuteReader

                While dr.Read
                    If IsDBNull(dr(0)) OrElse String.IsNullOrEmpty(dr.GetString(0)) Then
                        u.Text = ""
                        umail.Text = ""
                    Else
                        name = dr.GetString(0)
                        u.Text = dr.GetString(0)
                        uid_u.Text = uid
                        umail.Text = dr.GetString(1)
                        um = dr.GetString(1)
                        uidu = uid
                    End If

                End While

                sqlCon.Close()
            End Using

        End If

    End Sub
    'Serializer
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

    'Update
    <System.Web.Services.WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function update(ByVal uid As Integer, ByVal p As String, ByVal umail As String) As String

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            sqlStr = "UPDATE tblAccounts SET password = '" & p & "' WHERE account_idpk = '" & uid & "' "


            cmd = New SqlCommand(sqlStr, sqlCon)
            dr = cmd.ExecuteReader

            Return "Congrats! Your account password was changed successfully."


            sqlCon.Close()
        End Using



    End Function

    Public Sub mailNoti()


        Dim m As New MailMessage()
        Dim stringify As String = String.Empty
        Dim reader As StreamReader = New StreamReader(Server.MapPath("./passnoti.html"))

        stringify = reader.ReadToEnd
        stringify = stringify.Replace("{u}", name)

        stringify = stringify.Replace("{umail}", um)

        m.From = New MailAddress("TSU Alumni Tracer <tsualumnitracer@gmail.com>")
        m.To.Add(um.ToString())
        m.Subject = "Password Reset"
        m.Body = stringify
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

        Try
            smtp.Send(m)
            reader.Close()
            Response.Redirect("./Default.aspx")
        Catch error_t As Exception
            Response.Write(error_t.ToString)
        End Try

    End Sub

    

    Protected Sub mailNoti(sender As Object, e As EventArgs) Handles trigger.Click
        mailNoti()
    End Sub
End Class
