
Partial Class _loginquery
    Inherits System.Web.UI.UserControl
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Session("logged") Is Nothing Then
            Dim UrlQuery As String = HttpContext.Current.Request.Url.OriginalString
            Dim UrlAbsolute As String = HttpContext.Current.Request.Url.AbsolutePath
            Dim Query As String = UrlQuery
            Dim Absolute As String = UrlAbsolute
            Dim any As String
            Dim intLastIndexof As Integer = Query.LastIndexOf("/"c)






            Query = Query.Substring(intLastIndexof + 1, Query.Length - intLastIndexof - 1)


            any = Right(Query, 5)


            If any = ".aspx" Then

                Query = Query.Substring(0, (Query.Length - 5))
                Response.Redirect("login.aspx?rt=" & Query)


            ElseIf Not any = ".aspx" Then
                Query = Query.Substring(Query.LastIndexOf("=") + 1)
                Absolute = Absolute.Substring(Absolute.LastIndexOf("/") + 1)
                Absolute = Absolute.Substring(0, (Absolute.Length - 5))

                Response.Redirect("login.aspx?rt=" & Absolute & "&q=" & Query)








            End If






        End If
    End Sub
End Class
