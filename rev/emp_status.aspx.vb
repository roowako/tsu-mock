Imports System.Data.SqlClient
Imports System.Data

Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Imports System.Web.Services
Partial Class emp_status
    Inherits System.Web.UI.Page
    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String

    Public Shared Property account_id As Integer
    Public Shared Property college_id As Integer
    Public Shared Property course_id As Integer

    Public Shared Property employement_status As String
    Public Shared Property nature_appointment As String
    Dim isEmployed As Boolean


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim paramId As Integer

        If Integer.TryParse(Request.Params("aid"), paramId) Then


            If Session.Item("id") Is Nothing Then
                Console.Write("sd")
                Response.Redirect("Default.aspx")
            Else
                Using sqlCon As New SqlConnection(constr)
                    sqlCon.Open()

                    cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
                    cmd.Parameters.AddWithValue("@p1", Session("id"))
                    dr = cmd.ExecuteReader

                    If dr.HasRows Then
                        While dr.Read
                            account_id = dr.GetValue(0)
                            college_id = dr.GetValue(18)
                            course_id = dr.GetValue(2)
                           

                        End While

                    Else

                    End If
                   

                    sqlCon.Close()
                End Using


            End If




        End If
    End Sub


    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function alumni_register(ByVal highest_education As String, ByVal higher_education As String, ByVal q7 As String, ByVal q6 As String, ByVal q5 As String, ByVal q4 As String, ByVal q3 As String, ByVal q2 As String, ByVal q1 As String, ByVal employment_status As String) As String





        Using sqlCon As New SqlConnection(constr) 'add survey for the account
            sqlCon.Open()

            cmd = New SqlCommand("INSERT INTO tblEmployment(account_idfk,employment_status,q1,q2,q3,q4,q5,q6,q7,further_study,highest_educ_attainment,college_idfk,course_idfk) VALUES(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p12,@p13,@p14,@p15)", sqlCon)
            cmd.Parameters.AddWithValue("@p1", account_id)
            cmd.Parameters.AddWithValue("@p2", employment_status)
            cmd.Parameters.AddWithValue("@p3", q1)
            cmd.Parameters.AddWithValue("@p4", q2)
            cmd.Parameters.AddWithValue("@p5", q3)
            cmd.Parameters.AddWithValue("@p6", q4)
            cmd.Parameters.AddWithValue("@p7", q5)
            cmd.Parameters.AddWithValue("@p8", q6)
            cmd.Parameters.AddWithValue("@p9", q7)
            cmd.Parameters.AddWithValue("@p12", higher_education)
            cmd.Parameters.AddWithValue("@p13", highest_education)
            cmd.Parameters.AddWithValue("@p14", college_id)
            cmd.Parameters.AddWithValue("@p15", course_id)

            cmd.ExecuteNonQuery()
            sqlCon.Close()
        End Using
        Return "gg"
    End Function



End Class
