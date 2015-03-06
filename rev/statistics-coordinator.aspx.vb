Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic

Partial Class statistics_coordinator
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String

    'PAGE LOAD
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session.Item("id") Is Nothing Then
            Console.Write("sd")
            Response.Redirect("Default.aspx")
        Else

            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT given_name,account_idpk,college_idfk,img_path FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", Session("id"))
                dr = cmd.ExecuteReader

                While dr.Read
                    If IsDBNull(dr(3)) OrElse String.IsNullOrEmpty(dr.GetString(3)) Then
                        alumni_name.Text = dr.GetString(0)
                        account_idpk.Text = CStr(dr.GetValue(1))
                        college_id.Text = CStr(dr.GetValue(2))

                        undeditable.ImageUrl = "./assets/images/default-dp.jpg"
                    Else
                        alumni_name.Text = dr.GetString(0)
                        account_idpk.Text = CStr(dr.GetValue(1))
                        college_id.Text = CStr(dr.GetValue(2))
                        undeditable.ImageUrl = dr.GetString(3)

                    End If
                   
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
