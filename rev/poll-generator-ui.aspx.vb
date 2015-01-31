Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic

Partial Class UI_poll_generator_ui
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=MAC-PC\SQLEXPRESS;Initial Catalog=tsuat_db;User ID=sa;Password=masterfile"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String



    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function PushToDatabase(ByVal pollOptArr As String, ByVal pollTitle As String, ByVal pollQ As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()

            sqlStr = "INSERT INTO polls_tbl(description,question,status) VALUES(@pollTitle,@pollQ,1)"

            cmd = New SqlCommand(sqlStr, sqlCon)
            cmd.Parameters.AddWithValue("@pollTitle", pollTitle)
            cmd.Parameters.AddWithValue("@pollQ", pollQ)
            cmd.ExecuteNonQuery()

            getLast = "SELECT MAX(polls_idpk) as pollsPk FROM polls_tbl"
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
                sqlStr = "INSERT INTO pollsoption_tbl(polls_idfk,option_description) VALUES(@pollFk,@poll)"
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

    

End Class
