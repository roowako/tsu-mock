﻿Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Partial Class rev_messaging_ui_alumni
    Inherits System.Web.UI.Page


    Public Shared Property constr As String = "Data Source=.\SQLEXPRESS;Initial Catalog=tsuat_db;User ID=sa;Password=masterfile"
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

                cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
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
    'JSON Serializer
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

    'Fetch conversation
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullConversation(ByVal account_id As String, ByVal account_idfk As String) As String
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            Using da = New SqlDataAdapter("SELECT actor_message,sender_idfk,CONVERT(VARCHAR, date_sent,0) as formatedB FROM tblMessages WHERE recipient_idfk = '" & account_id & "' AND sender_idfk = '" & account_idfk & "' OR sender_idfk = '" & account_id & "' AND recipient_idfk = '" & account_idfk & "' ORDER BY date_sent ", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using

            sqlCon.Close()
        End Using
    End Function

    'Fetch messages
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullMessages(ByVal account_id As String) As String
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            Using da = New SqlDataAdapter("SELECT DISTINCT given_name,family_name,account_idpk FROM tblAccounts,tblMessages WHERE account_idpk=sender_idfk AND recipient_idfk='" & account_id & "' ", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using


            sqlCon.Close()
            'Returning Message : Fail or Successful
        End Using
    End Function

    'Push user messages
    <System.Web.Services.WebMethod()> _
<ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pushMessages(ByVal message As String, actor_id As String, ByVal send_to As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            Using da = New SqlDataAdapter(" INSERT INTO tblMessages(recipient_idfk,sender_idfk,actor_message,date_sent) VALUES('" & send_to & "','" & actor_id & "','" & message & "','" & Date.Now & "')", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using


            sqlCon.Close()
            'Returning Message : Fail or Successful
        End Using


    End Function
End Class