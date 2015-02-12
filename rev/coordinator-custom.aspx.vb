Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Partial Class coordinator_custom
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
    Public Shared Function pullAnnouncement() As String
        ' 'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using dat = New SqlDataAdapter(" SELECT * FROM announcements_tbl ", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)


                Dim pollOptionsJsonData As String = GetJson(table2)
                Return pollOptionsJsonData
            End Using




            sqlCon.Close()

            'Returning Message : Fail or Successful

        End Using

    End Function

    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pushAnnouncement(ByVal myAnnouncement As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()

            sqlStr = "INSERT INTO announcements_tbl(description,datetime,account_idfk) VALUES(@announcement,'" & DateTime.Now() & "',1)"

            cmd = New SqlCommand(sqlStr, sqlCon)
            cmd.Parameters.AddWithValue("@announcement", myAnnouncement)

            cmd.ExecuteNonQuery()

           


            sqlCon.Close()

            'Returning Message : Fail or Successful
            Return myAnnouncement

        End Using

    End Function
End Class
