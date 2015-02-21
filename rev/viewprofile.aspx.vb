Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Partial Class viewprofile
    Inherits System.Web.UI.Page
    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim paramId As Integer

        If Integer.TryParse(Request.Params("id"), paramId) Then

            acc_id.Text = paramId
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

                    End While

                    sqlCon.Close()
                End Using
            End If

            If acc_id.Text.ToString = Session("id") Then
                Response.Redirect("alumni-profile.aspx")
            End If
        End If
    End Sub
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

    'Fetch info
    <System.Web.Services.WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullInfo(ByVal id As String) As String

        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            Using dat = New SqlDataAdapter(" SELECT TOP 1 given_name+' '+middle_name+' '+family_name as u, CONVERT(VARCHAR, birthday,7) as formatedB,telephone_number as c,email_address as m,address as a,citizenship as ct, religion as r,marital_status as ms,tblAccounts.year_graduated as yg,tblColleges.description as cd,tblCourses.description as ccd FROM tblAccounts,tblColleges,tblCourses WHERE account_idpk = '" & id & "' AND tblAccounts.college_idfk = tblColleges.college_idpk AND tblCourses.college_idfk = tblColleges.college_idpk  ", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)

                Dim pollOptionsJsonData As String = GetJson(table2)
                Return pollOptionsJsonData
            End Using

            sqlCon.Close()
        End Using

    End Function

End Class
