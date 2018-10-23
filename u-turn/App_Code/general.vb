Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Public Class generalclass
    Public Function generaldescription(ByVal category As String) As String
        Dim thelink As String
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [Description] FROM [general] where [category]=@category", cn)
                cmd.Parameters.AddWithValue("@category", category)
                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                thelink = DirectCast(rdr("description"), String)

                cn.Close()

            End Using
        End Using

        Return thelink

    End Function


    Public Sub updateGeneralDescriptionLink(ByVal description As String, ByVal category As String)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [general] SET description = @description WHERE category=@category", cn)


                cmd.Parameters.AddWithValue("@description", description)
                cmd.Parameters.AddWithValue("@category", category)
                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub
    Public Sub updateGeneral(ByVal id As Integer, ByVal description As String, ByVal title As String, ByVal category As String)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [general] SET [title] = @title, [description]=@description,[category]=@category WHERE id=@id", cn)



                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@description", description)
                cmd.Parameters.AddWithValue("@category", category)
                cmd.Parameters.AddWithValue("@id", id)

                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub
    Public Sub updateGeneralbyCategory(ByVal id As Integer, ByVal description As String, ByVal category As String)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [general] SET [description] = @description  WHERE id=@id and category=@category", cn)




                cmd.Parameters.AddWithValue("@description", description)
                cmd.Parameters.AddWithValue("@category", category)
                cmd.Parameters.AddWithValue("@id", id)

                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub
    Public Sub deleteGeneral(ByVal id As Integer)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("DELETE FROM [general] WHERE id=@id", cn)

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
    Public Sub insertGeneral(ByVal title As String, ByVal description As String, ByVal category As String)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("INSERT INTO [general] ([title],[category],[description])  VALUES (@title,@category,@description) ", cn)

                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@description", description)
                cmd.Parameters.AddWithValue("@category", category)
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
