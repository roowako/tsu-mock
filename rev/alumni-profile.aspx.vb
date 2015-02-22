Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Imports System.IO

Partial Class rev_alumni_profile
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
                    Image2.ImageUrl = dr.GetString(20)
                End While

                sqlCon.Close()
            End Using
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
            Using dat = New SqlDataAdapter(" SELECT *, CONVERT(VARCHAR, birthday,7) as formatedB FROM tblAccounts WHERE account_idpk = '" & id & "' ", sqlCon)

                Dim table2 = New DataTable()
                dat.Fill(table2)

                Dim pollOptionsJsonData As String = GetJson(table2)
                Return pollOptionsJsonData
            End Using

            sqlCon.Close()
        End Using

    End Function

    'Edit mail
    <System.Web.Services.WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function editMail(ByVal id As String, ByVal newmail As String) As String
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("UPDATE tblAccounts SET email_address=@p1 WHERE account_idpk=@p2", sqlCon)
            cmd.Parameters.AddWithValue("@p1", newmail)
            cmd.Parameters.AddWithValue("@p2", id)
            cmd.ExecuteNonQuery()

            sqlCon.Close()
        End Using

        Return "Email successfully updated"
    End Function

    'Edit contact number
    <System.Web.Services.WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function editContact(ByVal id As String, ByVal newContact As String) As String
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("UPDATE tblAccounts SET telephone_number=@p1 WHERE account_idpk=@p2", sqlCon)
            cmd.Parameters.AddWithValue("@p1", newContact)
            cmd.Parameters.AddWithValue("@p2", id)
            cmd.ExecuteNonQuery()

            sqlCon.Close()
        End Using

        Return "Contact number updated"
    End Function


    'Edit password
    <System.Web.Services.WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function editPassword(ByVal id As String, ByVal newPassword As String) As String
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            cmd = New SqlCommand("UPDATE tblAccounts SET password=@p1 WHERE account_idpk=@p2", sqlCon)
            cmd.Parameters.AddWithValue("@p1", newPassword)
            cmd.Parameters.AddWithValue("@p2", id)
            cmd.ExecuteNonQuery()

            sqlCon.Close()
        End Using

        Return "Password updated"
    End Function

    Protected Sub alumni_logout_Click(sender As Object, e As EventArgs) Handles alumni_logout.ServerClick
        Session.Abandon()
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub Upload(sender As Object, e As EventArgs)
        If uploader.HasFile Then

            Dim fileName As String = Path.GetFileName(uploader.PostedFile.FileName)
            uploader.PostedFile.SaveAs(Server.MapPath("./assets/uploads/") + fileName)
            Dim filepath As String = "./assets/uploads/" + fileName + ""

            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()


                cmd = New SqlCommand("UPDATE tblAccounts set img_path  = @p2 WHERE account_idpk = @p1 ", sqlCon)
                cmd.Parameters.AddWithValue("@p1", account_idpk.Text.ToString)
                cmd.Parameters.AddWithValue("@p2", filepath)
                cmd.ExecuteNonQuery()
                Image2.ImageUrl = filepath
                Response.Write(<script>alert("Upadated"); </script>)
                sqlCon.Close()
            End Using
        End If
    End Sub

End Class
