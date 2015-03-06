Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Partial Class rev_survey_gen_director
    Inherits System.Web.UI.Page


    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String

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

        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using da = New SqlDataAdapter(" SELECT * FROM tblPolls  ORDER BY polls_idpk DESC", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using

            sqlCon.Close()

        End Using

    End Function

    'DELETE SURVEY
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function delete_survey(ByVal id As Integer) As String

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("DELETE FROM tblPolls WHERE tblPolls.polls_idpk='" & id & "' ", sqlCon)
            cmd.ExecuteNonQuery()

            cmd = New SqlCommand("DELETE FROM tblPollsdata WHERE tblPollsdata.polls_idfk='" & id & "' ", sqlCon)
            cmd.ExecuteNonQuery()

            cmd = New SqlCommand("DELETE FROM tblPollsoption WHERE tblPollsoption.polls_idfk='" & id & "' ", sqlCon)
            cmd.ExecuteNonQuery()

            Return "Survey was removed."

            sqlCon.Close()
        End Using

    End Function

    'Pull options
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


    'Push survey
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function PushToDatabase(ByVal pollOptArr As String, ByVal pollTitle As String, ByVal pollQ As String) As String

        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()

            sqlStr = "INSERT INTO tblPolls(description,question,status,target_id) VALUES(@pollTitle,@pollQ,1,0)"

            cmd = New SqlCommand(sqlStr, sqlCon)
            cmd.Parameters.AddWithValue("@pollTitle", pollTitle)
            cmd.Parameters.AddWithValue("@pollQ", pollQ)
            cmd.ExecuteNonQuery()

            getLast = "SELECT MAX(polls_idpk) as pollsPk FROM tblPolls"
            cmd = New SqlCommand(getLast, sqlCon)
            Dim lastId As Integer = CInt(cmd.ExecuteScalar())
            cmd.ExecuteNonQuery()

            'Delimiter
            Dim stringSep() As String = {","}


            Dim result() As String

            'Splitting each value for database insertion, removing(,)
            result = pollOptArr.Split(stringSep, StringSplitOptions.None)

            Dim i As String




            'Iterate each element in array with (,) eliminated
            For Each i In result

                'Insertion query
                sqlStr = "INSERT INTO tblPollsoption(polls_idfk,option_description) VALUES(@pollFk,@poll)"
                cmd = New SqlCommand(sqlStr, sqlCon)
                cmd.Parameters.AddWithValue("@poll", i)
                cmd.Parameters.AddWithValue("@pollFk", lastId)
                cmd.ExecuteNonQuery()

            Next

            sqlCon.Close()

            'Returning Message : Fail or Successful
            Return lastId

        End Using

    End Function

    'Dynamic Employment Activation
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function checkDynamicEmployment() As String


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using dat = New SqlDataAdapter(" SELECT flag FROM tblEmploymentFlag ", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)

                Dim pollOptionsJsonData As String = GetJsonOpt(table2)
                Return pollOptionsJsonData
            End Using

            sqlCon.Close()

        End Using

    End Function

    'Activate : Reactivate
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function DynamicFlag(ByVal flag As String) As String

        If flag = "Activate Employment Survey" Then

            Using sqlCon As New SqlConnection(constr)

                sqlCon.Open()
                Using dat = New SqlDataAdapter(" UPDATE tblEmploymentFlag SET flag = 1 WHERE flag = 0 ", sqlCon)

                    Dim table2 = New DataTable()
                    dat.Fill(table2)

                    Dim pollOptionsJsonData As String = GetJsonOpt(table2)
                    Return pollOptionsJsonData
                End Using

                sqlCon.Close()

            End Using
        Else
            Using sqlCon As New SqlConnection(constr)

                sqlCon.Open()
                Using dat = New SqlDataAdapter(" UPDATE tblEmploymentFlag SET flag = 0 WHERE flag = 1 ", sqlCon)

                    Dim table2 = New DataTable()
                    dat.Fill(table2)

                    Dim pollOptionsJsonData As String = GetJsonOpt(table2)
                    Return pollOptionsJsonData
                End Using

                sqlCon.Close()

            End Using
        End If
        

    End Function







    'PAGE LOAD
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

    'LOGOUT
    Protected Sub alumni_logout_Click(sender As Object, e As EventArgs) Handles alumni_logout.ServerClick
        Session.Abandon()
        Response.Redirect("default.aspx")
    End Sub

End Class
