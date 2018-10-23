
Partial Class admin_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Response.Redirect("http://uturnonline.com/_default.aspx")
    End Sub
End Class
