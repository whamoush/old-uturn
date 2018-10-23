Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class aboutclass
    Public Sub insertAbout(ByVal title As String, ByVal description As String, ByVal dir As String, ByVal isrtl As Boolean)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("INSERT INTO [about] ([title],[description],[dir],[isrtl])  VALUES (@title,@description,@dir,@isrtl) ", cn)

                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@description", description)
                cmd.Parameters.AddWithValue("@dir", dir)
                cmd.Parameters.AddWithValue("@isrtl", isrtl)
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
    Public Sub updateAbout(ByVal id As Integer, ByVal description As String, ByVal title As String, ByVal dir As String, ByVal isrtl As Boolean)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [about] SET [title] = @title, [description]=@description,[dir]=@dir,[isrtl]=@isrtl WHERE id=@id", cn)



                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@description", description)
                cmd.Parameters.AddWithValue("@dir", dir)
                cmd.Parameters.AddWithValue("@isrtl", isrtl)
                cmd.Parameters.AddWithValue("@id", id)

                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub
    Public Sub deleteAbout(ByVal id As Integer)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("DELETE FROM [about] WHERE id=@id", cn)

                cmd.Parameters.AddWithValue("@id", id)

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
