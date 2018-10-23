Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Public Class user
    Private _ID As Integer
    Private _name As String
    Private _pass As String

    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(ByVal value As Integer)
            _ID = value
        End Set
    End Property

    Public Property name() As String
        Get
            Return _name
        End Get
        Set(ByVal value As String)
            _name = value
        End Set
    End Property

    Public Property pass() As String
        Get
            Return _pass
        End Get
        Set(ByVal value As String)
            _pass = value
        End Set
    End Property

    Public Sub New()
        _ID = 0
        _name = String.Empty
        _pass = String.Empty
    End Sub


    Public Function exist(ByVal username As String, ByVal password As String) As Boolean
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [id],[name],[pass] FROM [user] WHERE [name] = @name and pass=@pass ", cn)

                cmd.Parameters.AddWithValue("@name", username)
                cmd.Parameters.AddWithValue("@pass", password)

                Try
                    cn.Open()
                    Dim rdr As SqlDataReader = cmd.ExecuteReader()
                    If rdr.Read() Then
                        Return True
                    Else
                        Return False
                    End If
                    cn.Close()
                Catch ex As Exception
                    Throw ex
                End Try
            End Using
        End Using
    End Function
    Public Function forgotcheck(ByVal email As String) As Boolean
        Dim isThere As Boolean
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [email] FROM [user] WHERE [email] = @email", cn)

                cmd.Parameters.AddWithValue("@email", email)

                Try
                    cn.Open()
                    Dim rdr As SqlDataReader = cmd.ExecuteReader()
                    If rdr.Read = True Then
                        isThere = True
                    Else
                        isThere = False
                    End If
                    cn.Close()
                Catch ex As Exception
                    Throw ex
                End Try
            End Using
        End Using
        Return isThere
    End Function
    Public Function password(ByVal name As String) As String
        Dim isUser As String
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [pass] FROM [user] WHERE [name] = @name", cn)

                cmd.Parameters.AddWithValue("@name", name)

                Try
                    cn.Open()
                    Dim rdr As SqlDataReader = cmd.ExecuteReader()
                    rdr.Read()
                    isUser = DirectCast(rdr("pass"), String)
                    cn.Close()
                Catch ex As Exception
                    Throw ex
                End Try
            End Using
        End Using
        Return isUser
    End Function
    Public Function email(ByVal name As String) As String
        Dim isEmail As String
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [email] FROM [user] WHERE [name] = @name", cn)

                cmd.Parameters.AddWithValue("@name", name)

                Try
                    cn.Open()
                    Dim rdr As SqlDataReader = cmd.ExecuteReader()
                    rdr.Read()
                    isEmail = DirectCast(rdr("email"), String)
                    cn.Close()
                Catch ex As Exception
                    Throw ex
                End Try
            End Using
        End Using
        Return isEmail
    End Function



    Public Function thisuser(ByVal name As String) As Boolean
        Dim isEmail As Boolean = False
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [name] FROM [user] WHERE [name] = @name", cn)

                cmd.Parameters.AddWithValue("@name", name)

                Try
                    cn.Open()
                    Dim rdr As SqlDataReader = cmd.ExecuteReader()
                    If rdr.Read() = True Then
                        isEmail = True
                    Else
                        isEmail = False
                    End If

                    cn.Close()
                Catch ex As Exception
                    Throw ex
                End Try
            End Using
        End Using
        Return isEmail
    End Function

    Public Sub updatePassword(ByVal name As String, ByVal thispass As String)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [user] SET pass = @pass WHERE name=@name", cn)


                cmd.Parameters.AddWithValue("@pass", thispass)
                cmd.Parameters.AddWithValue("@name", name)
                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub

    Public Sub updateEmail(ByVal name As String, ByVal thisemail As String)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [user] SET email = @email WHERE name=@name", cn)


                cmd.Parameters.AddWithValue("@email", thisemail)
                cmd.Parameters.AddWithValue("@name", name)
                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub
    Public Sub adduser(ByVal username As String, ByVal email As String, ByVal pass As String)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("INSERT INTO [user] ([name],[email],[pass])  VALUES (@name,@email,@pass) ", cn)

                cmd.Parameters.AddWithValue("@name", username)
                cmd.Parameters.AddWithValue("@email", email)
                cmd.Parameters.AddWithValue("@pass", pass)

                Try
                    cn.Open()
                    cmd.ExecuteNonQuery()
                    cn.Close()
                Catch ex As Exception
                    Throw ex
                End Try
            End Using
        End Using
    End Sub
    Public Sub deleteuser(ByVal thisuser As String)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("DELETE FROM [user] WHERE name=@name", cn)

                cmd.Parameters.AddWithValue("@name", thisuser)

                Try
                    cn.Open()
                    cmd.ExecuteNonQuery()
                    cn.Close()
                Catch ex As Exception
                    Throw ex
                End Try
            End Using
        End Using
    End Sub
  
End Class
