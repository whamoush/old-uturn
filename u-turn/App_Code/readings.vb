Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Class readingsclass
    Public Sub InsertReading(ByVal author As String, ByVal text As String, ByVal active As Boolean, ByVal arabic As Boolean)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("insert into readings(author, text, active, arabic) values (@author, @text, @active, @arabic)", cn)

                cmd.Parameters.AddWithValue("@author", author)
                cmd.Parameters.AddWithValue("@text", text)
                cmd.Parameters.AddWithValue("@active", active)
                cmd.Parameters.AddWithValue("@arabic", arabic)

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

    Public Sub UpdateReading(ByVal id As Integer, ByVal author As String, ByVal text As String, ByVal active As Boolean, ByVal arabic As Boolean)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("update readings set author = @author, text = @text, active = @active, arabic = @arabic where id = @id", cn)

                cmd.Parameters.AddWithValue("@author", author)
                cmd.Parameters.AddWithValue("@text", text)
                cmd.Parameters.AddWithValue("@active", active)
                cmd.Parameters.AddWithValue("@id", id)
                cmd.Parameters.AddWithValue("@arabic", arabic)

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

    Public Sub DeleteReading(ByVal id As Integer)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("delete from readings where id = @id", cn)

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
