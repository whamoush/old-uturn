
Partial Class email
    Inherits System.Web.UI.Page



 
    Protected Sub btnSubmit_Click(sender As Object, e As System.EventArgs) Handles btnSubmit.Click
        Dim use As New user
        Dim myname As String = Session("UserName")
        If txtCurrentPassword.Text = use.password(myname) Then
            If txtCurrentEmail.Text = use.email(myname) Then
                use.updateEmail(myname, txtNewEmail.Text)

                lblCurrentEmail.Visible = False
                lblCurrentPassword.Visible = False
                lblOk.Visible = True

            Else
                lblCurrentEmail.Visible = True

                lblCurrentPassword.Visible = False
                lblOk.Visible = False
            End If



        Else
            lblCurrentPassword.Visible = True

            lblOk.Visible = False
            lblCurrentEmail.Visible = False

        End If

    End Sub
End Class
