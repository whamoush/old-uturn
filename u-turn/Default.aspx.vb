
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim myimage As New generalclass
        verse.ImageUrl = "img/" + myimage.generaldescription("verse")

    End Sub
End Class
