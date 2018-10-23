
Partial Class remove
    Inherits System.Web.UI.Page






    Protected Sub btnRemove_Click(sender As Object, e As System.EventArgs) Handles btnRemove.Click

        Dim use As New user
        If Session("UserName") = txtUsername.Text Then
            lblOk.Visible = False

            lblNotAvailable.Text = "User is Signed In and Can't Be Removed"
            lblNotAvailable.Visible = True
        Else
            If use.thisuser(txtUsername.Text) = True Then
                use.deleteuser(txtUsername.Text)
                lblOk.Visible = True
                lblNotAvailable.Visible = False
            Else
                lblNotAvailable.Visible = True
                lblNotAvailable.Text = "The Username You Entered is Not Available in Our Database"
                lblOk.Visible = False

            End If
        End If

    End Sub
End Class
