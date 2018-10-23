Imports Telerik.Web.UI
Imports System.IO
Partial Class _aservices_labels
    Inherits System.Web.UI.Page
    Public folderpath As String = "img/assets/img/services/"
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load




    End Sub





    Protected Sub rplabels_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rplabels.ItemCommand

        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim lblImage As Label = e.Item.FindControl("lblImage")
        Dim txtlabel As TextBox = e.Item.FindControl("txtlabel")
        Dim fuImage As FileUpload = e.Item.FindControl("fuImage")
        Dim serve As New servicesclass
        If e.CommandName = "upload" Then
            If fuImage.FileName = Nothing Then
            Else
                File.Delete(Server.MapPath(folderpath) & lblImage.Text)

                fuImage.SaveAs(Server.MapPath(folderpath) & fuImage.FileName)
                serve.updateServiceslabelsImage(lblId.Text, fuImage.FileName)

                lblDone.Visible = True
                rplabels.DataBind()
            End If

        End If


        If e.CommandName = "save" Then
            serve.updateServiceslabels(lblId.Text, txtlabel.Text)
            lblDone.Visible = True
            rplabels.DataBind()
        End If
        If e.CommandName = "delete" Then
            File.Delete(Server.MapPath(folderpath) & lblImage.Text)

            serve.deleteServiceslabels(lblId.Text)
            lblDone.Text = "Label Deleted"
            lblDone.Visible = True

            rplabels.DataBind()
        End If

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As System.EventArgs) Handles btnSubmit.Click
        Dim serve As New servicesclass
        fuNewImage.SaveAs(Server.MapPath(folderpath) & fuNewImage.FileName)
        serve.insertServiceslabels(txtNewLabel.Text.ToString, fuNewImage.FileName)
        lblDone.Text = "Label Added."
        lblDone.Visible = True

        rplabels.DataBind()
    End Sub
End Class
