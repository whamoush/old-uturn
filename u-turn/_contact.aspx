<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_contact.aspx.vb" Inherits="_acontact" %>

<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc1:loginquery ID="loginquery1" runat="server" />
    <uc2:current ID="current1" runat="server" _menuItem="lbSeven" _menuItemMobile="lbMobileSeven" />
    <div id="content" class="div_auto font_courier">
        <div>
            <h2 class="page-title color_endeavour bolded fonts_1_8">
                <span>Contact Us</span></h2>
            <p class="clear-fix">
            </p>
            <asp:Label ID="lblDone" runat="server" Visible="false" Text="Changes Saved." CssClass="hideme done back_green padded rounded_5 color_white font_courier fonts_1_2"></asp:Label>
            <div id="contact">
                <ul>
                    <asp:Repeater ID="rpHelp" runat="server" DataSourceID="ds_Help">
                        <ItemTemplate>
                        <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                            <li class="back_endeavour">
                                <h3 class="contact-title color_mineshaft padded fonts_1_5 back_buttercup">
                                    <%#Eval("title")%>&nbsp;<asp:TextBox ID="txtTitle" runat="server" Text='<%#Eval("title") %>'
                                        CssClass="login-txt rounded_5"></asp:TextBox></h3>
                                <div class="contact-info color_white padded">
                                    <h4 class="fonts_1_2">
                                        CONTACT US AT:</h4>
                                    <span>
                                        <asp:TextBox ID="txtDescription" Text='<%#Eval("description")%>' runat="server" CssClass="login-txt-multi rounded_5"
                                            TextMode="MultiLine" Height="170px"></asp:TextBox></span>
                                </div>
                            </li>
                            <p class="save-btn-container back_monza padded font_courier border-box-solved margin_10">
                                <asp:LinkButton ID="btnSave" CommandName="save" runat="server" Text="Save Changes"
                                    CssClass="save-btn back_buttercup rounded_5 padded_3 color_mineshaft"></asp:LinkButton>
                            </p>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <asp:SqlDataSource ID="ds_Help" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                SelectCommand="SELECT [id], [title], [description] from [general] where category='contact'">
            </asp:SqlDataSource>
            <p class="clear-fix">
            </p>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
