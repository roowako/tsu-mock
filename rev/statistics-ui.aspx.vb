Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Partial Class statistics_ui
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String
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
    Public Shared Function pullQ(ByVal filterView As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            If filterView = "poll" Then

                Using da = New SqlDataAdapter(" SELECT * FROM polls_tbl ", sqlCon)
                    Dim table = New DataTable()
                    da.Fill(table)

                    Dim jsndata As String = GetJson(table)
                    Return jsndata
                End Using


            Else If filterView = "survey" Then
                Using da = New SqlDataAdapter(" SELECT * FROM tblEmployment ", sqlCon)
                    Dim table = New DataTable()
                    da.Fill(table)

                    Dim jsndata As String = GetJson(table)
                    Return jsndata
                End Using
            End If

            sqlCon.Close()
            'Returning Message : Fail or Successful


        End Using

    End Function

    'Delete poll
    <System.Web.Services.WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function deletePoll(ByVal poll_id As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database

        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("DELETE FROM  polls_tbl WHERE polls_idpk = '" & poll_id & "'", sqlcon)
            cmd.ExecuteNonQuery()

            sqlcon.Close()
        End Using
        Return "Deleted."
    End Function

    'Employment Status
    <System.Web.Services.WebMethod()> _
  <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function empstat() As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()


            Using da = New SqlDataAdapter("SELECT COUNT(CASE when employment_status = 'employed_no' then 1 else NULL end) Unmployed,COUNT(CASE when employment_status = 'employed_yes' then 1 else NULL end) Employed from tblEmployment  ", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using




            sqlCon.Close()
            'Returning Message : Fail or Successful


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
        cboCollege.Items.Add("All colleges")

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












    <System.Web.Services.WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullPollOptions(ByVal optFk As String) As String

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            Using dat = New SqlDataAdapter("SELECT option_description, COUNT(pollsdata_tbl.pollsoption_idfk) as stats_data FROM  pollsoption_tbl LEFT JOIN pollsdata_tbl ON   pollsoption_tbl.pollsoption_idpk =   pollsdata_tbl.pollsoption_idfk WHERE pollsoption_tbl.polls_idfk = '" & optFk & "' GROUP BY option_description ORDER BY stats_data DESC ", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)

                Dim pollOptionsJsonData As String = GetJson(table2)
                Return pollOptionsJsonData
            End Using

            sqlCon.Close()
        End Using

    End Function
End Class
