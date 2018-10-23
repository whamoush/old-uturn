
Partial Class _acontact
    Inherits System.Web.UI.Page


    Protected Sub rpHelp_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpHelp.ItemCommand
        Dim lblid As Label = e.Item.FindControl("lblId")
        Dim txtTitle As TextBox = e.Item.FindControl("txtTitle")
        Dim txtDescription As TextBox = e.Item.FindControl("txtDescription")
        If e.CommandName = "save" Then
            Dim codesc As New generalclass
            codesc.updateGeneral(lblid.Text, txtDescription.Text, txtTitle.Text, "contact")
            rpHelp.DataBind()
            lblDone.visible = True

        End If
    End Sub
End Class
