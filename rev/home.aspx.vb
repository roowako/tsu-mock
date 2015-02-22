﻿Imports System.Data
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

    'PAGE LOAD
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session.Item("id") Is Nothing Then
            Console.Write("sd")
            Response.Redirect("Default.aspx")
        Else
            college_idpk.Text = Session.Item("id")
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT given_name,college_idfk,tblColleges.description FROM tblAccounts,tblColleges WHERE account_idpk=@p1 AND college_idfk = college_idpk", sqlCon)
                cmd.Parameters.AddWithValue("@p1", Session.Item("id"))
                dr = cmd.ExecuteReader

                While dr.Read
                    alumni_name.Text = dr.GetString(0)
                    account_idpk.Text = Session.Item("id")
                    college_idpk.Text = dr.GetValue(1)
                    college_desc.Text = dr.GetString(2)
                End While

                sqlCon.Close()
            End Using
        End If
    End Sub

    'LOG OUT
    Protected Sub alumni_logout_Click(sender As Object, e As EventArgs) Handles alumni_logout.ServerClick
        Session.Abandon()
        Response.Redirect("default.aspx")
    End Sub

    'SERIALIZER
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

    'SERIALIZER
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

    'PULL ANNOUNCEMENTS
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullAnnouncement(ByVal college_id As Integer) As String
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            Using dat = New SqlDataAdapter("SELECT description,target_id,CONVERT(VARCHAR, datetime_posted,0) as formatedB FROM tblAnnouncements WHERE target_id = '" & college_id & "' OR target_id = 0 ORDER BY announcement_idpk DESC", sqlCon)
                Dim table2 = New DataTable()
                dat.Fill(table2)

                Dim pollOptionsJsonData As String = GetJson(table2)
                Return pollOptionsJsonData
            End Using

            sqlCon.Close()
        End Using
    End Function

    'PULL POLLS AVAILABLE
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullFromServer(ByVal filter As String, ByVal college_id As Integer) As String
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            Using da = New SqlDataAdapter("SELECT polls_idpk,description,question FROM tblPolls WHERE status = 1 AND target_id = '" & college_id & "' OR target_id = 0", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)
                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using

            sqlCon.Close()
        End Using

    End Function

    'PULL ANSWERED POLLS
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullAnsweredpolls(ByVal poll_id As Integer) As String
        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()

            cmd = New SqlCommand("SELECT polls_idfk FROM tblPollsdata WHERE polls_idfk = '" & poll_id & "' ", sqlCon)
            dr = cmd.ExecuteReader

            If dr.HasRows Then
                Return "1"
            End If

            sqlCon.Close()

        End Using
    End Function

    'PULL POLL OPTIONS
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

    'PULL ALUMNI SEARCH
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function search(ByVal q As String) As String

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            Using dat = New SqlDataAdapter("SELECT given_name+ ' ' +family_name+ ' ' +middle_name  as u,account_idpk as uid FROM tblAccounts WHERE given_name+ ' ' +family_name+ '' +middle_name LIKE '%" & q & "%'  AND  account_status = 1 AND  userlevel_idfk  < 2  ", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)

                Dim pollOptionsJsonData As String = GetJsonOpt(table2)
                Return pollOptionsJsonData
            End Using

            sqlCon.Close()
        End Using

    End Function
End Class
