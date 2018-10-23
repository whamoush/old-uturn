Imports System.Data.SqlClient
Partial Class about
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim myimage As New generalclass


        Verse.ImageUrl = "img/" + myimage.generaldescription("verse")
    End Sub
End Class
