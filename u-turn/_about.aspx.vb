
Partial Class _aabout
    Inherits System.Web.UI.Page



    Protected Sub rpAbout_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpAbout.ItemCommand
        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim txtTitle As TextBox = e.Item.FindControl("txtTitle")
        Dim txtDescription As TextBox = e.Item.FindControl("txtDescription")
        Dim cbDir As CheckBox = e.Item.FindControl("cbDir")
        Dim about As New aboutclass

        If e.CommandName = "save" Then

            If cbDir.Checked = True Then
                about.updateAbout(lblId.Text, txtDescription.Text, txtTitle.Text, "rtl", True)
                
            Else
                about.updateAbout(lblId.Text, txtDescription.Text, txtTitle.Text, "ltr", False)

            End If



    
            lblDone.Visible = True
            rpAbout.DataBind()

        End If
        If e.CommandName = "delete" Then
            about.deleteAbout(lblId.Text)
            lblDone.Text = "Entry Deleted."
            lblDone.Visible = True
            rpAbout.DataBind()

        End If

    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Dim about As New aboutclass
        about.insertAbout("new", " ", "ltr", False)

        lblDone.Text = "Entry Added."
        lblDone.Visible = True
        rpAbout.DataBind()


    End Sub

    Protected Sub rpAbout_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpAbout.ItemDataBound
        Dim lblIsrtl As Label = e.Item.FindControl("lblIsrtl")
        Dim cbDir As CheckBox = e.Item.FindControl("cbDir")
        cbDir.Checked = CBool(lblIsrtl.Text)
    End Sub
End Class
