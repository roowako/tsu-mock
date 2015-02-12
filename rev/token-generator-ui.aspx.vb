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

    <System.Web.Services.WebMethod()> _
    <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function generateTokens(ByVal numKey As Integer) As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database

        For i As Integer = 1 To 10
            Console.WriteLine(numKey)
        Next
        Return numKey.ToString
    End Function

    Public Class RandomKeyGenerator
        Dim Key_Letters As String
        Dim Key_Numbers As String
        Dim Key_Chars As Integer
        Dim LettersArray As Char()
        Dim NumbersArray As Char()

        ''' <date>27072005</date><time>071924</time>
        ''' <type>property</type>
        ''' <summary>
        ''' WRITE ONLY PROPERTY. HAS TO BE SET BEFORE CALLING GENERATE()
        ''' </summary>
        Protected Friend WriteOnly Property KeyLetters() As String
            Set(ByVal Value As String)
                Key_Letters = Value
            End Set
        End Property

        ''' <date>27072005</date><time>071924</time>
        ''' <type>property</type>
        ''' <summary>
        ''' WRITE ONLY PROPERTY. HAS TO BE SET BEFORE CALLING GENERATE()
        ''' </summary>
        Protected Friend WriteOnly Property KeyNumbers() As String
            Set(ByVal Value As String)
                Key_Numbers = Value
            End Set
        End Property

        ''' <date>27072005</date><time>071924</time>
        ''' <type>property</type>
        ''' <summary>
        ''' WRITE ONLY PROPERTY. HAS TO BE SET BEFORE CALLING GENERATE()
        ''' </summary>
        Protected Friend WriteOnly Property KeyChars() As Integer
            Set(ByVal Value As Integer)
                Key_Chars = Value
            End Set
        End Property

        ''' <date>27072005</date><time>072344</time>
        ''' <type>function</type>
        ''' <summary>
        ''' GENERATES A RANDOM STRING OF LETTERS AND NUMBERS.
        ''' LETTERS CAN BE RANDOMLY CAPITAL OR SMALL.
        ''' </summary>
        ''' <returns type="String">RETURNS THE
        '''         RANDOMLY GENERATED KEY</returns>
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

    Protected Sub btn_generate_tokens_Click(sender As Object, e As EventArgs) Handles btn_generate_tokens.Click
        Using sqlCon As New SqlConnection(constr)
            sqlCon.Open()
            Dim KeyGen As RandomKeyGenerator
            Dim numKeys As Integer
            Dim i_keys As Integer
            Dim randomKey As String

            numKeys = Integer.Parse(generate_number_of_tokens.Text)
            KeyGen = New RandomKeyGenerator
            KeyGen.KeyLetters = "abcdefghijklmnopqrstuvwxyz"
            KeyGen.KeyNumbers = "0123456789"
            KeyGen.KeyChars = 5

            For i_keys = 1 To numKeys
                randomKey = KeyGen.Generate()
                Console.WriteLine(randomKey)
                sqlStr = "INSERT INTO tblTokens(college_idfk,description,status) VALUES(2,'" & randomKey & "',0)"
                cmd = New SqlCommand(sqlStr, sqlCon)

                cmd.ExecuteNonQuery()
            Next
            sqlCon.Close()
        End Using
    End Sub

    <System.Web.Services.WebMethod()> _
   <ScriptMethod(ResponseFormat:=ResponseFormat.Json)> _
    Public Shared Function pullFromServer() As String
        'Function named PushToDatabase 
        'Includes delimitation of user input
        'Opening and Closing Connection to the database
        'Adding datas to database


        Using sqlCon As New SqlConnection(constr)

            sqlCon.Open()
            Using da = New SqlDataAdapter(" SELECT * FROM tblTokens", sqlCon)
                Dim table = New DataTable()
                da.Fill(table)
                
                Dim jsndata As String = GetJson(table)
                Return jsndata
            End Using




            sqlCon.Close()

            'Returning Message : Fail or Successful


        End Using

    End Function
End Class
