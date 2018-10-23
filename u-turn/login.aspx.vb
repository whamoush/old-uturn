
Partial Class login
    Inherits System.Web.UI.Page
    Public rt_header As String
    Public q_header As String
    Public t_header As String

    Protected Sub btnSubmit_Click(sender As Object, e As System.EventArgs) Handles btnSubmit.Click
        Dim user As New user
        Try
            If user.exist(txtUsername.Text, txtPassword.Text) Then
                Session("logged") = True
                Session("UserName") = txtUsername.Text
                rt_header = Request.QueryString("rt")
                q_header = Request.QueryString("q")
                t_header = Request.QueryString("t")
                If q_header Is Nothing Then
                    Response.Redirect(rt_header & ".aspx", False)
                ElseIf q_header.Length > 0 And t_header Is Nothing Then
                    Response.Redirect(rt_header & ".aspx?nid=" & q_header, False)
                ElseIf q_header.Length > 0 And t_header > 0 Then
                    Response.Redirect(rt_header & ".aspx?nid=" & q_header & "&type=" & t_header, False)


                End If
                txtPassword.Text = String.Empty
                txtUsername.Text = String.Empty
            Else
                lblConfirm.Visible = True

            End If
        Catch ex As Exception

        End Try
    End Sub
End Class
