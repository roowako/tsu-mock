Imports System.Data.SqlClient
Imports System.Data

Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Partial Class rev_alumni_list_ui
    Inherits System.Web.UI.Page

    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String

    Public Shared Property student_status As String
    Public Shared Property employement_status As String
    Public Shared Property nature_appointment As String
    Dim isEmployed As Boolean
    Dim course_id As String
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
    Public Shared Function GetJson2(ByVal dt As DataTable) As String
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
    Public Shared Function pullAll(ByVal sortBy As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database
        If sortBy = "all" Then
            Using sqlCon As New SqlConnection(constr)

                sqlCon.Open()
                Using da = New SqlDataAdapter(" SELECT * FROM tblAccounts,tblCourses WHERE  course_idfk = course_idpk ", sqlCon)
                    Dim table = New DataTable()
                    da.Fill(table)

                    Dim jsndata As String = GetJson(table)
                    Return jsndata
                End Using

                sqlCon.Close()

                'Returning Message : Fail or Successful


            End Using
        ElseIf sortBy = "alumni" Then
            Using sqlCon As New SqlConnection(constr)

                sqlCon.Open()
                Using da = New SqlDataAdapter(" SELECT * FROM tblAccounts,tblCourses WHERE userlevel_idfk = 2 AND  course_idfk = course_idpk ", sqlCon)
                    Dim table = New DataTable()
                    da.Fill(table)

                    Dim jsndata As String = GetJson(table)
                    Return jsndata
                End Using

                sqlCon.Close()

                'Returning Message : Fail or Successful


            End Using
        ElseIf sortBy = "graduating" Then
            Using sqlCon As New SqlConnection(constr)

                sqlCon.Open()
                Using da = New SqlDataAdapter(" SELECT * FROM tblAccounts,tblCourses WHERE userlevel_idfk = 1 AND  course_idfk = course_idpk ", sqlCon)
                    Dim table = New DataTable()
                    da.Fill(table)

                    Dim jsndata As String = GetJson(table)
                    Return jsndata
                End Using

                sqlCon.Close()

                'Returning Message : Fail or Successful


            End Using
        End If




    End Function


    <System.Web.Services.WebMethod()> _
 <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function searchQ(ByVal q As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database

        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using da = New SqlDataAdapter(" SELECT *,  given_name+ ' ' +family_name+ ' ' +middle_name    FROM tblAccounts,tblCourses WHERE  given_name+ ' ' +family_name+ ' ' +middle_name LIKE '%" & q & "%' AND course_idfk = course_idpk ", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using

            sqlCon.Close()

            'Returning Message : Fail or Successful


        End Using
       
            sqlCon.Close()

            'Returning Message : Fail or Successful







    End Function
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            fetch_college()

            'DISREGARD PAGE LOAD FUNCTION ON POSTBACK
        Else

        End If
    End Sub

    Sub fetch_college()
        'filterCollege.Items.Clear()
        'filterCollege.Items.Add(" ")

        Using sqlcon As New SqlConnection(constr)
            sqlcon.Open()

            cmd = New SqlCommand("SELECT description from tblColleges", sqlcon)
            dr = cmd.ExecuteReader

            Do While dr.Read
                'filterCollege.Items.Add(dr.GetString(0))
            Loop

            sqlcon.Close()
        End Using
    End Sub

    <System.Web.Services.WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function fetchAccountInfo(ByVal accId As String) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using dat = New SqlDataAdapter("SELECT * FROM tblAccounts WHERE account_idpk = '" & accId & "'", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)


                Dim accIdPK As String = GetJson2(table2)
                Return accIdPK
            End Using




            sqlCon.Close()

            'Returning Message : Fail or Successful


        End Using

    End Function
End Class
