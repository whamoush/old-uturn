Imports System.Data.SqlClient
Imports System.IO
Partial Class _books_arabic
    Inherits Telerik.Web.UI.RadAjaxPage
    Public folderpath As String = "img/assets/img/books/"

    Protected Sub rpBooks_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpBooks.ItemCommand
        Response.Redirect("_edit_book.aspx?id=" & e.CommandName & "&isrtl='rtl'")
    End Sub

    Protected Sub RadSearchBox1_Search(sender As Object, e As Telerik.Web.UI.SearchBoxEventArgs) Handles RadSearchBox1.Search
        ds_Books.SelectCommand = "select [id], SUBSTRING(title, 1, 20) as mytitle, title, author, publisher, price, image, category, isrtl from books where [dir]='rtl' and id=" & e.Value

        ds_Books.DataBind()
    End Sub

    Protected Sub rpCategories_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpCategories.ItemDataBound
        Dim ltlCount As Literal = e.Item.FindControl("ltlCount")
        Dim lblId As Label = e.Item.FindControl("lblId")


        Dim thisbook As New booksclass
        ltlCount.Text = thisbook.CountBooksByCategory(lblId.Text)


    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Dim insertbook As New booksclass


        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [position] from [books] where position=(SELECT MAX(position) FROM [books] WHERE [dir]='rtl')", cn)

                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                Dim maxposition As Integer = DirectCast(rdr("position"), Integer)
                insertbook.insertBooks("new book", 1, "noimage.jpg", maxposition + 1, "ltr", False, False)
                cn.Close()

            End Using
        End Using
        Response.Redirect("~/_new_book.aspx")







    End Sub

    Protected Sub btnGo_Click(sender As Object, e As System.EventArgs) Handles btnGo.Click
        ds_Books.SelectCommand = "select [id], SUBSTRING(title, 1, 20) as mytitle,title, author, publisher, price, image, category, isrtl from books WHERE [dir]='rtl' ORDER BY position ASC"
        rpBooks.DataBind()
        RadSearchBox1.Text = String.Empty
        ds_Books.DataBind()
    End Sub

    Private Sub rpCategories_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles rpCategories.ItemCommand
        Dim lblId As Label = e.Item.FindControl("lblId")
        If e.CommandName = "categorize" Then
            ds_Books.SelectCommand = "select id, title, author, publisher, price, image, category, dir, isrtl from books where isrtl = 1 and category=" & lblId.Text
            ds_Books.DataBind()


        End If
    End Sub
End Class
