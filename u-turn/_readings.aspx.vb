
Partial Class _readings
    Inherits System.Web.UI.Page


    Protected Sub rpInsertReading_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles rpInsertReading.ItemCommand

        Dim txtText As TextBox = e.Item.FindControl("txtText")
        Dim txtAuthor As TextBox = e.Item.FindControl("txtAuthor")
        Dim chkActive As CheckBox = e.Item.FindControl("activeChk")
        Dim lblId As Label = e.Item.FindControl("lblId")
        Dim arabicChk As CheckBox = e.Item.FindControl("arabicChk")

        Dim readings As New readingsclass

        If (e.CommandName = "save") Then
            readings.UpdateReading(lblId.Text, txtAuthor.Text, txtText.Text, chkActive.Checked, arabicChk.Checked)
        ElseIf (e.CommandName = "delete") Then
            readings.DeleteReading(lblId.Text)
        End If

        Response.Redirect("_readings.aspx")


    End Sub


    Protected Sub AddNewReading_Click(sender As Object, e As EventArgs)
        Dim readings As New readingsclass

        readings.InsertReading("", "", False, False)
        Response.Redirect("_readings.aspx")

    End Sub
End Class
