Imports System.Data.SqlClient
Imports System.IO
Partial Class _new_book
    Inherits Telerik.Web.UI.RadAjaxPage
    Public folderpath As String = "img/assets/img/books/"

    Protected Sub rpBooks_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpBooks.ItemCommand
        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim txtTitle As TextBox = e.Item.FindControl("txtTitle")
        Dim txtAuthor As TextBox = e.Item.FindControl("txtAuthor")
        Dim txtPublisher As TextBox = e.Item.FindControl("txtPublisher")
        Dim txtPrice As TextBox = e.Item.FindControl("txtPrice")
        Dim ddlCategory As DropDownList = e.Item.FindControl("ddlCategory")
        Dim ddlPosition As DropDownList = e.Item.FindControl("ddlPosition")
        Dim fuImage As FileUpload = e.Item.FindControl("fuImage")
        Dim lblImage As Label = e.Item.FindControl("lblImage")
        Dim cbDir As CheckBox = e.Item.FindControl("cbDir")
        Dim featuredChk As CheckBox = e.Item.FindControl("featuredChk")
        Dim savebook As New booksclass


        If e.CommandName = "save" Then
            Dim categoryId As Integer = savebook.selectBooksCategoriesId(ddlCategory.SelectedValue)

            savebook.updateBooks(lblId.Text, txtTitle.Text, txtAuthor.Text, txtPublisher.Text, txtPrice.Text, categoryId, If(cbDir.Checked, "rtl", "ltr"), cbDir.Checked, featuredChk.Checked)

            rpBooks.DataBind()

            lblDone.Visible = True

        End If
        If e.CommandName = "order" Then
            savebook.positionBooks(ddlPosition.SelectedValue, lblId.Text)
            rpBooks.DataBind()

            lblDone.Text = "Book Repositioned"
            lblDone.Visible = True
        End If
        If e.CommandName = "delete" Then
            If lblImage.Text = "noimage.jpg" Then

            Else
                File.Delete(Server.MapPath(folderpath) & lblImage.Text)
            End If

            savebook.deleteBooks(lblId.Text)

            Response.Redirect("~/_books.aspx?lbdone=del")


        End If
        If e.CommandName = "upload" Then
            If fuImage.FileName = Nothing Then
            Else
                If lblImage.Text = "noimage.jpg" Then
                Else
                    File.Delete(Server.MapPath(folderpath) & lblImage.Text)
                End If


                fuImage.SaveAs(Server.MapPath(folderpath) & fuImage.FileName)
                savebook.updateBooksImage(lblId.Text, fuImage.FileName)
                rpBooks.DataBind()
                lblDone.Text = "New Image Uploaded."
                lblDone.Visible = True

            End If
        End If
    End Sub

    Protected Sub rpBooks_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpBooks.ItemDataBound
        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim lblCategory As Label = e.Item.FindControl("lblCategory")
        Dim lbltitle As Label = e.Item.FindControl("lblTitle")
        Dim lblIsrtl As Label = e.Item.FindControl("lblIsrtl")
        Dim cbDir As CheckBox = e.Item.FindControl("cbDir")
        cbDir.Checked = CBool(lblIsrtl.Text)
        Dim ddlCategory As DropDownList = e.Item.FindControl("ddlCategory")
        If lbltitle.Text.Length = 20 Then
            lbltitle.Text = lbltitle.Text & "..."

        End If

        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [category] from [books_categories] where id=" & lblCategory.Text, cn)


                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                ddlCategory.SelectedValue = DirectCast(rdr("category"), String)

                cn.Close()

            End Using
        End Using

        Dim ds_Position As SqlDataSource = e.Item.FindControl("ds_Position")
        ds_Position.SelectCommand = "select [title] from books where id !=(select id from books where id= " & lblId.Text & " ) order by position asc"
        ds_Position.DataBind()
    End Sub





    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        lblDone.Visible = True

        ds_Books.SelectCommand = "select [id], SUBSTRING(title, 1, 20) as mytitle, title, author, publisher, price, image, category, isrtl, featured from books WHERE id=(SELECT max(id) from books) ORDER BY [position] asc"
        ds_Books.DataBind()



    End Sub





    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Dim insertbook As New booksclass


        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [position] from [books] where position=(SELECT MAX(position) FROM [books])", cn)

                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                Dim maxposition As Integer = DirectCast(rdr("position"), Integer)
                insertbook.insertBooks("new book", 1, "noimage.jpg", maxposition + 1, "ltr", False, False)
                rpBooks.DataBind()
                cn.Close()

            End Using
        End Using








    End Sub
End Class
