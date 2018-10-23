
Partial Class password
    Inherits System.Web.UI.Page



    Protected Sub btnSubmit_Click(sender As Object, e As System.EventArgs) Handles btnSubmit.Click

        Dim use As New user
        Dim myname As String = Session("UserName")
        If txtCurrent.Text = use.password(myname) Then
            use.updatePassword(myname, txtNew.Text)
            lblNotAvailable.Visible = False

            lblOk.Visible = True

        Else
            lblNotAvailable.Visible = True

            lblOk.Visible = False
        End If



    End Sub
End Class
