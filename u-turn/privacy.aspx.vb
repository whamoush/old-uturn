Imports System.Data.SqlClient
Partial Class privacy
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [description] from [general] where category=@category", cn)
                cmd.Parameters.AddWithValue("@category", "privacy")
                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                ltlPrivacy.Text = DirectCast(rdr("description"), String)

                cn.Close()

            End Using
        End Using
    End Sub
  
End Class
