
Partial Class front
    Inherits System.Web.UI.MasterPage

    Protected Property whatsapp As String = ""

    Protected Sub PageLoad(sender As Object, e As EventArgs) Handles Me.Load


        If Request.Browser.IsMobileDevice Then

            whatsapp = "https://api.whatsapp.com/send?phone=96181749906"

        Else
            whatsapp = "https://web.whatsapp.com/send?phone=96181749906"

        End If

    End Sub


    Protected Sub topbarmenu5_Click(sender As Object, e As EventArgs)
        If Request.Browser.IsMobileDevice Then

            Page.ClientScript.RegisterStartupScript(
            Me.GetType(), "OpenWindow", "window.open('https://api.whatsapp.com/send?phone=96181749906','_newtab');", True)

        Else
            Page.ClientScript.RegisterStartupScript(
            Me.GetType(), "OpenWindow", "window.open('https://web.whatsapp.com/send?phone=96181749906','_newtab');", True)

        End If
    End Sub
End Class