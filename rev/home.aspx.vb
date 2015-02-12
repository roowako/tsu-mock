Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic

Partial Class home

    Inherits System.Web.UI.Page
    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session.Item("alumni_id") Is Nothing Then
            Console.Write("sd")
            Response.Redirect("Default.aspx")
        Else
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE account_idpk=@p1 AND userlevel_idfk = 1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", Session("alumni_id"))
                dr = cmd.ExecuteReader

                While dr.Read
                    alumni_name.Text = dr.GetString(6)
                    account_idpk.Text = Session("alumni_id")

                End While

                sqlCon.Close()
            End Using
        End If
    End Sub
    Protected Sub alumni_logout_Click(sender As Object, e As EventArgs) Handles alumni_logout.ServerClick
        Session.Abandon()
        Response.Redirect("default.aspx")
    End Sub
    Public Shared Function GetJsonOpt(ByVal dt As DataTable) As String
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
    Public Shared Function pullFromServer() As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            Using da = New SqlDataAdapter("SELECT * FROM tblPolls WHERE status=1", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)
                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using

            sqlCon.Close()
            'Returning Message : Fail or Successful
        End Using

    End Function


    <System.Web.Services.WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullPollOptions(ByVal optFk As String) As String

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            Using dat = New SqlDataAdapter(" SELECT * FROM tblPollsoption WHERE polls_idfk = '" & optFk & "' ", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)

                Dim pollOptionsJsonData As String = GetJsonOpt(table2)
                Return pollOptionsJsonData
            End Using

            sqlCon.Close()
        End Using

    End Function




    'Push data for statistics
    <System.Web.Services.WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pushToPollDataStats(ByVal poll_idpk As Integer, ByVal poll_option_idfk As Integer, ByVal account_idfk As Integer) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()

            sqlStr = "INSERT INTO tblPollsdata(polls_idfk,pollsoption_idfk,account_idfk) VALUES(@p1,@p2,@p3)"

            cmd = New SqlCommand(sqlStr, sqlCon)
            cmd.Parameters.AddWithValue("@p1", poll_idpk)
            cmd.Parameters.AddWithValue("@p2", poll_option_idfk)
            cmd.Parameters.AddWithValue("@p3", account_idfk)
            cmd.ExecuteNonQuery()

            getLast = "SELECT MAX(polls_idpk) as pollsPk FROM tblPolls"
            cmd = New SqlCommand(getLast, sqlCon)
            Dim lastId As Integer = CInt(cmd.ExecuteScalar())
            cmd.ExecuteNonQuery()


            sqlCon.Close()

            'Returning Message : Fail or Successful
            Return "Your answer has been added to our statistics. Thank you for participating!"

        End Using

    End Function
End Class
