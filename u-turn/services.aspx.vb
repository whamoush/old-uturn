
Partial Class services
    Inherits Telerik.Web.UI.RadAjaxPage

    Protected Sub rpServices_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpServices.ItemDataBound
        Dim lbllabel As Label = e.Item.FindControl("lbllabel")
        Dim ds_label As SqlDataSource = e.Item.FindControl("ds_label")
        ds_label.SelectCommand = "SELECT [title], [image] FROM [services_labels] WHERE id=" & lbllabel.Text
        ds_label.DataBind()

    End Sub
    Protected Sub RadSearchBox1_Search(sender As Object, e As Telerik.Web.UI.SearchBoxEventArgs) Handles RadSearchBox1.Search
        ds_Services.SelectCommand = "SELECT [id], [title], [description], [label] FROM [services] WHERE id=" & e.Value

        ds_Services.DataBind()
    End Sub



    Protected Sub btnGo_Click(sender As Object, e As System.EventArgs) Handles btnGo.Click
        ds_Services.SelectCommand = "SELECT [id], [title], [description], [label] FROM [services] order by position asc"
        RadSearchBox1.Text = String.Empty
        rpServices.DataBind()
        ds_Services.DataBind()
    End Sub
End Class
