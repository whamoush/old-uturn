
Partial Class user_
    Inherits System.Web.UI.Page





    Protected Sub btnSubmit_Click(sender As Object, e As System.EventArgs) Handles btnSubmit.Click

        Dim use As New user

        If use.thisuser(txtUsername.Text) = False Then
            use.adduser(txtUsername.Text, txtEmail.Text, txtPass.Text)
            lblOk.Visible = True
            lblNotAvailable.Visible = False


        Else
            lblOk.Visible = False
            lblNotAvailable.Visible = True

        End If



    End Sub
End Class
