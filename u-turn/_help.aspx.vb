Imports System.Data.SqlClient
Partial Class _ahelp
    Inherits Telerik.Web.UI.RadAjaxPage

    Protected Sub rpHelp_ItemCommand(source As Object, e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rpHelp.ItemCommand
        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim ddlPosition As DropDownList = e.Item.FindControl("ddlPosition")
        Dim txtTitle As TextBox = e.Item.FindControl("txtTitle")
        Dim cbDir As CheckBox = e.Item.FindControl("cbDir")
        Dim txtDescription As TextBox = e.Item.FindControl("txtDescription")
        Dim savehelp As New helpclass
        If e.CommandName = "save" Then



            If cbDir.Checked = True Then
                savehelp.updateHelp(lblId.Text, txtTitle.Text, txtDescription.Text, "rtl", True)



            Else
                savehelp.updateHelp(lblId.Text, txtTitle.Text, txtDescription.Text, "ltr", False)

            End If

            rpHelp.DataBind()
            lblDone.Visible = True

        End If

        If e.CommandName = "order" Then
            savehelp.positionHelp(ddlPosition.SelectedValue, lblId.Text)
            rpHelp.DataBind()


            lblDone.Visible = True
        End If
        If e.CommandName = "delete" Then
            savehelp.deleteHelp(lblId.Text)

            rpHelp.DataBind()
            lblDone.Text = "Entry Deleted."
            lblDone.Visible = True
        End If


    End Sub



    Protected Sub btnAdd_Click(sender As Object, e As System.EventArgs) Handles btnAdd.Click
        Dim addhelp As New helpclass
    
        Dim cnString As String = System.Configuration.ConfigurationManager.ConnectionStrings("UturnCS").ConnectionString
        Using cn As New SqlConnection(cnString)
            Using cmd As New SqlCommand("SELECT [position] from [help] where position=(SELECT MAX(position) FROM [help])", cn)

                cn.Open()

                Dim rdr As SqlDataReader = cmd.ExecuteReader()
                rdr.Read()

                Dim maxposition As Integer = DirectCast(rdr("position"), Integer)
                addhelp.insertHelp("new", "", maxposition + 1, "ltr", False)
                rpHelp.DataBind()

                lblDone.Text = "Item Created."
                lblDone.Visible = True
                cn.Close()

            End Using
        End Using

    End Sub

    Protected Sub rpHelp_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.RepeaterItemEventArgs) Handles rpHelp.ItemDataBound
        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim lbltitle As Label = e.Item.FindControl("lblTitle")
        Dim cbDir As Checkbox = e.item.FindControl("cbDir")
        Dim lblIsrtl As Label = e.item.FindControl("lblIsrtl")

        cbDir.Checked = CBool(lblIsrtl.Text)

        If lbltitle.Text.Length = 25 Then
            lbltitle.Text = lbltitle.Text & "..."

        End If
        Dim ds_Position As SqlDataSource = e.Item.FindControl("ds_Position")
        ds_Position.SelectCommand = "select [title] from help where id !=(select id from help where id= " & lblId.Text & " ) order by position asc"
        ds_Position.DataBind()
    End Sub
    Protected Sub RadSearchBox1_Search(sender As Object, e As Telerik.Web.UI.SearchBoxEventArgs) Handles RadSearchBox1.Search
        ds_Help.SelectCommand = "SELECT [id], SUBSTRING(title, 1, 25) as mytitle, [title], [description] FROM [help] WHERE id=" & e.Value

        ds_Help.DataBind()
    End Sub
    Protected Sub btnGo_Click(sender As Object, e As System.EventArgs) Handles btnGo.Click
        ds_Help.SelectCommand = "select [id], SUBSTRING(title, 1, 20) as mytitle,title, description, isrtl from help ORDER BY position ASC"
        rpHelp.DataBind()
        RadSearchBox1.Text = String.Empty

        ds_Help.DataBind()
    End Sub
End Class
