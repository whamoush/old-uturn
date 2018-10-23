Imports System.Data.SqlClient
Partial Class _aservices
    Inherits Telerik.Web.UI.RadAjaxPage

    Protected Sub rpServices_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpServices.ItemCommand
        Dim lblId As Label = e.Item.FindControl("lblId")

        Dim txtTitle As TextBox = e.Item.FindControl("txtTitle")
        Dim ddllabel As DropDownList = e.Item.FindControl("ddllabel")
        Dim ddlPosition As DropDownList = e.Item.FindControl("ddlPosition")
        Dim txtDescription As TextBox = e.Item.FindControl("txtDescription")
        Dim saveservice As New servicesclass
        If e.CommandName = "save" Then
            Dim labelId As Integer = saveservice.selectServicesLabelsId(ddllabel.SelectedValue)
            saveservice.updateServices(lblId.Text, txtTitle.Text, labelId, txtDescription.Text)
            rpServices.DataBind()
            lblDone.Visible = True

        End If
        If e.CommandName = "order" Then
            saveservice.positionServices(ddlPosition.selectedvalue, lblId.Text)
            rpServices.DataBind()

            lblDone.Visible = True
        End If
        If e.CommandName = "delete" Then
            saveservice.deleteServices(lblId.Text)
            rpServices.DataBind()
            lblDone.Text = "Entry Deleted."
            lblDone.Visible = True
        End If


    End Sub

    Protected Sub rpServices_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpServices.ItemDataBound
        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim lblTitle As Label = e.Item.FindControl("lblTitle")
        Dim lbllabel As Label = e.Item.FindControl("lbllabel")
        Dim ds_label As SqlDataSource = e.Item.FindControl("ds_label")
        Dim ddllabel As DropDownList = e.Item.FindControl("ddllabel")
        If lblTitle.Text.Length = 20 Then
            lblTitle.Text = lblTitle.Text & "..."

        End If


        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [title], [image] from [services_labels] where id=" & lbllabel.Text, cn)

                ds_label.SelectCommand = cmd.CommandText
                ds_label.DataBind()
                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                ddllabel.SelectedValue = DirectCast(rdr("title"), String)

                cn.Close()

            End Using
        End Using

        Dim ds_Position As SqlDataSource = e.Item.FindControl("ds_Position")
        ds_Position.SelectCommand = "select [title] from [services] where id !=(select id from [services] where id= " & lblId.Text & " ) order by position asc"
        ds_Position.DataBind()

    End Sub

    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Dim addservice As New servicesclass


        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [position] from [services] where position=(SELECT MAX(position) FROM [services])", cn)

                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                Dim maxposition As Integer = DirectCast(rdr("position"), Integer)
                addservice.insertServices("new", 1, "", maxposition + 1)
                rpServices.DataBind()
                lblDone.Text = "Service Created."
                lblDone.Visible = True
                cn.Close()

            End Using
        End Using



    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        ds_Services.SelectCommand = "select [id], SUBSTRING(title, 1, 20) as mytitle,title, description, label from services ORDER BY [position] asc"
        ds_Services.DataBind()
    End Sub
    Protected Sub RadSearchBox1_Search(sender As Object, e As Telerik.Web.UI.SearchBoxEventArgs) Handles RadSearchBox1.Search
        ds_Services.SelectCommand = "SELECT [id], SUBSTRING(title, 1, 20) as mytitle,title, [description], [label] FROM [services] WHERE id=" & e.Value

        ds_Services.DataBind()
    End Sub
    Protected Sub btnGo_Click(sender As Object, e As System.EventArgs) Handles btnGo.Click
        ds_Services.SelectCommand = "SELECT [id], SUBSTRING(title, 1, 20) as mytitle, [title], [description], [label] FROM [services] order by position asc"
        RadSearchBox1.Text = String.Empty

        rpServices.DataBind()
        ds_Services.DataBind()
    End Sub
End Class
