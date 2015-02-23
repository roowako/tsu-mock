Option Strict On
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Services
Imports System.Web.Script.Serialization
Imports System.Linq
Imports System.Web
Imports System.Collections.Generic
Imports System.Text

Partial Class token_generator_ui
    Inherits System.Web.UI.Page
    Public Shared Property constr As String = "Data Source=SQL5012.Smarterasp.net;Initial Catalog=DB_9BB7E6_tsuat;User Id=DB_9BB7E6_tsuat_admin;Password=masterfile;"
    Public Shared Property sqlCon As SqlConnection
    Public Shared Property cmd As SqlCommand
    Public Shared Property dr As SqlDataReader

    Public Shared Property sqlStr As String
    Public Shared Property getLast As String

    'PAGE LOAD
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session.Item("id") Is Nothing Then
            Console.Write("sd")
            Response.Redirect("Default.aspx")
        Else
            Image2.ID = "non"
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                cmd = New SqlCommand("SELECT given_name,account_idpk,college_idfk FROM tblAccounts WHERE account_idpk=@p1", sqlCon)
                cmd.Parameters.AddWithValue("@p1", Session("id"))
                dr = cmd.ExecuteReader

                While dr.Read
                    alumni_name.Text = dr.GetString(0)
                    account_idpk.Text = CStr(dr.GetValue(1))
                    college_idfk.Text = CStr(dr.GetValue(2))
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

    'SERIALIZER
    Public Shared Function GetJson(ByVal dt As DataTable) As String
        Dim serializer As New System.Web.Script.Serialization.JavaScriptSerializer()
        serializer.MaxJsonLength = Int32.MaxValue

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

    'GENERATE TOKENS
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function generateTokens(ByVal keyNumber As Integer, ByVal college_idfk As Integer) As String
        Dim KeyGen As RandomKeyGenerator
        Dim i_keys As Integer
        Dim randomKey As String = ""

        For i_keys = 1 To keyNumber
            Using sqlCon As New SqlConnection(constr)
                sqlCon.Open()

                KeyGen = New RandomKeyGenerator
                KeyGen.KeyLetters = "abcdefghijklmnopqrstuvwxyz"
                KeyGen.KeyNumbers = "0123456789"
                KeyGen.KeyChars = 5

                randomKey = KeyGen.Generate()


                sqlStr = "INSERT INTO tblTokens(college_idfk,description,status) VALUES('" & college_idfk & "','" & randomKey & "',0)"
                cmd = New SqlCommand(sqlStr, sqlCon)
                cmd.ExecuteNonQuery()

                sqlCon.Close()
            End Using
        Next

        Return "Tokens generated successfully."
    End Function

    'RANDOM GENERATOR
    Public Class RandomKeyGenerator
        Dim Key_Letters As String
        Dim Key_Numbers As String
        Dim Key_Chars As Integer
        Dim LettersArray As Char()
        Dim NumbersArray As Char()

        Protected Friend WriteOnly Property KeyLetters() As String
            Set(ByVal Value As String)
                Key_Letters = Value
            End Set
        End Property

        Protected Friend WriteOnly Property KeyNumbers() As String
            Set(ByVal Value As String)
                Key_Numbers = Value
            End Set
        End Property

        Protected Friend WriteOnly Property KeyChars() As Integer
            Set(ByVal Value As Integer)
                Key_Chars = Value
            End Set
        End Property

        Function Generate() As String
            Dim i_key As Integer
            Dim Random1 As Single
            Dim arrIndex As Int16
            Dim sb As New StringBuilder
            Dim RandomLetter As String

            LettersArray = Key_Letters.ToCharArray
            NumbersArray = Key_Numbers.ToCharArray

            For i_key = 1 To Key_Chars

                Randomize()
                Random1 = Rnd()
                arrIndex = -1
              
                If (CType(Random1 * 111, Integer)) Mod 2 = 0 Then
                    
                    Do While arrIndex < 0
                        arrIndex = _
                         Convert.ToInt16(LettersArray.GetUpperBound(0) _
                         * Random1)
                    Loop
                    RandomLetter = LettersArray(arrIndex)
                   
                    If (CType(arrIndex * Random1 * 99, Integer)) Mod 2 <> 0 Then
                        RandomLetter = LettersArray(arrIndex).ToString
                        RandomLetter = RandomLetter.ToUpper
                    End If
                    sb.Append(RandomLetter)
                Else
                    
                    Do While arrIndex < 0
                        arrIndex = _
                          Convert.ToInt16(NumbersArray.GetUpperBound(0) _
                          * Random1)
                    Loop
                    sb.Append(NumbersArray(arrIndex))
                End If
            Next
            Return sb.ToString
        End Function
    End Class

    'FETCH TOKENS
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullFromServer(ByVal college As Integer) As String
        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using da = New SqlDataAdapter("SELECT * FROM tblTokens WHERE college_idfk = '" & college & "' AND status=0 ", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using

            sqlCon.Close()
        End Using

    End Function

    'PRINT TOKENS
    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function printTokens(ByVal college As Integer) As String
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()

            Using da = New SqlDataAdapter("SELECT * FROM tblTokens WHERE college_idfk = '" & college & "' AND status=0 ", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)

                Dim jsndata As String = GetJson(table)
                'Return jsndata
                Return table.Rows.Count.ToString
                sqlCon.Close()
            End Using

            sqlCon.Close()
        End Using
    End Function
End Class
