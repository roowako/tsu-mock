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
            cboPending_Surveys.Items.Clear()

            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT * FROM surveyoption_tbl", sqlCon)
                dr = cmd.ExecuteReader

                While dr.Read
                    cboPending_Surveys.Items.Add(dr.GetString(3))
                End While

                sqlCon.Close()
            End Using
        End If
    End Sub
End Class
