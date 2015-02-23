Imports System.Data.SqlClient
Imports System.Data

Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Imports System.Web.Services

Partial Class loginpage
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String

    'LOGIN
    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim user_level As Integer = 10
        Dim user_id As Integer
        Dim college_id As Integer

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            cmd = New SqlCommand("SELECT account_idpk,userlevel_idfk,college_idfk FROM tblAccounts WHERE student_id=@p1 AND password=@p2 AND account_status=1", sqlCon)
            cmd.Parameters.AddWithValue("@p1", txtLog_Username.Text)
            cmd.Parameters.AddWithValue("@p2", txtLog_Password.Text)

            dr = cmd.ExecuteReader

            If dr.HasRows Then
                dr.Read()
                user_id = dr.GetValue(0)
                user_level = dr.GetValue(1)
                college_id = dr.GetValue(2)
            End If

            sqlCon.Close()
        End Using

        If user_level = 0 Then
            Session("id") = user_id
            Session("dynamic_link") = "./home.aspx"

            Response.Redirect("home.aspx")
        ElseIf user_level = 1 Then
            Session("id") = user_id
            Response.Redirect("home.aspx")
            Session("dynamic_link") = "./home.aspx"
        ElseIf user_level = 2 Then
            Session("id") = user_id
            Session("college_id") = college_id
            Response.Redirect("coordinator-custom.aspx")
            Session("dynamic_link") = "./coordinator-custom..aspx"
        ElseIf user_level = 3 Then
            Session("id") = user_id
            Response.Redirect("director-ui.aspx")
            Session("dynamic_link") = "./director-ui.aspx"
        Else
            Response.Write(<script>alert("Login Failed.")</script>)
        End If
    End Sub

    'PAGE LOAD
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Label1.Text = Session.Count

        If Session.Count > 1 Then
            Response.Write(<script>alert("A user is already logged in.");</script>)
        Else

            If Session.Item("id") <> Nothing Then


                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()

                    cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
                    cmd.Parameters.AddWithValue("@p1", Session("id"))
                    dr = cmd.ExecuteReader

                    While dr.Read
                        If dr("userlevel_idfk") = 0 Or dr("userlevel_idfk") = 1 Then
                            Response.Redirect("home.aspx")
                        ElseIf dr("userlevel_idfk") = 2 Then
                            Session("college_id") = dr("college_idfk")
                            Response.Redirect("coordinator-custom.aspx")
                        ElseIf dr("userlevel_idfk") = 3 Then
                            Response.Redirect("director-ui.aspx")
                        End If

                    End While

                    sqlCon.Close()
                End Using



            End If
        End If




    End Sub
End Class
