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

Imports System.Web.Services

Partial Class reports_token_report
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader
    Dim limit As Integer = 0
    Dim college_id As Integer
    Dim sqlSTR As String

    'PAGE LOAD
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            limit = CInt(Request.QueryString("limit"))
            college_id = CInt(Request.QueryString("college_id"))

            sqlSTR = "SELECT TOP " & limit.ToString & " tblTokens.description AS token_desc, tblColleges.description AS college_desc FROM tblTokens,tblColleges WHERE tblTokens.college_idfk = '" & college_id & "' AND tblTokens.status = 0 AND college_idpk = '" & college_id & "' "

            fillDT_token_print(sqlSTR)
            'SELECT TOP 10 tblTokens.description, tblColleges.description FROM tblTokens,tblColleges WHERE tblTokens.college_idfk = 4 AND tblTokens.status = 0 AND tblColleges.college_idpk = 4
        End If
    End Sub

    'FILL DT TOKEN TO PRINT
    Sub fillDT_token_print(ByVal str As String)
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            Using da As New SqlDataAdapter(str, sqlCon)
                Dim ds As New DataSet
                Dim dynamic_dt As New DataTable

                da.Fill(ds, "DTtoken_print")
                dynamic_dt = ds.Tables(0)

                'show report
                genRPT_token_print(dynamic_dt)
            End Using

            sqlCon.Close()
        End Using
    End Sub

    'GENERATE TOKEN RPT
    Sub genRPT_token_print(ByVal dt As DataTable)
        rptViewer.Reset()

        rptViewer.LocalReport.ReportPath = Server.MapPath("RPTtoken_print.rdlc")
        rptViewer.LocalReport.DataSources.Clear()

        'Dim rpCollegeDesc As New ReportParameter("paramCollegeDesc", college_desc)
        'Dim rpCourseDesc As New ReportParameter("paramCourseDesc", course_desc)
        Dim _rsource As New ReportDataSource("DSalumni_list", dt)

        'rptViewer.LocalReport.SetParameters(New ReportParameter() {rpCollegeDesc, rpCourseDesc})
        rptViewer.LocalReport.DataSources.Add(_rsource)
        rptViewer.LocalReport.Refresh()
    End Sub
End Class
