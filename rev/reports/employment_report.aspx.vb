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

Partial Class reports_employment_report
    Inherits System.Web.UI.Page
    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    'PAGE LOAD
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim college_desc As String = ""
        Dim course_desc As String = ""
        Dim college_id As Integer = 0
        Dim course_id As Integer = 0
        Dim sqlSTR As String = ""

        If Not Page.IsPostBack Then
            college_desc = Request.QueryString("college_desc")
            course_desc = Request.QueryString("course_desc")

            'FETCH COLLEGE ID
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT college_idpk FROM tblColleges WHERE description = '" & college_desc & "' ", sqlCon)
                dr = cmd.ExecuteReader

                If dr.HasRows Then
                    dr.Read()
                    college_id = dr.GetValue(0)
                    dr.Close()
                End If

                sqlCon.Close()
            End Using

            'FETCH COURSE ID
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT course_idpk FROM tblCourses WHERE description = '" & course_desc & "' ", sqlCon)
                dr = cmd.ExecuteReader

                If dr.HasRows Then
                    dr.Read()
                    course_id = dr.GetValue(0)
                    dr.Close()
                End If

                sqlCon.Close()
            End Using

            'FETCH STATS DATA
            Using sqlCon As New SqlConnection(constr)

                If college_desc = "ALL COLLEGES" And course_desc = "ALL COURSES" Then
                    sqlSTR = "SELECT " +
                        "COUNT(CASE WHEN employment_status = 'employed_no' then 1 else NULL end) Unemployed, COUNT(CASE when employment_status = 'employed_yes' then 1 else NULL end) Employed, " +
                        "COUNT(CASE WHEN q1 = '1 to 3 months' then 1 else NULL end) Q1A, COUNT(CASE when q1 = '4 to 6 months' then 1 else NULL end) Q1B, COUNT(CASE when q1 = '7 months to 1 year' then 1 else NULL end) Q1C, COUNT(CASE when q1 = 'Others' then 1 else NULL end) Q1D, " +
                        "COUNT(CASE WHEN q2 = 'Yes' then 1 else NULL end) Q2A, COUNT(CASE when q2 = 'No' then 1 else NULL end) Q2B, " +
                        "COUNT(CASE WHEN q3 = 'Abroad' then 1 else NULL end) Q3A, COUNT(CASE when q3 = 'Local' then 1 else NULL end) Q3B, " +
                        "COUNT(CASE WHEN q4 = 'Private' then 1 else NULL end) Q4A, COUNT(CASE when q3 = 'Public' then 1 else NULL end) Q4B, " +
                        "COUNT(CASE WHEN q5 = 'nat_app_reg' then 1 else NULL end) Q5A, COUNT(CASE when q5 = 'nat_app_prob' then 1 else NULL end) Q5B, COUNT(CASE when q5 = 'self_emp_opt' then 1 else NULL end) Q5C, " +
                        "COUNT(CASE WHEN q6 = 'Rank and File' then 1 else NULL end) Q6A, COUNT(CASE when q6 = 'Supervisory Level' then 1 else NULL end) Q6B, COUNT(CASE when q6 = 'Managerial Level' then 1 else NULL end) Q6C, COUNT(CASE when q6 = 'Others' then 1 else NULL end) Q6D, " +
                        "COUNT(CASE WHEN q7 = '1 to 6 months' then 1 else NULL end) Q7A, COUNT(CASE when q7 = '7 months to 1 year' then 1 else NULL end) Q7B, COUNT(CASE when q7 = '1 year to 3 years' then 1 else NULL end) Q7C, COUNT(CASE when q7 = 'Others' then 1 else NULL end) Q7D, " +
                        "COUNT(CASE WHEN further_study = 'fu_opt_yes' THEN 1 ELSE NULL end) FSA, COUNT(CASE WHEN further_study = 'fu_opt_no' THEN 1 ELSE NULL end) FSB, " +
                        "COUNT(CASE WHEN highest_educ_attainment = 'Doctoral' THEN 1 ELSE NULL end) HEA1, COUNT(CASE WHEN highest_educ_attainment = 'Masteral' THEN 1 ELSE NULL end) HEA2, COUNT(CASE WHEN highest_educ_attainment = 'Others' THEN 1 ELSE NULL end) HEA3 " +
                        "FROM tblEmployment"
                ElseIf college_desc <> "ALL COLLEGES" And course_desc = "ALL COURSES" Then
                    sqlSTR = "SELECT " +
                        "COUNT(CASE WHEN employment_status = 'employed_no' then 1 else NULL end) Unemployed, COUNT(CASE when employment_status = 'employed_yes' then 1 else NULL end) Employed, " +
                        "COUNT(CASE WHEN q1 = '1 to 3 months' then 1 else NULL end) Q1A, COUNT(CASE when q1 = '4 to 6 months' then 1 else NULL end) Q1B, COUNT(CASE when q1 = '7 months to 1 year' then 1 else NULL end) Q1C, COUNT(CASE when q1 = 'Others' then 1 else NULL end) Q1D, " +
                        "COUNT(CASE WHEN q2 = 'Yes' then 1 else NULL end) Q2A, COUNT(CASE when q2 = 'No' then 1 else NULL end) Q2B, " +
                        "COUNT(CASE WHEN q3 = 'Abroad' then 1 else NULL end) Q3A, COUNT(CASE when q3 = 'Local' then 1 else NULL end) Q3B, " +
                        "COUNT(CASE WHEN q4 = 'Private' then 1 else NULL end) Q4A, COUNT(CASE when q3 = 'Public' then 1 else NULL end) Q4B, " +
                        "COUNT(CASE WHEN q5 = 'nat_app_reg' then 1 else NULL end) Q5A, COUNT(CASE when q5 = 'nat_app_prob' then 1 else NULL end) Q5B, COUNT(CASE when q5 = 'self_emp_opt' then 1 else NULL end) Q5C, " +
                        "COUNT(CASE WHEN q6 = 'Rank and File' then 1 else NULL end) Q6A, COUNT(CASE when q6 = 'Supervisory Level' then 1 else NULL end) Q6B, COUNT(CASE when q6 = 'Managerial Level' then 1 else NULL end) Q6C, COUNT(CASE when q6 = 'Others' then 1 else NULL end) Q6D, " +
                        "COUNT(CASE WHEN q7 = '1 to 6 months' then 1 else NULL end) Q7A, COUNT(CASE when q7 = '7 months to 1 year' then 1 else NULL end) Q7B, COUNT(CASE when q7 = '1 year to 3 years' then 1 else NULL end) Q7C, COUNT(CASE when q7 = 'Others' then 1 else NULL end) Q7D, " +
                        "COUNT(CASE WHEN further_study = 'fu_opt_yes' THEN 1 ELSE NULL end) FSA, COUNT(CASE WHEN further_study = 'fu_opt_no' THEN 1 ELSE NULL end) FSB, " +
                        "COUNT(CASE WHEN highest_educ_attainment = 'Doctoral' THEN 1 ELSE NULL end) HEA1, COUNT(CASE WHEN highest_educ_attainment = 'Masteral' THEN 1 ELSE NULL end) HEA2, COUNT(CASE WHEN highest_educ_attainment = 'Others' THEN 1 ELSE NULL end) HEA3 " +
                        "FROM tblEmployment WHERE college_idfk = '" & college_id & "' "
                ElseIf college_desc <> "ALL COLLEGES" And course_desc <> "ALL COURSES" Then
                    sqlSTR = "SELECT " +
                        "COUNT(CASE WHEN employment_status = 'employed_no' then 1 else NULL end) Unemployed, COUNT(CASE when employment_status = 'employed_yes' then 1 else NULL end) Employed, " +
                        "COUNT(CASE WHEN q1 = '1 to 3 months' then 1 else NULL end) Q1A, COUNT(CASE when q1 = '4 to 6 months' then 1 else NULL end) Q1B, COUNT(CASE when q1 = '7 months to 1 year' then 1 else NULL end) Q1C, COUNT(CASE when q1 = 'Others' then 1 else NULL end) Q1D, " +
                        "COUNT(CASE WHEN q2 = 'Yes' then 1 else NULL end) Q2A, COUNT(CASE when q2 = 'No' then 1 else NULL end) Q2B, " +
                        "COUNT(CASE WHEN q3 = 'Abroad' then 1 else NULL end) Q3A, COUNT(CASE when q3 = 'Local' then 1 else NULL end) Q3B, " +
                        "COUNT(CASE WHEN q4 = 'Private' then 1 else NULL end) Q4A, COUNT(CASE when q3 = 'Public' then 1 else NULL end) Q4B, " +
                        "COUNT(CASE WHEN q5 = 'nat_app_reg' then 1 else NULL end) Q5A, COUNT(CASE when q5 = 'nat_app_prob' then 1 else NULL end) Q5B, COUNT(CASE when q5 = 'self_emp_opt' then 1 else NULL end) Q5C, " +
                        "COUNT(CASE WHEN q6 = 'Rank and File' then 1 else NULL end) Q6A, COUNT(CASE when q6 = 'Supervisory Level' then 1 else NULL end) Q6B, COUNT(CASE when q6 = 'Managerial Level' then 1 else NULL end) Q6C, COUNT(CASE when q6 = 'Others' then 1 else NULL end) Q6D, " +
                        "COUNT(CASE WHEN q7 = '1 to 6 months' then 1 else NULL end) Q7A, COUNT(CASE when q7 = '7 months to 1 year' then 1 else NULL end) Q7B, COUNT(CASE when q7 = '1 year to 3 years' then 1 else NULL end) Q7C, COUNT(CASE when q7 = 'Others' then 1 else NULL end) Q7D, " +
                        "COUNT(CASE WHEN further_study = 'fu_opt_yes' THEN 1 ELSE NULL end) FSA, COUNT(CASE WHEN further_study = 'fu_opt_no' THEN 1 ELSE NULL end) FSB, " +
                        "COUNT(CASE WHEN highest_educ_attainment = 'Doctoral' THEN 1 ELSE NULL end) HEA1, COUNT(CASE WHEN highest_educ_attainment = 'Masteral' THEN 1 ELSE NULL end) HEA2, COUNT(CASE WHEN highest_educ_attainment = 'Others' THEN 1 ELSE NULL end) HEA3 " +
                        "FROM tblEmployment WHERE college_idfk = '" & college_id & "' AND course_idfk = '" & course_id & "' "
                End If


                'CALL REPORT
                fillDT_esurvey_stats(sqlSTR)
            End Using
        End If

    End Sub

    'FILL DT ALUMNI LIST REPORT
    Sub fillDT_esurvey_stats(ByVal str As String)
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            Using da As New SqlDataAdapter(str, sqlCon)
                Dim ds As New DataSet
                Dim dynamic_dt As New DataTable

                da.Fill(ds, "DTemployment_report")
                dynamic_dt = ds.Tables(0)

                'show report
                genRPT_esurvey_stats(dynamic_dt)
            End Using

            sqlCon.Close()
        End Using
    End Sub

    'GENERATE ALUMNI LIST RPT
    Sub genRPT_esurvey_stats(ByVal dt As DataTable)
        rptViewer.Reset()

        rptViewer.LocalReport.ReportPath = Server.MapPath("RPTemployment_.rdlc")
        rptViewer.LocalReport.DataSources.Clear()

        Dim _rsource As New ReportDataSource("DSalumni_list", dt)
        rptViewer.LocalReport.DataSources.Add(_rsource)
        rptViewer.LocalReport.Refresh()
    End Sub
End Class
