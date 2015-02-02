Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic

Partial Class survey_generator_ui
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=MAC-PC\SQLEXPRESS;Initial Catalog=tsuat_db;User ID=sa;Password=masterfile"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String
    Public Shared Property surveyQuestionFk As String

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
            Using da = New SqlDataAdapter(" SELECT * FROM surveys_tbl", sqlCon)
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
    Public Shared Function PushToDatabase(ByVal surveyOptArr As String, ByVal pollTitle As String, ByVal pollQ As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()

            sqlStr = "INSERT INTO surveys_tbl(description,status) VALUES(@pollTitle,1)"

            cmd = New SqlCommand(sqlStr, sqlCon)
            cmd.Parameters.AddWithValue("@pollTitle", pollTitle)

            cmd.ExecuteNonQuery()

            getLast = "SELECT MAX(survey_idpk) as pollsPk FROM surveys_tbl"
            cmd = New SqlCommand(getLast, sqlCon)
            Dim lastIdFK As Integer = CInt(cmd.ExecuteScalar())
            cmd.ExecuteNonQuery()

            surveyQuestionFk = "INSERT INTO surveyquestions_tbl(survey_idfk,survey_question) VALUES(@qFk,@surveyQ)"
            cmd = New SqlCommand(surveyQuestionFk, sqlCon)
            cmd.Parameters.AddWithValue("@qFk", lastIdFK)
            cmd.Parameters.AddWithValue("@surveyQ", pollQ)
            cmd.ExecuteNonQuery()

            'Delimiter
            Dim stringSep() As String = {","}


            Dim result() As String

            'Splitting each value for database insertion, removing(,)
            result = surveyOptArr.Split(stringSep, StringSplitOptions.None)

            Dim i As String




            'Iterate each element in array with (,) eliminated
            For Each i In result

                'Insertion query
                sqlStr = "INSERT INTO surveyoption_tbl(surveys_idfk,surveyquestion_idfk,survey_option) VALUES(@pollFk,1,@poll)"
                cmd = New SqlCommand(sqlStr, sqlCon)
                cmd.Parameters.AddWithValue("@poll", i)
                cmd.Parameters.AddWithValue("@pollFk", lastIdFK)
                cmd.ExecuteNonQuery()

            Next

            sqlCon.Close()

            'Returning Message : Fail or Successful
            Return lastIdFK

        End Using

    End Function

End Class
