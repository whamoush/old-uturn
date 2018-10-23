
Partial Class mycurrent
    Inherits System.Web.UI.UserControl
    Private menuItem As String = String.Empty
    Private menuItemMobile As String = String.Empty





#Region "Menu Item Property"

    Public Property _menuItem() As String


        Get
            Return menuItem
        End Get

        Set(value As String)
            menuItem = value
        End Set
    End Property
    Public Property _menuItemMobile() As String


        Get
            Return menuItemMobile
        End Get

        Set(value As String)
            menuItemMobile = value
        End Set
    End Property



#End Region

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        DirectCast(Me.Page.Master.FindControl(menuItemMobile), LinkButton).Style.Add("border", "none")
        DirectCast(Me.Page.Master.FindControl(menuItemMobile), LinkButton).Style.Add("background", "#f6ac0b")
        DirectCast(Me.Page.Master.FindControl(menuItemMobile), LinkButton).Style.Add("text-shadow", "2px 2px #a87505")
        DirectCast(Me.Page.Master.FindControl(menuItem), LinkButton).Style.Add("border-bottom", "8px solid #f6ac0b")
    End Sub
End Class
