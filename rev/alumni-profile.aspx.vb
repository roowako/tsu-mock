Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Imports System.IO
Imports CloudinaryDotNet
Imports CloudinaryDotNet.Actions

Partial Class rev_alumni_profile
    Inherits System.Web.UI.Page
    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String
    Public Shared Property imgUrl As String

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
                    If IsDBNull(dr(20)) OrElse String.IsNullOrEmpty(dr.GetString(20)) Then
                        alumni_name.Text = dr.GetString(6)
                        account_idpk.Text = Session("id")
                        Image2.ImageUrl = "./assets/images/default-dp.jpg"

                    Else
                        alumni_name.Text = dr.GetString(6)
                        account_idpk.Text = Session("id")
                        Image2.ImageUrl = dr.GetString(20)
                    End If

                End While

                sqlCon.Close()
            End Using

            If Session("ul") = 3 Then
                dyna.HRef = Session("dynamic_link3")
                pointer.HRef = Session("dynamic_link3")
                Image2.ID = "non"
            ElseIf Session("ul") = 2 Then
                dyna.HRef = Session("dynamic_link2")
                pointer.HRef = Session("dynamic_link2")
                Image2.ID = "non"
            ElseIf Session("ul") = 1 Then
                dyna.HRef = Session("dynamic_link1")
                pointer.HRef = Session("dynamic_link1")
            ElseIf Session("ul") = 0 Then
                dyna.HRef = Session("dynamic_link1")
                pointer.HRef = Session("dynamic_link1")
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

    'FETCH INFO
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

    'EDIT EMAIL
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

    'EDIT CONTACT NUMBER
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


    'EDIT PASSWORD
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

    'LOG OUT
    Protected Sub alumni_logout_Click(sender As Object, e As EventArgs) Handles alumni_logout.ServerClick
        Session.Abandon()
        Response.Redirect("default.aspx")
    End Sub




    

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim counter As Integer = 1

        Dim s As String
        s = counter.ToString
        s = (++counter).ToString

        If uploader.HasFile Then

            Dim account = New Account(
                      "roowako06",
                      "198241248352399",
                      "qZn-nl_4iMIrQQc_QdM_dvW88Gg")

            Dim cloudinary = New Cloudinary(account)
            Dim uploadParams = New ImageUploadParams





            'Dim fileName = Path.GetFileName(uploader.PostedFile.FileName)

            Dim serverPath = Server.MapPath("./assets/uploads")

            Dim fullpath As String = Path.Combine(serverPath, Path.GetFileName(uploader.PostedFile.FileName))
            uploader.PostedFile.SaveAs(fullpath)

            uploadParams.File = New FileDescription("" & fullpath & "")



            Dim result = cloudinary.Upload(uploadParams)


            imgUrl = cloudinary.Api.UrlImgUp.Secure(True).Transform(New Transformation().Height(150).Crop("fit")).BuildUrl(result.PublicId + ".jpg")




            'Dim fileAPath As String = Server.MapPath(uploader.FileName)
            'Dim fileName = Path.GetFileName(uploader.PostedFile.FileName)



            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()


                cmd = New SqlCommand("UPDATE tblAccounts set img_path  = @p2 WHERE account_idpk = @p1 ", sqlCon)
                cmd.Parameters.AddWithValue("@p1", account_idpk.Text.ToString)
                cmd.Parameters.AddWithValue("@p2", imgUrl)
                cmd.ExecuteNonQuery()

                Response.Redirect("alumni-profile.aspx")
                sqlCon.Close()
            End Using

        Else




        End If
    End Sub
End Class
