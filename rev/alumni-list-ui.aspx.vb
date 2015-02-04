Imports System.Data.SqlClient
Imports System.Data

Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Partial Class rev_alumni_list_ui
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=.\SQLEXPRESS;Initial Catalog=tsuat_db;User ID=sa;Password=masterfile"
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


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            fetch_college()

            'DISREGARD PAGE LOAD FUNCTION ON POSTBACK
        Else

        End If
    End Sub

    Sub fetch_college()
        filterCollege.Items.Clear()
        filterCollege.Items.Add(" ")

        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("SELECT description from tblColleges", sqlcon)
            dr = cmd.ExecuteReader

            Do While dr.Read
                filterCollege.Items.Add(dr.GetString(0))
            Loop

            sqlcon.Close()
        End Using
    End Sub
End Class
