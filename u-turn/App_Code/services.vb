Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Public Class servicesclass

    Public Sub updateServices(ByVal id As String, ByVal title As String, ByVal label As Integer, ByVal description As String)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [services] SET [title] = @title, [label] = @label, [description] = @description WHERE id=@id", cn)


                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@label", label)
                cmd.Parameters.AddWithValue("@description", description)
                cmd.Parameters.AddWithValue("@id", id)

                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub
    Public Sub deleteServices(ByVal id As Integer)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("DELETE FROM [services] WHERE id=@id", cn)

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
    Public Sub insertServices(ByVal title As String, ByVal label As Integer, ByVal description As String, ByVal position As Integer)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("INSERT INTO [services] ([title],[label],[description],[position])  VALUES (@title,@label,@description,@position) ", cn)

                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@description", description)
                cmd.Parameters.AddWithValue("@label", label)
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
    Public Sub positionServices(ByVal previous_title As String, ByVal id As Integer)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Dim cmd As New SqlCommand("SELECT [position] from [services] where title= @title", cn)
            Dim cmd2 As New SqlCommand("UPDATE [services] SET [position] = @position WHERE id=@id", cn)
            Dim cmd3 As New SqlCommand("UPDATE [services] SET [position] = [position]+1 WHERE [position] >= @position AND id !=@id", cn)

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

    Public Function selectServicesLabelsId(ByVal title As String) As Integer
        Dim nid As Integer
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [id] from [services_labels] where title= @title ", cn)
                cmd.Parameters.AddWithValue("@title", title)
                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                nid = DirectCast(rdr("id"), Integer)

                cn.Close()

            End Using
        End Using

        Return nid

    End Function




    Public Sub updateServicesLabels(ByVal id As Integer, ByVal title As String)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [services_labels] SET [title] = @title WHERE id=@id", cn)



                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@id", id)

                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub
    Public Sub updateServicesLabelsImage(ByVal id As Integer, ByVal image As String)






        Using cn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString)
            Using cmd As New SqlCommand("UPDATE [services_labels] SET [image] = @image WHERE id=@id", cn)



                cmd.Parameters.AddWithValue("@image", image)
                cmd.Parameters.AddWithValue("@id", id)

                cn.Open()

                cmd.ExecuteNonQuery()

                cn.Close()
            End Using
        End Using



    End Sub
    Public Sub insertServicesLabels(ByVal title As String, ByVal image As String)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("INSERT INTO [services_labels] ([title],[image])  VALUES (@title,@image) ", cn)

                cmd.Parameters.AddWithValue("@title", title)
                cmd.Parameters.AddWithValue("@image", image)

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
    Public Sub deleteServicesLabels(ByVal id As Integer)
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString

        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("DELETE FROM [services_labels] WHERE id=@id", cn)

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