Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Imports System.Web.UI.ScriptManager
Imports Microsoft.Reporting.WebForms

Partial Class report_viewer
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    'PAGE LOAD
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim sortBy As String = ""
        Dim collegeDesc As String = ""
        Dim yearGrad As String = ""
        Dim sqlStr As String = ""

        If Not Page.IsPostBack Then
            sortBy = Request.QueryString("sortBy")
            collegeDesc = Request.QueryString("collegeDesc")
            yearGrad = Request.QueryString("yearGrad")

            'FILTER DATA
            If sortBy = "all" Then
                If collegeDesc = "0" And yearGrad = "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE course_idfk = course_idpk AND userlevel_idfk<2 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1"

                ElseIf collegeDesc <> "0" And yearGrad = "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE college_idpk = '" & collegeDesc & "' AND course_idfk = course_idpk AND userlevel_idfk<2 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1"

                ElseIf collegeDesc = "0" And yearGrad <> "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE course_idfk = course_idpk AND userlevel_idfk<2 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1 AND tblAccounts.year_graduated = '" & yearGrad & "' "

                ElseIf collegeDesc <> "0" And yearGrad <> "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE college_idpk = '" & collegeDesc & "' AND course_idfk = course_idpk AND userlevel_idfk<2 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1 AND tblAccounts.year_graduated = '" & yearGrad & "' "

                End If

            ElseIf sortBy = "graduating" Then
                If collegeDesc = "0" And yearGrad = "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE course_idfk = course_idpk AND userlevel_idfk = 0 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1"

                ElseIf collegeDesc <> "0" And yearGrad = "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE college_idpk = '" & collegeDesc & "' AND course_idfk = course_idpk AND userlevel_idfk = 0 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1"

                ElseIf collegeDesc = "0" And yearGrad <> "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE course_idfk = course_idpk AND userlevel_idfk = 0 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1 AND tblAccounts.year_graduated = '" & yearGrad & "' "

                ElseIf collegeDesc <> "0" And yearGrad <> "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE college_idpk = '" & collegeDesc & "' AND course_idfk = course_idpk AND userlevel_idfk = 0 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1 AND tblAccounts.year_graduated = '" & yearGrad & "' "

                End If

            ElseIf sortBy = "alumni" Then
                If collegeDesc = "0" And yearGrad = "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE course_idfk = course_idpk AND userlevel_idfk = 1 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1"

                ElseIf collegeDesc <> "0" And yearGrad = "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE college_idpk = '" & collegeDesc & "' AND course_idfk = course_idpk AND userlevel_idfk = 1 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1"

                ElseIf collegeDesc = "0" And yearGrad <> "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE course_idfk = course_idpk AND userlevel_idfk = 1 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1 AND tblAccounts.year_graduated = '" & yearGrad & "' "

                ElseIf collegeDesc <> "0" And yearGrad <> "all" Then
                    sqlStr = "SELECT tblAccounts.given_name,tblAccounts.middle_name,tblAccounts.family_name,tblColleges.description as collegeDes,tblCourses.description as courseDes,tblAccounts.year_graduated FROM tblAccounts,tblCourses,tblColleges WHERE college_idpk = '" & collegeDesc & "' AND course_idfk = course_idpk AND userlevel_idfk = 1 AND tblCourses.college_idfk = tblColleges.college_idpk AND tblAccounts.account_status = 1 AND tblAccounts.year_graduated = '" & yearGrad & "' "

                End If
            End If

            'CALL FUNCTION
            fillDT_alumni_list(sqlStr)
        End If
    End Sub

    'FILL DT ALUMNI LIST REPORT
    Sub fillDT_alumni_list(ByVal str As String)
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            Using da As New SqlDataAdapter(str, sqlCon)
                Dim ds As New DataSet
                Dim dynamic_dt As New DataTable

                da.Fill(ds, "DTalumni_list")
                dynamic_dt = ds.Tables(0)

                'show report
                genRPT_alumni_list(dynamic_dt)
            End Using

            sqlCon.Close()
        End Using
    End Sub

    'GENERATE ALUMNI LIST RPT
    Sub genRPT_alumni_list(ByVal dt As DataTable)
        rptViewer.Reset()

        rptViewer.LocalReport.ReportPath = Server.MapPath("RPTalumni_list.rdlc")
        rptViewer.LocalReport.DataSources.Clear()

        Dim _rsource As New ReportDataSource("DSalumni_list", dt)
        rptViewer.LocalReport.DataSources.Add(_rsource)
        rptViewer.LocalReport.Refresh()
    End Sub
End Class
