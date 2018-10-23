
Partial Class books
    Inherits Telerik.Web.UI.RadAjaxPage

    Protected Sub rpBooks_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpBooks.ItemDataBound
        Dim lblCategory As Label = e.Item.FindControl("lblCategory")
        Dim ds_ThisCategory As SqlDataSource = e.Item.FindControl("ds_ThisCategory")
        ds_ThisCategory.SelectCommand = "select id, category, color from books_categories where id=" & lblCategory.Text
        ds_ThisCategory.DataBind()
    End Sub

    Protected Sub rpCategories_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpCategories.ItemCommand
        Dim lblId As Label = e.Item.FindControl("lblId")
        If e.CommandName = "categorize" Then
            ds_Books.SelectCommand = "select id, title, author, publisher, price, image, category, dir, isrtl from books where isrtl = 0 and category=" & lblId.Text
            ds_Books.DataBind()


        End If
    End Sub

    Protected Sub rpCategories_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpCategories.ItemDataBound
        Dim ltlCount As Literal = e.Item.FindControl("ltlCount")
        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim thisbook As New booksclass
        ltlCount.Text = thisbook.CountBooksByCategory(lblId.Text)
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ds_Books.SelectCommand = "select [id], title, author, publisher, price, image, category, dir, isrtl from books where isrtl = 0 ORDER BY position ASC"
            ds_Books.DataBind()

        End If
    End Sub

    Protected Sub RadSearchBox1_Search(sender As Object, e As Telerik.Web.UI.SearchBoxEventArgs) Handles RadSearchBox1.Search
        ds_Books.SelectCommand = "select [id], title, author, publisher, price, image, dir, isrtl, category from books where isrtl = 0 and id=" & e.Value

        ds_Books.DataBind()
    End Sub

    Protected Sub btnGo_Click(sender As Object, e As System.EventArgs) Handles btnGo.Click
        ds_Books.SelectCommand = "select [id], title, author, publisher, price, image, category, dir, isrtl from books ORDER BY where isrtl = 0 position ASC"
        rpBooks.DataBind()
        RadSearchBox1.Text = String.Empty

        ds_Books.DataBind()
    End Sub
End Class
