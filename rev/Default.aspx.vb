Imports System.Data.SqlClient
Imports System.Data

Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic

Partial Class _Default
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=.\SQLEXPRESS;Initial Catalog=tsuat_db;User ID=sa;Password=masterfile"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String

    Dim course_id As Integer
    Dim account_status As Integer

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
    Public Shared Function fetchCourseByIdfk(ByVal collegeFk As String) As String
        ' 'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database

        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            sqlStr = " SELECT college_idpk FROM tblColleges WHERE description = '" & collegeFk & "' "
            cmd = New SqlCommand(sqlStr, sqlCon)
            Dim getFk As Integer = CInt(cmd.ExecuteScalar())
            cmd.ExecuteNonQuery()


            Using dat = New SqlDataAdapter("SELECT description FROM tblCourses WHERE college_idfk = '" & getFk & "' ", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)


                Dim pollOptionsJsonData As String = GetJson(table2)
                Return pollOptionsJsonData
            End Using




            sqlCon.Close()

            'Returning Message : Fail or Successful

        End Using

    End Function

    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pushToserver(ByVal studeNumber As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()

            sqlStr = "INSERT INTO tblTokens(token) VALUES(@id)"

            cmd = New SqlCommand(sqlStr, sqlCon)
            cmd.Parameters.AddWithValue("@id", studeNumber)

            cmd.ExecuteNonQuery()





            sqlCon.Close()

            'Returning Message : Fail or Successful
            Return studeNumber

        End Using

    End Function

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            fetch_college()
            'DISREGARD PAGE LOAD FUNCTION ON POSTBACK
        Else

        End If
    End Sub

    Protected Sub creatBtn_Click(sender As Object, e As EventArgs) Handles creatBtn.Click
        If txtEmail.Text = txtConfirm_Email.Text Then
            If grad.Checked = True Then
                If txtAccountPassword.Text = txtRetypePassword.Text Then
                    If cboMarital_Status.Text = "Married" And cboGender.Text = "Female" And txtMaiden_Name.Text <> vbNullString Then
                        Response.Write(<script>alert("Maiden name is required.")</script>)
                    Else
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
                    End If
                Else
                    Response.Write(<script>alert("Email address do not match.")</script>)
                End If
            ElseIf alumni.Checked = True Then
                If employed_yes.Checked = True Then
                    employed() 'sub for employed option
                ElseIf employed_no.Checked = True Then
                    unemployed() 'sub for unemployed option
                ElseIf employed_no.Checked = False And employed_yes.Checked = False Then
                    Response.Write(<script>alert("Please select employment status.")</script>)
                End If
            End If
        Else
            Response.Write(<script>alert("Email address do not match.")</script>)
        End If
    End Sub

    'functions
    Sub new_traps()
        If cboGender.SelectedItem.Text = "Female" And cboMarital_Status.SelectedItem.Text = "Married" And txtMaiden_Name.Text = vbNullString Then
            Response.Write(<script>alert("Maiden name is required.")</script>)
        ElseIf txtEmail.Text <> txtConfirm_Email.Text Then
            Response.Write(<script>alert("Email address do not match.")</script>)
        ElseIf txtPassword.Text <> txtAccountPassword.Text Then
            Response.Write(<script>alert("Passwords do not match.")</script>)
        Else
            If grad.Checked = True And token.Text = vbNullString Then
                Response.Write(<script>alert("Token is required for graduating students.")</script>)
            ElseIf txtStudent_Number.Text <> vbNullString Then
                check_studentid()
            Else

            End If
        End If
    End Sub

    Sub check_studentid()
        If txtStudent_Number.Text = vbNullString Then
            Response.Write(<script>alert("Email address do not match.")</script>)
        Else
            Using sqlcon As New SqlConnection
                sqlcon.Open()

                cmd = New SqlCommand("SELECT graduate_idpk FROM tblGraduates WHERE student_id=@p1", sqlcon)
                cmd.Parameters.AddWithValue("@p1", txtStudent_Number.Text)
                dr = cmd.ExecuteReader

                If dr.HasRows Then

                Else

                End If

                sqlcon.Close()
            End Using
        End If
    End Sub

    Sub fetch_college()
        cboCollege.Items.Clear()
        cboCollege.Items.Add(" ")

        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("SELECT description from tblColleges", sqlcon)
            dr = cmd.ExecuteReader

            Do While dr.Read
                cboCollege.Items.Add(dr.GetString(0))
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

            Response.Write(<script>alert("aw")</script>)
        End Using
    End Sub



    Sub add_account()
        fetch_course_id() 'fetch course id

        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("INSERT INTO tblAccounts(userlevel_idfk,course_idfk,student_id,password,family_name,given_name,middle_name,maiden_name,address,telephone_number,email_address,birthday,citizenship,religion,marital_status,gender,account_status) VALUES(@p1,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13,@p14,@p15,@p16,@p17,@p18)", sqlcon)
            cmd.Parameters.AddWithValue("@p1", 1)
            cmd.Parameters.AddWithValue("@p3", course_id)
            cmd.Parameters.AddWithValue("@p4", txtStudent_Number.Text)
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

    Sub unemployed()
        If emp_status_no.SelectedItem Is Nothing Then
            Response.Write(<script>alert("Please select unemployment status.")</script>)
        Else
            'proceed to registration, null value on survey
        End If
    End Sub

    Sub employed()
        If first_emp.SelectedItem Is Nothing Or field_relation.SelectedItem Is Nothing Or employment_location.SelectedItem Is Nothing Or company_classification.SelectedItem Is Nothing Then

        End If
    End Sub
End Class
