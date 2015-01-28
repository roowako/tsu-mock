Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim constr As String = "Data Source=.\SQLEXPRESS2005;Initial Catalog=tsuat_db;User ID=sa;Password=segatronph12"
    Dim sqlcon As New SqlConnection
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader

    Dim college_id As Integer
    Dim course_id As Integer
    Dim account_status As Integer

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            'DISREGARD PAGE LOAD FUNCTION ON POSTBACK
        Else
            fetch_college()
        End If
    End Sub

    Protected Sub cboCollege_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboCollege.SelectedIndexChanged
        fetch_college_id()
        fetch_course()
    End Sub

    Protected Sub cboCourse_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboCourse.SelectedIndexChanged
        fetch_college_id()
    End Sub

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
                            Else
                                Response.Write(<script>Alert("Invalid token.")</script>) 'invalid token.
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
                'for alumni code ------
            End If
        Else
            Response.Write(<script>alert("Email address do not match.")</script>)
        End If
    End Sub

    'functions
    Sub fetch_college()
        cboCollege.Items.Clear()
        cboCollege.Items.Add(" ")

        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("SELECT description FROM tblColleges", sqlcon)
            dr = cmd.ExecuteReader

            Do While dr.Read
                cboCollege.Items.Add(dr.GetString(0))
            Loop

            sqlcon.Close()
        End Using
    End Sub

    Sub fetch_college_id()
        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("SELECT college_idpk FROM tblColleges WHERE description=@p1", sqlcon)
            cmd.Parameters.AddWithValue("@p1", cboCollege.SelectedItem.Text)
            dr = cmd.ExecuteReader

            Do While dr.Read
                college_id = dr.GetValue(0)
            Loop

            sqlcon.Close()
        End Using
    End Sub

    Sub fetch_course()
        cboCourse.Items.Clear()
        cboCourse.Items.Add(" ")

        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("SELECT description from tblCourses WHERE college_idfk=@p1", sqlcon)
            cmd.Parameters.AddWithValue("@p1", college_id)
            dr = cmd.ExecuteReader

            Do While dr.Read
                cboCourse.Items.Add(dr.GetString(0))
            Loop

            sqlcon.Close()
        End Using
    End Sub

    Sub fetch_course_id()
        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("SELECT course_idpk from tblCourses WHERE description=@p1", sqlcon)
            cmd.Parameters.AddWithValue("@p1", cboCourse.Text)
            dr = cmd.ExecuteReader

            Do While dr.Read
                course_id = dr.GetValue(0)
            Loop

            sqlcon.Close()
        End Using
    End Sub

    Sub add_account()
        fetch_college_id() 'fetch college id
        fetch_course_id() 'fetch course id

        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("INSERT INTO tblAccounts(userlevel_idfk,college_idfk,course_idfk,student_id,password,family_name,given_name,middle_name,maiden_name,address,telephone_number,email_address,birthday,citizenship,religion,marital_status,gender,account_status) VALUES(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13,@p14,@p15,@p16,@p17,@p18)", sqlcon)
            cmd.Parameters.AddWithValue("@p1", 1)
            cmd.Parameters.AddWithValue("@p2", college_id)
            cmd.Parameters.AddWithValue("@p3", course_id)
            cmd.Parameters.AddWithValue("@p4", "NoStudID")
            cmd.Parameters.AddWithValue("@p5", txtAccountPassword.Text)
            cmd.Parameters.AddWithValue("@p6", txtFamily_Name.Text)
            cmd.Parameters.AddWithValue("@p7", txtGiven_Name.Text)
            cmd.Parameters.AddWithValue("@p8", txtMiddle_Name.Text)
            cmd.Parameters.AddWithValue("@p9", txtMaiden_Name.Text)
            cmd.Parameters.AddWithValue("@p10", txtAddress.Text)
            cmd.Parameters.AddWithValue("@p11", txtMobile_Number.Text)
            cmd.Parameters.AddWithValue("@p12", txtEmail.Text)
            cmd.Parameters.AddWithValue("@p13", Date.Parse(cboMonth.Text + " " + cboDay.Text + ", " + cboYear.Text))
            cmd.Parameters.AddWithValue("@p14", txtCitizenship.Text)
            cmd.Parameters.AddWithValue("@p15", txtReligion.Text)
            cmd.Parameters.AddWithValue("@p16", cboMarital_Status.Text)
            cmd.Parameters.AddWithValue("@p17", cboGender.Text)
            cmd.Parameters.AddWithValue("@p18", account_status)
            cmd.ExecuteNonQuery()

            sqlcon.Close()
        End Using
    End Sub
End Class
