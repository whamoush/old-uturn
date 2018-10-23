
Imports System.Data.SqlClient
Imports System.IO

Partial Class _edit_book
    Inherits System.Web.UI.Page

    Public folderpath As String = "img/assets/img/books/"
    Protected Sub rpBooks_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles rpBooks.ItemCommand
        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim txtTitle As TextBox = e.Item.FindControl("txtTitle")
        Dim txtAuthor As TextBox = e.Item.FindControl("txtAuthor")
        Dim txtPublisher As TextBox = e.Item.FindControl("txtPublisher")
        Dim txtPrice As TextBox = e.Item.FindControl("txtPrice")
        Dim ddlCategory As DropDownList = e.Item.FindControl("ddlCategory")
        Dim ddlPosition As DropDownList = e.Item.FindControl("ddlPosition")
        Dim fuImage As FileUpload = e.Item.FindControl("fuImage")
        Dim lblImage As Label = e.Item.FindControl("lblImage")
        Dim featuredChk As CheckBox = e.Item.FindControl("featuredChk")
        Dim arabicChk As CheckBox = e.Item.FindControl("arabicChk")
        Dim savebook As New booksclass


        If e.CommandName = "save" Then
            Dim categoryId As Integer = savebook.selectBooksCategoriesId(ddlCategory.SelectedValue)

            savebook.updateBooks(lblId.Text, txtTitle.Text, txtAuthor.Text, txtPublisher.Text, txtPrice.Text, categoryId, If(arabicChk.Checked, "rtl", "ltr"), arabicChk.Checked, featuredChk.Checked)

            If (arabicChk.Checked <> True) Then
                Response.Redirect("_books.aspx")
            Else
                Response.Redirect("_books_arabic.aspx")
            End If
        End If



        If e.CommandName = "order" Then
            savebook.positionBooks(ddlPosition.SelectedValue, lblId.Text)
            If (arabicChk.Checked <> True) Then
                Response.Redirect("_books.aspx")
            Else
                Response.Redirect("_books_arabic.aspx")
            End If
        End If

        If e.CommandName = "delete" Then
            If lblImage.Text = "noimage.jpg" Then

            Else
                File.Delete(Server.MapPath(folderpath) & lblImage.Text)
            End If

            savebook.deleteBooks(lblId.Text)
            If (arabicChk.Checked <> True) Then
                Response.Redirect("_books.aspx")
            Else
                Response.Redirect("_books_arabic.aspx")
            End If

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
                If (arabicChk.Checked <> True) Then
                    Response.Redirect("_books.aspx")
                Else
                    Response.Redirect("_books_arabic.aspx")
                End If

            End If
        End If
    End Sub

    Protected Sub rpBooks_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles rpBooks.ItemDataBound
        Dim ds_Position As SqlDataSource = e.Item.FindControl("ds_Position")
        Dim id As String = Request.QueryString("id")

        ds_Position.SelectCommand = "select [title] from books WHERE [dir]='ltr' AND id !=(select id from books where id = " & id & " ) order by position asc"

        ds_Position.DataBind()

        Dim ddlCat As DropDownList = e.Item.FindControl("ddlCategory")
        Dim catId As Label = e.Item.FindControl("lblCategory")

        ddlCat.Items.FindByValue(catId.Text).Selected = True
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim id As String = Request.QueryString("id")

        ds_Books.SelectCommand = "select * from books where id = " & id

        ds_Books.DataBind()
    End Sub

End Class
