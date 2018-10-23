
Partial Class help
    Inherits Telerik.Web.UI.RadAjaxPage
    Protected Sub RadSearchBox1_Search(sender As Object, e As Telerik.Web.UI.SearchBoxEventArgs) Handles RadSearchBox1.Search
        ds_Help.SelectCommand = "SELECT [id], [title], [description], [dir] FROM [help] WHERE id=" & e.Value

        ds_Help.DataBind()
    End Sub

    Protected Sub btnGo_Click(sender As Object, e As System.EventArgs) Handles btnGo.Click
        ds_Help.SelectCommand = "SELECT [id], [title], [description], [dir] FROM [help] ORDER BY position ASC"
        RadSearchBox1.Text = String.Empty
        rpHelp.DataBind()
        ds_Help.DataBind()


    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ds_Help.SelectCommand = "SELECT [id], [title], [description], [dir] FROM [help] ORDER BY position ASC"
            ds_Help.DataBind()
        End If
    End Sub
End Class
