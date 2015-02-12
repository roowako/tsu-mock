Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic

Partial Class UI_profile
    Inherits System.Web.UI.Page
    Public Shared Property constr As String = "Data Source=.\SQLEXPRESS;Initial Catalog=tsuat_db;User ID=sa;Password=masterfile"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("alumni_id") = 0 Then
            Response.Redirect("default.aspx")
        Else
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", 13)
                dr = cmd.ExecuteReader

                While dr.Read
                    student_number.InnerText = dr.GetString(3)
                    name.InnerText = dr.GetString(6) + " " + dr.GetString(5) + ", " + dr.GetString(7)
                    birthday.InnerText = dr.GetDateTime(12).ToShortDateString()

                    email_address.InnerText = dr.GetString(11)
                    phone_number.InnerText = dr.GetString(10)
                End While

                sqlCon.Close()
            End Using
        End If
    End Sub

    Protected Sub btnUpdate_Email_Click(sender As Object, e As EventArgs) Handles btnUpdate_Email.Click
        If Session("alumni_id") <> 0 Then
            Response.Redirect("default.aspx")
        Else
            If new_email.Text <> cnew_email.Text Then

            Else
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()

                    cmd = New SqlCommand("UPDATE tblAccount SET email_address=@p1 WHERE account_idpk=@p2", sqlCon)
                    cmd.Parameters.AddWithValue("@p1", cnew_email.Text)
                    cmd.Parameters.AddWithValue("@p1", 13)
                    dr = cmd.ExecuteReader

                    While dr.Read
                        student_number.InnerText = dr.GetString(3)
                        name.InnerText = dr.GetString(6) + " " + dr.GetString(5) + ", " + dr.GetString(7)
                        birthday.InnerText = dr.GetDateTime(12).ToShortDateString()

                        email_address.InnerText = dr.GetString(11)
                        phone_number.InnerText = dr.GetString(10)
                    End While

                    sqlCon.Close()
                End Using
            End If
        End If
    End Sub
End Class
