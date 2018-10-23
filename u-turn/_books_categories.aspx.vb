Imports Telerik.Web.UI
Imports System.IO
Imports System.Data.SqlClient
Partial Class _abooks_categories
    Inherits Telerik.Web.UI.RadAjaxPage
    Public folderpath As String = "img/assets/img/books/"
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load




    End Sub





    Protected Sub rpCategories_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpCategories.ItemCommand

        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim txtCategory As TextBox = e.Item.FindControl("txtCategory")
        Dim rcpColor As radcolorpicker = e.Item.FindControl("rcpColor")
        Dim color As String = System.Drawing.ColorTranslator.ToHtml(rcpColor.SelectedColor)
        Dim cbDir As CheckBox = e.Item.FindControl("cbDir")
        Dim ddlPosition As DropDownList = e.Item.FindControl("ddlPosition")
        Dim book As New booksclass
      


        If e.CommandName = "save" Then

            If cbDir.Checked = True Then
                book.updateBooksCategories(lblId.Text, txtCategory.Text, color, "rtl", True)


            Else
                book.updateBooksCategories(lblId.Text, txtCategory.Text, color, "ltr", False)
            End If


            lblDone.Visible = True
            rpCategories.DataBind()
        End If
        If e.CommandName = "order" Then
            book.positionBooksCategories(ddlPosition.SelectedValue, lblId.Text)
            rpCategories.DataBind()
            rpCategories.DataBind()
            lblDone.Text = "Category Repositioned"
            lblDone.Visible = True
        End If
        If e.CommandName = "delete" Then

            book.deleteBooksCategories(lblId.Text)

            lblDone.Text = "Category Deleted"
            lblDone.Visible = True

            rpCategories.DataBind()
        End If

    End Sub



    Protected Sub rpCategories_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpCategories.ItemDataBound
        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim lblColor As Label = e.Item.FindControl("lblColor")
        Dim rcpColor As RadColorPicker = e.Item.FindControl("rcpColor")
        Dim lblIsrtl As Label = e.Item.FindControl("lblIsrtl")
        Dim cbDir As CheckBox = e.Item.FindControl("cbDir")
        Dim ds_Position As SqlDataSource = e.Item.FindControl("ds_Position")
        rcpColor.SelectedColor = System.Drawing.ColorTranslator.FromHtml("" & lblColor.Text & "")

        cbDir.Checked = CBool(lblIsrtl.Text)


        ds_Position.SelectCommand = "select [category] from books_categories where id !=(select id from books_categories where id= " & lblId.Text & " ) order by position asc"
        ds_Position.DataBind()




    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Dim thisbook As New booksclass '
        Dim color As String = System.Drawing.ColorTranslator.ToHtml(rcpNewColor.SelectedColor)






        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [position] from [books_categories] where position=(SELECT MAX(position) FROM [books_categories])", cn)

                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                Dim maxposition As Integer = DirectCast(rdr("position"), Integer)



                If cbDir.Checked = True Then
                    thisbook.insertBooksCategories(txtNewCategory.Text, color, "rtl", True, maxposition + 1)
                Else
                    thisbook.insertBooksCategories(txtNewCategory.Text, color, "ltr", False, maxposition + 1)
                End If

                lblDone.Text = "Category Added."
                lblDone.Visible = True

                rpCategories.DataBind()
                cn.Close()

            End Using
        End Using












      
    End Sub
End Class


