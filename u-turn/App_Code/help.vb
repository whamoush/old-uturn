Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Public Class helpclass
    Public Sub updateHelp(ByVal id As String, ByVal title As String, ByVal description As String, ByVal dir As String, ByVal isrtl As Boolean)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [help] SET [title] = @title, [description] = @description, [dir] = @dir, [isrtl] =@isrtl WHERE id=@id", cn)


                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@description", description)
                cmd.Parameters.AddWithValue("@id", id)
                cmd.Parameters.AddWithValue("@dir", dir)
                cmd.Parameters.AddWithValue("@isrtl", isrtl)

                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub
    Public Sub deleteHelp(ByVal id As Integer)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("DELETE FROM [help] WHERE id=@id", cn)

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
    Public Sub insertHelp(ByVal title As String, ByVal description As String, ByVal position As Integer, ByVal dir As String, ByVal isrtl As Boolean)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("INSERT INTO [help] ([title],[description],[position],[dir],[isrtl])  VALUES (@title,@description,@position,@dir,@isrtl) ", cn)

                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@description", description)
                cmd.Parameters.AddWithValue("@position", position)
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
    Public Sub positionHelp(ByVal previous_title As String, ByVal id As Integer)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Dim cmd As New SqlCommand("SELECT [position] from [help] where title= @title", cn)
            Dim cmd2 As New SqlCommand("UPDATE [help] SET [position] = @position WHERE id=@id", cn)
            Dim cmd3 As New SqlCommand("UPDATE [help] SET [position] = [position]+1 WHERE [position] >= @position AND id !=@id", cn)

            cmd.Parameters.AddWithValue("@title", previous_title)

            cn.Open()
            Dim rdr As SqlDataReader = cmd.ExecuteReader()
            rdr.Read()
            Dim wanted_position As Integer = DirectCast(rdr("position"), Integer)
            cn.Close()

            cmd2.Parameters.AddWithValue("@position", wanted_position)
            cmd2.Parameters.AddWithValue("@id", id)
            cn.Open()
            cmd2.ExecuteNonQuery()
            cn.Close()

            cmd3.Parameters.AddWithValue("@position", wanted_position)
            cmd3.Parameters.AddWithValue("@id", id)
            cn.Open()
            cmd3.ExecuteNonQuery()
            cn.Close()



        End Using



    End Sub
End Class
