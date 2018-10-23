Imports System.Configuration
Imports System.Web.Configuration

Partial Class back
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        If Session("logged") Is Nothing Then
            btnLogout.Text = "LOG IN"

        Else

            btnLogout.Text = "LOG OUT"
            btnLogout.Visible = True
        End If





    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As System.EventArgs) Handles btnLogout.Click
        If btnLogout.Text = "LOG IN" Then
            Response.Redirect("login.aspx?rt=_default")
        Else
            Session("logged") = Nothing
            Response.Redirect("login.aspx?rt=_default")
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        If Session("logged") = True Then

            Session("Reset") = True
            Dim config As Configuration = WebConfigurationManager.OpenWebConfiguration("~/Web.Config")
            Dim section As SessionStateSection = DirectCast(config.GetSection("system.web/sessionState"), SessionStateSection)
            Dim timeout As Integer = CInt(section.Timeout.TotalMinutes) * 1000 * 60
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "SessionAlert", "SessionExpireAlert(" & timeout & ");", True)

        End If

    End Sub
End Class

