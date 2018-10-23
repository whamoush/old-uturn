
Partial Class _aprivacy
    Inherits System.Web.UI.Page



    Protected Sub rpPrivacy_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpPrivacy.ItemCommand
        Dim lblId As Label = e.Item.FindControl("lblId")

        Dim txtDescription As TextBox = e.Item.FindControl("txtDescription")
        Dim policy As New generalclass

        If e.CommandName = "save" Then

            policy.updateGeneral(lblId.Text, txtDescription.Text, String.Empty, "privacy")

            lblDone.Visible = True
            rpPrivacy.DataBind()

        End If
      
    End Sub

   
End Class
