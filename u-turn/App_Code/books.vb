Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Public Class booksclass
    Public Function CountBooksByCategory(ByVal id As Integer) As String
        Dim thiscount As Integer
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT COUNT(id) as thiscount from [books] where category=@nid", cn)
                cmd.Parameters.AddWithValue("@nid", id)
                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                thiscount = DirectCast(rdr("thiscount"), Integer)

                cn.Close()

            End Using
        End Using

        Return thiscount

    End Function
    Public Sub updateBooks(ByVal id As String, ByVal title As String, ByVal author As String, ByVal publisher As String, ByVal price As String, ByVal category As Integer, ByVal dir As String, ByVal isrtl As Boolean, ByVal featured As Boolean)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [books] SET [title] = @title, [author] = @author, [publisher] = @publisher, [price]=@price, [category]=@category, [dir]=@dir, [isrtl]=@isrtl, [featured]=@featured WHERE id=@id", cn)


                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@category", category)
                cmd.Parameters.AddWithValue("@author", author)
                cmd.Parameters.AddWithValue("@publisher", publisher)
                cmd.Parameters.AddWithValue("@price", price)
                cmd.Parameters.AddWithValue("@id", id)
                cmd.Parameters.AddWithValue("@dir", dir)
                cmd.Parameters.AddWithValue("@isrtl", isrtl)
                cmd.Parameters.AddWithValue("@featured", featured)

                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using
    End Sub
    Public Function selectBooksCategoriesId(ByVal category As String) As Integer
        Dim nid As Integer
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [id] from [books_categories] where category= @category", cn)
                cmd.Parameters.AddWithValue("@category", category)
                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                nid = DirectCast(rdr("id"), Integer)

                cn.Close()

            End Using
        End Using

        Return nid

    End Function
    Public Sub deleteBooks(ByVal id As Integer)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("DELETE FROM [books] WHERE id=@id", cn)

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
    Public Sub updateBooksImage(ByVal id As Integer, ByVal image As String)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [books] SET [image] = @image WHERE id=@id", cn)



                cmd.Parameters.AddWithValue("@image", image)
                cmd.Parameters.AddWithValue("@id", id)

                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub
    Public Sub insertBooks(ByVal title As String, ByVal category As Integer, ByVal image As String, ByVal position As Integer, ByVal dir As String, ByVal isrtl As Boolean, ByVal featured As Boolean)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("INSERT INTO [books] ([title],[category],[image],[position],[dir],[isrtl], [featured])  VALUES (@title,@category,@image,@position,@dir,@isrtl, @featured) ", cn)

                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@image", image)
                cmd.Parameters.AddWithValue("@category", category)
                cmd.Parameters.AddWithValue("@position", position)
                cmd.Parameters.AddWithValue("@dir", dir)
                cmd.Parameters.AddWithValue("@isrtl", isrtl)
                cmd.Parameters.AddWithValue("@featured", featured)
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
    Public Sub updateBooksCategories(ByVal id As Integer, ByVal category As String, ByVal color As String, ByVal dir As String, ByVal isrtl As Boolean)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [books_categories] SET [category] = @category, [color]=@color, [dir]=@dir, [isrtl]=@isrtl WHERE id=@id", cn)


                cmd.Parameters.AddWithValue("@category", category)
                cmd.Parameters.AddWithValue("@color", color)
                cmd.Parameters.AddWithValue("@dir", dir)
                cmd.Parameters.AddWithValue("@isrtl", isrtl)
                cmd.Parameters.AddWithValue("@id", id)

                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub
    Public Sub deleteBooksCategories(ByVal id As Integer)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("DELETE FROM [books_categories] WHERE id=@id", cn)

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
    Public Sub insertBooksCategories(ByVal category As String, ByVal color As String, ByVal dir As String, ByVal isrtl As Boolean, ByVal position As Integer)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("INSERT INTO [books_categories] ([category],[color],[dir],[isrtl],[position])  VALUES (@category,@color,@dir,@isrtl,@position) ", cn)

                cmd.Parameters.AddWithValue("@category", category)
                cmd.Parameters.AddWithValue("@color", color)
                cmd.Parameters.AddWithValue("@dir", dir)
                cmd.Parameters.AddWithValue("@isrtl", isrtl)
                cmd.Parameters.AddWithValue("@position", position)
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
    Public Sub positionBooks(ByVal previous_title As String, ByVal id As Integer)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Dim cmd As New SqlCommand("SELECT [position] from [books] where title= @title", cn)
            Dim cmd2 As New SqlCommand("UPDATE [books] SET [position] = @position WHERE id=@id", cn)
            Dim cmd3 As New SqlCommand("UPDATE [books] SET [position] = [position]+1 WHERE [position] >= @position AND id !=@id", cn)

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
    Public Sub positionBooksCategories(ByVal previouscategory As String, ByVal id As Integer)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Dim cmd As New SqlCommand("SELECT [position] from [books_categories] where category= @category", cn)
            Dim cmd2 As New SqlCommand("UPDATE [books_categories] SET [position] = @position WHERE id=@id", cn)
            Dim cmd3 As New SqlCommand("UPDATE [books_categories] SET [position] = [position]+1 WHERE [position] >= @position AND id !=@id", cn)

            cmd.Parameters.AddWithValue("@category", previouscategory)

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
