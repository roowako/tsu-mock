Imports System.Data.SqlClient
Imports System.Data

Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Imports System.Web.Services




Partial Class _Default
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
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


    'REGISTER GRADUATE
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function graduate_register(ByVal student_number As String, ByVal given_name As String, ByVal middle_name As String, ByVal family_name As String, ByVal maiden_name As String, ByVal gender As String, ByVal marital_status As String, ByVal address As String, ByVal birthday As String, ByVal birthplace As String, ByVal number As String, ByVal citizenship As String, ByVal religion As String, ByVal email As String, ByVal password As String, ByVal college As String, ByVal course As String, ByVal token As String) As String
        Dim college_id As Integer
        Dim course_id As Integer
        Dim token_id As Integer
        Dim tokenStatus As Boolean
        Dim duplicate As Boolean
        Dim duplicate_number As Boolean
        Dim duplicate_email As Boolean

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

        'get course id
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT course_idpk FROM tblCourses WHERE description=@p1", sqlCon)
            cmd.Parameters.AddWithValue("@p1", course)
            dr = cmd.ExecuteReader

            Do While dr.Read
                course_id = dr.GetValue(0)
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

        'check duplicate student number
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT student_id FROM tblAccounts WHERE student_id=@p1", sqlCon)
            cmd.Parameters.AddWithValue("@p1", student_number)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                duplicate = True
            Else
                duplicate = False
            End If

            sqlCon.Close()
        End Using

        'check duplicate mobile number
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT telephone_number FROM tblAccounts WHERE telephone_number=@p1", sqlCon)
            cmd.Parameters.AddWithValue("@p1", number)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                duplicate_number = True
            Else
                duplicate_number = False
            End If

            sqlCon.Close()
        End Using

        'check duplicate email
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT email_address FROM tblAccounts WHERE email_address=@p1", sqlCon)
            cmd.Parameters.AddWithValue("@p1", email)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                duplicate_email = True
            Else
                duplicate_email = False
            End If

            sqlCon.Close()
        End Using

        'register as graduate
        If duplicate = True Then
            Return "Student number is already taken."
        ElseIf duplicate_number = True Then
            Return "Mobile number is already taken."
        ElseIf duplicate_email = True Then
            Return "Email number is already taken."
        ElseIf tokenStatus = False Then
            Return "Invalid token."
        Else
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("INSERT INTO tblAccounts(userlevel_idfk,course_idfk,student_id,password,family_name,given_name,middle_name,maiden_name,address,telephone_number,email_address,birthday,citizenship,religion,marital_status,gender,account_status,college_idfk,year_graduated) VALUES(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13,@p14,@p15,@p16,@p17,@p18,@p19)", sqlCon)
                cmd.Parameters.AddWithValue("@p1", 0)
                cmd.Parameters.AddWithValue("@p2", course_id)
                cmd.Parameters.AddWithValue("@p3", student_number)
                cmd.Parameters.AddWithValue("@p4", password)
                cmd.Parameters.AddWithValue("@p5", family_name)
                cmd.Parameters.AddWithValue("@p6", given_name)
                cmd.Parameters.AddWithValue("@p7", middle_name)
                cmd.Parameters.AddWithValue("@p8", maiden_name)
                cmd.Parameters.AddWithValue("@p9", address)
                cmd.Parameters.AddWithValue("@p10", number)
                cmd.Parameters.AddWithValue("@p11", email)
                cmd.Parameters.AddWithValue("@p12", birthday)
                cmd.Parameters.AddWithValue("@p13", citizenship)
                cmd.Parameters.AddWithValue("@p14", religion)
                cmd.Parameters.AddWithValue("@p15", marital_status)
                cmd.Parameters.AddWithValue("@p16", gender)
                cmd.Parameters.AddWithValue("@p17", 1)
                cmd.Parameters.AddWithValue("@p18", college_id)
                cmd.Parameters.AddWithValue("@p19", Date.Now.Year.ToString)
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

                Return "Thank you for registering. You are registered as graduating. You can now login your account."
            End Using
        End If
    End Function

    'REGISTER ALUMNI
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function alumni_register(ByVal highest_education As String, ByVal higher_education As String, ByVal q7 As String, ByVal q6 As String, ByVal q5 As String, ByVal q4 As String, ByVal q3 As String, ByVal q2 As String, ByVal q1 As String, ByVal unemployed_status As String, ByVal employment_status As String, ByVal year_graduated As String, ByVal student_number As String, ByVal given_name As String, ByVal middle_name As String, ByVal family_name As String, ByVal maiden_name As String, ByVal gender As String, ByVal marital_status As String, ByVal address As String, ByVal birthday As String, ByVal birthplace As String, ByVal number As String, ByVal citizenship As String, ByVal religion As String, ByVal email As String, ByVal password As String, ByVal college As String, ByVal course As String) As String
        Dim college_id As Integer
        Dim course_id As Integer
        Dim duplicate As Boolean
        Dim duplicate_number As Boolean
        Dim duplicate_email As Boolean
        Dim isGraduate As Boolean
        Dim isForgot As Boolean
        Dim account_id As Integer
        Dim status As Integer

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

        'get course id
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT course_idpk FROM tblCourses WHERE description=@p1", sqlCon)
            cmd.Parameters.AddWithValue("@p1", course)
            dr = cmd.ExecuteReader

            Do While dr.Read
                course_id = dr.GetValue(0)
            Loop

            sqlCon.Close()
        End Using

        'check duplicate mobile number
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT telephone_number FROM tblAccounts WHERE telephone_number=@p1", sqlCon)
            cmd.Parameters.AddWithValue("@p1", number)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                duplicate_number = True
            Else
                duplicate_number = False
            End If

            sqlCon.Close()
        End Using

        'check duplicate email
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("SELECT email_address FROM tblAccounts WHERE email_address=@p1", sqlCon)
            cmd.Parameters.AddWithValue("@p1", email)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                duplicate_email = True
            Else
                duplicate_email = False
            End If

            sqlCon.Close()
        End Using

        If student_number = vbNullString Then
            isGraduate = False
            isForgot = True
            student_number = ""
        Else
            'check duplicate student number
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT student_id FROM tblAccounts WHERE student_id=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", student_number)
                dr = cmd.ExecuteReader

                If dr.HasRows Then
                    duplicate = True
                Else
                    duplicate = False
                End If

                sqlCon.Close()
            End Using

            'check graduate data
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT graduate_idpk FROM tblGraduates WHERE student_id = @p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", student_number)
                dr = cmd.ExecuteReader

                If dr.HasRows Then
                    isGraduate = True
                    status = 1
                Else
                    isGraduate = False
                    status = 0
                End If

                sqlCon.Close()
            End Using
        End If

        If duplicate = True Then
            Return "Student number is already taken."
        ElseIf duplicate_number = True Then
            Return "Mobile number is already taken."
        ElseIf duplicate_email = True Then
            Return "Email number is already taken."
        ElseIf isGraduate = False And student_number <> "" Then
            Return "No alumni/graduate records found. Please check your student number, birthday or year of graduation."
        Else
            Using sqlCon As New SqlConnection(constr) 'insert account and get identity
                Using cmd As New SqlCommand("INSERT INTO tblAccounts(userlevel_idfk,course_idfk,student_id,password,family_name,given_name,middle_name,maiden_name,address,telephone_number,email_address,birthday,citizenship,religion,marital_status,gender,account_status,college_idfk,year_graduated) VALUES(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13,@p14,@p15,@p16,@p17,@p18,@p19)", sqlCon)
                    cmd.Parameters.AddWithValue("@p1", 1)
                    cmd.Parameters.AddWithValue("@p2", course_id)
                    cmd.Parameters.AddWithValue("@p3", student_number)
                    cmd.Parameters.AddWithValue("@p4", password)
                    cmd.Parameters.AddWithValue("@p5", family_name)
                    cmd.Parameters.AddWithValue("@p6", given_name)
                    cmd.Parameters.AddWithValue("@p7", middle_name)
                    cmd.Parameters.AddWithValue("@p8", maiden_name)
                    cmd.Parameters.AddWithValue("@p9", address)
                    cmd.Parameters.AddWithValue("@p10", number)
                    cmd.Parameters.AddWithValue("@p11", email)
                    cmd.Parameters.AddWithValue("@p12", birthday)
                    cmd.Parameters.AddWithValue("@p13", citizenship)
                    cmd.Parameters.AddWithValue("@p14", religion)
                    cmd.Parameters.AddWithValue("@p15", marital_status)
                    cmd.Parameters.AddWithValue("@p16", gender)
                    cmd.Parameters.AddWithValue("@p17", status)
                    cmd.Parameters.AddWithValue("@p18", college_id)
                    cmd.Parameters.AddWithValue("@p19", year_graduated)

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

                cmd = New SqlCommand("INSERT INTO tblEmployment(account_idfk,employment_status,q1,q2,q3,q4,q5,q6,q7,unemployed_status,further_study,highest_educ_attainment) VALUES(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p12,@p13)", sqlCon)
                cmd.Parameters.AddWithValue("@p1", account_id)
                cmd.Parameters.AddWithValue("@p2", employment_status)
                cmd.Parameters.AddWithValue("@p3", q1)
                cmd.Parameters.AddWithValue("@p4", q2)
                cmd.Parameters.AddWithValue("@p5", q3)
                cmd.Parameters.AddWithValue("@p6", q4)
                cmd.Parameters.AddWithValue("@p7", q5)
                cmd.Parameters.AddWithValue("@p8", q6)
                cmd.Parameters.AddWithValue("@p9", q7)
                cmd.Parameters.AddWithValue("@p10", unemployed_status)
                cmd.Parameters.AddWithValue("@p12", higher_education)
                cmd.Parameters.AddWithValue("@p13", highest_education)
                cmd.ExecuteNonQuery()
                sqlCon.Close()
            End Using

            If isForgot = True Then
                Return "Registration successful, your account is under review due to lack of information. Please wait for your account to be activated."
            Else
                Return "Registration successful. Thank you for registering, you can now login."
            End If
        End If
    End Function

    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function fetchCourseByIdfk(ByVal collegeFk As String) As String
        'Fetch course per college

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

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            fetch_college()

            'DISREGARD PAGE LOAD FUNCTION ON POSTBACK
        Else

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
