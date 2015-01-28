Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim constr As String = "Data Source=.\SQLEXPRESS2005;Initial Catalog=tsuat_db;User ID=sa;Password=segatronph12"
    Dim sqlcon As New SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader

    Dim account_status As Integer

    Protected Sub creatBtn_Click(sender As Object, e As EventArgs) Handles creatBtn.Click
        If txtEmail.Text = txtConfirm_Email.Text Then
            If grad.Checked = True Then
                If txtAccountPassword.Text = txtRetypePassword.Text Then
                    If cboMarital_Status.Text = "Married" And txtMaiden_Name.Text <> vbNullString Then
                        Using sqlcon As New SqlConnection(constr)
                            sqlcon.Open()

                            cmd = New SqlCommand("SELECT token_idpk FROM tblTokens WHERE token=@p1 AND status=0", sqlcon)
                            cmd.Parameters.AddWithValue("@p1", token.Text)
                            dr = cmd.ExecuteReader

                            If dr.HasRows Then
                                account_status = 0
                                add_account() 'add account for graduating
                            End If

                            sqlcon.Close()
                        End Using
                    Else
                        Response.Write(<script>alert("Maiden name is required.")</script>)
                    End If
                Else
                    Response.Write(<script>alert("Email address do not match.")</script>)
                End If
            ElseIf alumni.Checked = True Then
                'for alumni code
            End If
        Else
            Response.Write(<script>alert("Email address do not match.")</script>)
        End If
    End Sub

    'functions
    Sub add_account()
        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("INSERT INTO tblAccounts(userlevel_idfk,college_idfk,course_idfk,username,password) VALUES(@p1,@p2,@p3,@p4,@p5)", sqlcon)
            cmd.Parameters.AddWithValue("@p1", 1)
            cmd.Parameters.AddWithValue("@p2", 1)
            cmd.Parameters.AddWithValue("@p3", 1)
            cmd.Parameters.AddWithValue("@p4", "NoStudID")
            cmd.Parameters.AddWithValue("@p5", txtAccountPassword.Text)
            cmd.ExecuteNonQuery()

            sqlcon.Close()
        End Using
    End Sub
End Class
