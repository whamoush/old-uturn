Imports Telerik.Web.UI
Imports System.IO
Partial Class _adefault
    Inherits Telerik.Web.UI.RadAjaxPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim use As New user
        Dim thisuser As String = Session("UserName")
        dash1._user = thisuser
        dash1._email = use.email(thisuser)

        Dim cybergarden As New generalclass
        Dim myimage As String = cybergarden.generaldescription("cybergarden")
        Dim myimage2 As String = cybergarden.generaldescription("verse")
        imgCybergarden.ImageUrl = "img/" & myimage
        imgVerse.ImageUrl = "img/" & myimage2


    End Sub

    Public Sub RadAsyncUpload1_FileUploaded(sender As Object, e As FileUploadedEventArgs)
        Dim folderpath As String = "img/"
        Dim codesc As New generalclass
        Dim myfilename As String = "-" + e.File.FileName
        Dim myimage As String = codesc.generaldescription("cybergarden")
        lblConfirm.Visible = True



            File.Delete(Server.MapPath(folderpath) & myimage)


            '  Dim ext As String = Path.GetExtension(fuNewsImage.FileName)
            '  Dim newfilename As String = "logo-" & lblTitleLogo.Text & ext
            e.File.SaveAs(Server.MapPath(folderpath) + myfilename)
            codesc.updateGeneralDescriptionLink(myfilename, "cybergarden")


            imgCybergarden.ImageUrl = folderpath & myfilename










    End Sub

    Public Sub RadAsyncUpload2_FileUploaded(sender As Object, e As FileUploadedEventArgs)
        Dim folderpath As String = "img/"
        Dim codesc As New generalclass
        Dim myfilename As String = "-" + e.File.FileName
        Dim myimage As String = codesc.generaldescription("verse")
        lblConfirm2.Visible = True



        File.Delete(Server.MapPath(folderpath) & myimage)


        '  Dim ext As String = Path.GetExtension(fuNewsImage.FileName)
        '  Dim newfilename As String = "logo-" & lblTitleLogo.Text & ext
        e.File.SaveAs(Server.MapPath(folderpath) + myfilename)
        codesc.updateGeneralDescriptionLink(myfilename, "verse")


        imgVerse.ImageUrl = folderpath & myfilename









    End Sub

    Protected Sub rpMarquee_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpMarquee.ItemCommand
        Dim txtMarquee As TextBox = e.Item.FindControl("txtMarquee")
        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim gen As New generalclass

        If e.CommandName = "Save" Then
            gen.updateGeneralbyCategory(lblId.Text, txtMarquee.Text, "marquee")
            rpMarquee.DataBind()
            lblDone.Visible = True



        End If
        If e.CommandName = "Delete" Then
            gen.deleteGeneral(lblId.Text)
            rpMarquee.DataBind()
            lblDone.Text = "Marquee Deleted."
            lblDone.Visible = True

        End If
    End Sub

    Protected Sub btnNew_Click(sender As Object, e As System.EventArgs) Handles btnNew.Click
        Dim gen As New generalclass
        If txtMarqueeNew.Text = Nothing Then
        Else
            gen.insertGeneral(String.Empty, txtMarqueeNew.Text, "marquee")
            lblDone.Text = "Marquee Added."
            lblDone.Visible = True
            txtMarqueeNew.Text = Nothing
            rpMarquee.DataBind()

        End If


    End Sub
End Class
