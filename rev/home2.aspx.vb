Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic

Partial Class home
    Inherits System.Web.UI.Page
    Public Shared Property constr As String = "Data Source=.\SQLEXPRESS;Initial Catalog=tsuat_db;User ID=sa;Password=masterfile"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'If Session("alumni_id") = 0 Then
        '   Response.Redirect("default.aspx")
        'Else
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
            cmd.Parameters.AddWithValue("@p1", 13)
            dr = cmd.ExecuteReader

            While dr.Read
                alumni_name.Text = dr.GetString(6) + " " + dr.GetString(5) + ", " + dr.GetString(7)
            End While

            sqlCon.Close()
        End Using

        'End If
    End Sub

    Protected Sub view_profile_Click(sender As Object, e As EventArgs) Handles view_profile.ServerClick
        frame1.Attributes("src") = "alumni/profile.aspx"
    End Sub

    Protected Sub alumni_logout_Click(sender As Object, e As EventArgs) Handles alumni_logout.ServerClick
        Session.Abandon()
        Response.Redirect("default.aspx")
    End Sub
End Class
