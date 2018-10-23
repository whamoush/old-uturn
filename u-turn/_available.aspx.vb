
Partial Class available
    Inherits System.Web.UI.Page



    Protected Sub rpUser_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpUser.ItemCommand
        Dim lblName As Label = e.Item.FindControl("lblName")
        If e.CommandName = "delete" Then
            lblConfirm.Text = "User " & lblName.Text & " is deleted."
            lblConfirm.Visible = True
            Dim use As New user
            use.deleteuser(lblName.Text)
            rpUser.DataBind()
        End If
    End Sub
End Class
