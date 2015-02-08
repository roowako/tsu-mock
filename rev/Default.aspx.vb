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

    Public Shared Property constr As String = "Data Source=.\SQLEXPRESS;Initial Catalog=tsuat_db;Persist Security Info=True;User ID=sa;Password=masterfile"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String

    Public Shared Property student_status As String
    Public Shared Property employement_status As String
    Public Shared Property nature_appointment As String
    Dim isEmployed As Boolean
    Dim course_id As String

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
        End Using

    End Function

    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function login(ByVal log_username As String, ByVal log_password As String) As String
        Dim userlevel As Integer
        Dim isAble As Boolean = False
        Dim name As String
        Dim id As Integer

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE student_id=@p1 AND password=@p2 AND account_status=@p3", sqlCon)
            cmd.Parameters.AddWithValue("@p1", log_username)
            cmd.Parameters.AddWithValue("@p2", log_password)
            cmd.Parameters.AddWithValue("@p3", 1)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                userlevel = 0
                isAble = True

                dr.Read()
                name = dr.GetString(6) + " " + dr.GetString(7) + " " + dr.GetString(5)
            End If

            sqlCon.Close()
        End Using

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT * FROM coordinatoraccount_tbl WHERE coordinator_username=@p1 AND coordinator_password=@p2 AND status=@p3", sqlCon)
            cmd.Parameters.AddWithValue("@p1", log_username)
            cmd.Parameters.AddWithValue("@p2", log_password)
            cmd.Parameters.AddWithValue("@p3", 1)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                userlevel = 1
                isAble = True
            End If

            sqlCon.Close()
        End Using

        If isAble = False Then
            Return "Login failed. Please check your username or password."
        Else
            If userlevel = 0 Then
                Return "alumni"
            ElseIf userlevel = 1 Then
                Return "admin"
            End If
        End If
    End Function

    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pushToserver(ByVal highest_education As String, ByVal higher_education As String, ByVal self_employed_stats As String, ByVal q7 As String, ByVal q6 As String, ByVal q5 As String, ByVal q4 As String, ByVal q3 As String, ByVal q2 As String, ByVal q1 As String, ByVal unemp_status As String, ByVal emp_status As String, ByVal student_status As String, ByVal college As String, ByVal token As String, ByVal course_desc As String, ByVal studNumber As String, ByVal password As String, ByVal family_name As String, ByVal given_name As String, ByVal middle_name As String, ByVal maiden_name As String, ByVal address As String, ByVal mobile_number As String, ByVal email_address As String, ByVal bday_month As String, ByVal bday_day As String, ByVal bday_year As String, ByVal citizenship As String, ByVal religion As String, ByVal marital_status As String, ByVal gender As String, ByVal account_status As String) As String
        Dim isGraduate As Boolean
        Dim studentid_duplicate As Boolean
        Dim tokenStatus As Boolean
        Dim token_id As Integer
        Dim college_id As Integer
        Dim course_id As Integer
        Dim account_id As Integer

        If student_status = "grad" Then
            'fetch college id
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT college_idpk FROM tblColleges WHERE description = @p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", college)
                dr = cmd.ExecuteReader

                Do While dr.Read
                    college_id = dr.GetValue(0)
                Loop

                sqlCon.Close()
            End Using

            'check tokens
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT token_idpk FROM tblTokens WHERE college_idfk = @p1 AND description = @p2 AND status = @p3", sqlCon)
                cmd.Parameters.AddWithValue("@p1", college_id)
                cmd.Parameters.AddWithValue("@p2", token)
                cmd.Parameters.AddWithValue("@p3", 0)
                dr = cmd.ExecuteReader

                If dr.HasRows Then
                    tokenStatus = True
                    dr.Read()
                    token_id = dr.GetValue(0)
                    dr.Close()
                Else
                    tokenStatus = False
                End If

                sqlCon.Close()
            End Using

            'get course id
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT course_idpk FROM tblCourses WHERE description=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", course_desc)
                dr = cmd.ExecuteReader

                Do While dr.Read
                    course_id = dr.GetValue(0)
                Loop

                sqlCon.Close()
            End Using

            'check duplicate student number
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT student_id FROM tblAccounts WHERE student_id=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", studNumber)
                dr = cmd.ExecuteReader

                If dr.HasRows Then
                    studentid_duplicate = True
                Else
                    studentid_duplicate = False
                End If

                sqlCon.Close()
            End Using

            'CHECK IF ABLE THEN REGISTER
            If tokenStatus = False Then
                Return "Cannot continue, token is not valid."
            ElseIf studentid_duplicate = True Then
                Return "Student number already exists in the database."
            Else
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()

                    cmd = New SqlCommand("INSERT INTO tblAccounts(userlevel_idfk,course_idfk,student_id,password,family_name,given_name,middle_name,maiden_name,address,telephone_number,email_address,birthday,citizenship,religion,marital_status,gender,account_status) VALUES(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13,@p14,@p15,@p16,@p17)", sqlCon)
                    cmd.Parameters.AddWithValue("@p1", 1)
                    cmd.Parameters.AddWithValue("@p2", course_id)
                    cmd.Parameters.AddWithValue("@p3", studNumber)
                    cmd.Parameters.AddWithValue("@p4", password)
                    cmd.Parameters.AddWithValue("@p5", family_name)
                    cmd.Parameters.AddWithValue("@p6", given_name)
                    cmd.Parameters.AddWithValue("@p7", middle_name)
                    cmd.Parameters.AddWithValue("@p8", maiden_name)
                    cmd.Parameters.AddWithValue("@p9", address)
                    cmd.Parameters.AddWithValue("@p10", mobile_number)
                    cmd.Parameters.AddWithValue("@p11", email_address)
                    cmd.Parameters.AddWithValue("@p12", Date.Parse(bday_year + "-" + bday_month + "-" + bday_day))
                    cmd.Parameters.AddWithValue("@p13", citizenship)
                    cmd.Parameters.AddWithValue("@p14", religion)
                    cmd.Parameters.AddWithValue("@p15", marital_status)
                    cmd.Parameters.AddWithValue("@p16", gender)
                    cmd.Parameters.AddWithValue("@p17", 1)
                    cmd.ExecuteNonQuery()
                    sqlCon.Close()
                End Using

                'update used token
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()

                    cmd = New SqlCommand("UPDATE tblTokens SET status=1 WHERE token_idpk=@p1", sqlCon)
                    cmd.Parameters.AddWithValue("@p1", token_id)
                    cmd.ExecuteNonQuery()

                    sqlCon.Close()
                End Using

                'end of registration (graduating)
                Return "You are registered as Graduating student."
            End If
        ElseIf student_status = "alumni" Then
            Using sqlCon As New SqlConnection(constr) 'get course id
                sqlCon.Open()

                cmd = New SqlCommand("SELECT course_idpk FROM tblCourses WHERE description=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", course_desc)
                dr = cmd.ExecuteReader

                Do While dr.Read
                    course_id = dr.GetValue(0)
                Loop

                sqlCon.Close()
            End Using

            Using sqlCon As New SqlConnection(constr) 'check graduate data
                sqlCon.Open()

                cmd = New SqlCommand("SELECT graduate_idpk FROM tblGraduates WHERE student_id = @p1 AND birthday = @p2 AND course_idfk = @p3", sqlCon)
                cmd.Parameters.AddWithValue("@p1", studNumber)
                cmd.Parameters.AddWithValue("@p2", Date.Parse(bday_year + "-" + bday_month + "-" + bday_day))
                cmd.Parameters.AddWithValue("@p3", course_id)
                dr = cmd.ExecuteReader

                If dr.HasRows Then
                    isGraduate = True
                Else
                    isGraduate = False
                End If

                sqlCon.Close()
            End Using

            If studNumber = vbNullString Then
                Using sqlCon As New SqlConnection(constr) 'insert account and get identity
                    Using cmd As New SqlCommand("INSERT INTO tblAccounts(userlevel_idfk,course_idfk,student_id,password,family_name,given_name,middle_name,maiden_name,address,telephone_number,email_address,birthday,citizenship,religion,marital_status,gender,account_status) VALUES(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13,@p14,@p15,@p16,@p17)", sqlCon)
                        cmd.Parameters.AddWithValue("@p1", 2)
                        cmd.Parameters.AddWithValue("@p2", course_id)
                        cmd.Parameters.AddWithValue("@p3", studNumber)
                        cmd.Parameters.AddWithValue("@p4", password)
                        cmd.Parameters.AddWithValue("@p5", family_name)
                        cmd.Parameters.AddWithValue("@p6", given_name)
                        cmd.Parameters.AddWithValue("@p7", middle_name)
                        cmd.Parameters.AddWithValue("@p8", maiden_name)
                        cmd.Parameters.AddWithValue("@p9", address)
                        cmd.Parameters.AddWithValue("@p10", mobile_number)
                        cmd.Parameters.AddWithValue("@p11", email_address)
                        cmd.Parameters.AddWithValue("@p12", Date.Parse(bday_year + "-" + bday_month + "-" + bday_day))
                        cmd.Parameters.AddWithValue("@p13", citizenship)
                        cmd.Parameters.AddWithValue("@p14", religion)
                        cmd.Parameters.AddWithValue("@p15", marital_status)
                        cmd.Parameters.AddWithValue("@p16", gender)
                        cmd.Parameters.AddWithValue("@p17", 0)

                        sqlCon.Open()
                        cmd.ExecuteNonQuery()
                        Dim identity_qry As String = "Select @@Identity"
                        cmd.CommandText = identity_qry
                        account_id = cmd.ExecuteScalar
                        sqlCon.Close()
                    End Using
                End Using

                Using sqlCon As New SqlConnection(constr) 'add survey for the account
                    sqlCon.Open()

                    cmd = New SqlCommand("INSERT INTO tblEmployment(account_idfk,employment_status,q1,q2,q3,q4,q5,q6,q7,unemployed_status,selfemployed_status,further_study,highest_educ_attainment) VALUES(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13)", sqlCon)
                    cmd.Parameters.AddWithValue("@p1", account_id)
                    cmd.Parameters.AddWithValue("@p2", emp_status)
                    cmd.Parameters.AddWithValue("@p3", q1)
                    cmd.Parameters.AddWithValue("@p4", q2)
                    cmd.Parameters.AddWithValue("@p5", q3)
                    cmd.Parameters.AddWithValue("@p6", q4)
                    cmd.Parameters.AddWithValue("@p7", q5)
                    cmd.Parameters.AddWithValue("@p8", q6)
                    cmd.Parameters.AddWithValue("@p9", q7)
                    cmd.Parameters.AddWithValue("@p10", unemp_status)
                    cmd.Parameters.AddWithValue("@p11", self_employed_stats)
                    cmd.Parameters.AddWithValue("@p12", higher_education)
                    cmd.Parameters.AddWithValue("@p13", highest_education)
                    cmd.ExecuteNonQuery()
                    sqlCon.Close()
                End Using

                Return "Registration successful, your account is under review due to lack of information. Please wait for your account to be activated."
            Else
                If isGraduate = True Then
                    Using sqlCon As New SqlConnection(constr) 'insert account and get identity
                        Using cmd As New SqlCommand("INSERT INTO tblAccounts(userlevel_idfk,course_idfk,student_id,password,family_name,given_name,middle_name,maiden_name,address,telephone_number,email_address,birthday,citizenship,religion,marital_status,gender,account_status) VALUES(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13,@p14,@p15,@p16,@p17)", sqlCon)
                            cmd.Parameters.AddWithValue("@p1", 1)
                            cmd.Parameters.AddWithValue("@p2", course_id)
                            cmd.Parameters.AddWithValue("@p3", studNumber)
                            cmd.Parameters.AddWithValue("@p4", password)
                            cmd.Parameters.AddWithValue("@p5", family_name)
                            cmd.Parameters.AddWithValue("@p6", given_name)
                            cmd.Parameters.AddWithValue("@p7", middle_name)
                            cmd.Parameters.AddWithValue("@p8", maiden_name)
                            cmd.Parameters.AddWithValue("@p9", address)
                            cmd.Parameters.AddWithValue("@p10", mobile_number)
                            cmd.Parameters.AddWithValue("@p11", email_address)
                            cmd.Parameters.AddWithValue("@p12", Date.Parse(bday_year + "-" + bday_month + "-" + bday_day))
                            cmd.Parameters.AddWithValue("@p13", citizenship)
                            cmd.Parameters.AddWithValue("@p14", religion)
                            cmd.Parameters.AddWithValue("@p15", marital_status)
                            cmd.Parameters.AddWithValue("@p16", gender)
                            cmd.Parameters.AddWithValue("@p17", 1)

                            sqlCon.Open()
                            cmd.ExecuteNonQuery()
                            Dim identity_qry As String = "Select @@Identity"
                            cmd.CommandText = identity_qry
                            account_id = cmd.ExecuteScalar
                            sqlCon.Close()
                        End Using
                    End Using

                    Using sqlCon As New SqlConnection(constr) 'add survey for the account
                        sqlCon.Open()

                        cmd = New SqlCommand("INSERT INTO tblEmployment(account_idfk,employment_status,q1,q2,q3,q4,q5,q6,q7,unemployed_status,selfemployed_status,further_study,highest_educ_attainment) VALUES(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13)", sqlCon)
                        cmd.Parameters.AddWithValue("@p1", account_id)
                        cmd.Parameters.AddWithValue("@p2", emp_status)
                        cmd.Parameters.AddWithValue("@p3", q1)
                        cmd.Parameters.AddWithValue("@p4", q2)
                        cmd.Parameters.AddWithValue("@p5", q3)
                        cmd.Parameters.AddWithValue("@p6", q4)
                        cmd.Parameters.AddWithValue("@p7", q5)
                        cmd.Parameters.AddWithValue("@p8", q6)
                        cmd.Parameters.AddWithValue("@p9", q7)
                        cmd.Parameters.AddWithValue("@p10", unemp_status)
                        cmd.Parameters.AddWithValue("@p11", self_employed_stats)
                        cmd.Parameters.AddWithValue("@p12", higher_education)
                        cmd.Parameters.AddWithValue("@p13", highest_education)
                        cmd.ExecuteNonQuery()
                        sqlCon.Close()
                    End Using

                    Return "Registration successful."
                Else
                    Return "Registration failed, please check your student id. Leave it blank if you cannot remember it."
                End If
            End If
        End If
    End Function

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            fetch_college()

            'DISREGARD PAGE LOAD FUNCTION ON POSTBACK
        Else

        End If

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim userlevel As Integer
        Dim isAble As Boolean = False
        Dim id As Integer

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE student_id=@p1 AND password=@p2 AND account_status=@p3", sqlCon)
            cmd.Parameters.AddWithValue("@p1", txtLog_Username.Text)
            cmd.Parameters.AddWithValue("@p2", txtLog_Password.Text)
            cmd.Parameters.AddWithValue("@p3", 1)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                userlevel = 0
                isAble = True

                dr.Read()
                id = dr.GetValue(0)
            End If

            sqlCon.Close()
        End Using

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT * FROM coordinatoraccount_tbl WHERE coordinator_username=@p1 AND coordinator_password=@p2 AND status=@p3", sqlCon)
            cmd.Parameters.AddWithValue("@p1", txtLog_Username.Text)
            cmd.Parameters.AddWithValue("@p2", txtLog_Password.Text)
            cmd.Parameters.AddWithValue("@p3", 1)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                userlevel = 1
                isAble = True

                dr.Read()
                id = dr.GetValue(0)
            End If

            sqlCon.Close()
        End Using

        If isAble = False Then
            login_result.ForeColor = Drawing.Color.Red
            login_result.Text = "Invalid username or password."
        Else
            If userlevel = 0 Then
                Session("alumni_id") = id
                Response.Redirect("home.aspx")
            ElseIf userlevel = 1 Then
                Session("alumni_id") = id
                Response.Redirect("director-ui.aspx")
            End If
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
End Class
