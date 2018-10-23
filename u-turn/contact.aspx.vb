
Partial Class contact
    Inherits System.Web.UI.Page

    Protected Sub btnSend_Click(sender As Object, e As System.EventArgs) Handles btnSend.Click
        Dim mymail As New contact_
        If txtDo.Text = String.Empty Then
            mymail.ContactForm(txtFullname.Text, txtEmail.Text, txtQuestions.Text)
            lblConfirm.Visible = True

        End If

        txtFullname.Text = String.Empty
        txtEmail.Text = String.Empty
        txtQuestions.Text = String.Empty

    End Sub
End Class
