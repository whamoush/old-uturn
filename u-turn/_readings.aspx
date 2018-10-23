<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_readings.aspx.vb" Inherits="_readings" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc2:current ID="current1" runat="server" _menuItem="lbTen" _menuItemMobile="lbMobileTen" />
    <uc1:loginquery ID="loginquery1" runat="server" />

    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Readings</span></h2>
            <p class="clear-fix">
            </p>
            <asp:Button  runat="server" OnClick="AddNewReading_Click" Text="Add new reading"/>
            <asp:Repeater ID="rpInsertReading" runat="server" DataSourceID="Ds_Reading">
                <ItemTemplate>
                    <div class="back_buttercup">
                        <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                        <p>
                            <span>Author:</span>
                            <asp:TextBox ID="txtAuthor" runat="server" Text='<%#Eval("author")%>' CssClass="login-txt rounded_5"> </asp:TextBox>
                        </p>
                        <p>
                            <span>Text:</span>
                            <asp:TextBox ID="txtText" Height="145" Width="396" TextMode="MultiLine" runat="server" Text='<%#Eval("text")%>' CssClass="login-txt rounded_5"> </asp:TextBox>
                        </p>

                        <span>Active?&nbsp; <asp:CheckBox ID="activeChk" runat="server" Checked='<%#Eval("active") %>'/>yes </span>
                        <span>Arabic?&nbsp; <asp:CheckBox ID="arabicChk" runat="server" Checked='<%#Eval("arabic") %>'/>yes </span>

                        <p class="save-btn-container back_monza padded font_courier border-box-solved margin_10">
                            <asp:LinkButton ID="btnSave" CommandName="save" runat="server" Text="Save Changes"
                                CssClass="save-btn back_endeavour rounded_5 padded_3 color_white"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton1" CommandName="delete" runat="server" Text="Delete"
                                CssClass="save-btn back_endeavour rounded_5 padded_3 color_white"></asp:LinkButton>
                        </p>

                         
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="Ds_Reading" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>" SelectCommand="select [id], [text], [author], [active], [arabic] from readings order by id desc"></asp:SqlDataSource>
        </div>
    </div>

</asp:Content>
