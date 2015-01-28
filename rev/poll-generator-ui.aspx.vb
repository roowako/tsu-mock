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



    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function Sample(ByVal pollOptArr As String) As String

        Using sqlCon As New SqlConnection(constr)
            Dim pollOpts As New List(Of pollOpt)()
            Dim js As New JavaScriptSerializer()
            Dim jsResult = js.Serialize(pollOpts)
            Dim dis = js.Deserialize(Of List(Of pollOpt))(jsResult)

          
            sqlCon.Open()
            sqlStr = "INSERT INTO pollsoption_tbl(polls_idfk,option_description) VALUES(1,@poll)"
            cmd = New SqlCommand(sqlStr, sqlCon)
            cmd.Parameters.AddWithValue("@poll", pollOptArr)

            cmd.ExecuteNonQuery()
            sqlCon.Close()
        End Using

    End Function

    Public Class pollOpt
        Public Property pollOption As String
    End Class

End Class
