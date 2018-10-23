
Partial Class _dash
    Inherits System.Web.UI.UserControl

    Private thisUser As String = String.Empty
    Private thisEmail As String = String.Empty
    Public Property _user() As String


        Get
            Return thisUser
        End Get

        Set(value As String)
            thisUser = value
        End Set
    End Property
    Public Property _email() As String


        Get
            Return thisEmail
        End Get

        Set(value As String)
            thisEmail = value
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        lblUsername.Text = thisUser
        lblEmail.Text = thisEmail
    End Sub
End Class
