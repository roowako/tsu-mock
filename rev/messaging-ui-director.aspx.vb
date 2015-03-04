Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Partial Class rev_messaging_ui_director
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session.Item("id") Is Nothing Then
            Console.Write("sd")
            Response.Redirect("Default.aspx")
        Else

            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT * FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", Session("id"))
                dr = cmd.ExecuteReader

                While dr.Read
                    alumni_name.Text = dr.GetString(6)
                    account_idpk.Text = Session("id")
                    undeditable.ImageUrl = dr.GetString(20)
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

            Using da = New SqlDataAdapter("SELECT  actor_message,sender_idfk,recipient_idfk,CONVERT(VARCHAR, date_sent,0) as formatedB FROM tblMessages WHERE recipient_idfk = '" & account_id & "' AND sender_idfk = '" & account_idfk & "' OR sender_idfk = '" & account_id & "' AND recipient_idfk = '" & account_idfk & "' ORDER BY date_sent  DESC", sqlCon)
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
            Using da = New SqlDataAdapter("SELECT DISTINCT given_name,family_name,account_idpk,img_path as dp FROM tblAccounts,tblMessages WHERE account_idpk=sender_idfk AND recipient_idfk='" & account_id & "'  ", sqlCon)
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

    'PULL ALUMNI / COORDINATOR SEARCH
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function search(ByVal q As String, ByVal filterQ As String) As String
        If filterQ = "alm" Then
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()
                Using dat = New SqlDataAdapter("SELECT TOP 1 accounts.given_name+ ' ' +accounts.family_name+ ' ' +accounts.middle_name as FullName,accounts.userlevel_idfk as ul, coordinators.username as username,coordinators.coordinator_idpk as cid FROM tblAccounts accounts, tblCoordinators coordinators, tblColleges college WHERE accounts.account_status = 1 AND college.college_idpk <> accounts.college_idfk AND college.college_idpk <> coordinators.college_idfk AND (accounts.given_name LIKE '%" & q & "%' OR coordinators.username LIKE '%" & q & "%') GROUP BY  accounts.given_name+ ' ' +accounts.family_name+ ' ' +accounts.middle_name, accounts.account_idpk, accounts.userlevel_idfk, coordinators.username,coordinators.coordinator_idpk ", sqlCon)

                    Dim table2 = New DataTable()
                    dat.Fill(table2)

                    Dim pollOptionsJsonData As String = GetJson(table2)
                    Return pollOptionsJsonData
                End Using

                sqlCon.Close()
            End Using
       
        End If
        

    End Function
End Class
