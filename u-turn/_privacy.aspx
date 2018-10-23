<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_privacy.aspx.vb" Inherits="_aprivacy" %>

<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>

<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc1:loginquery ID="loginquery1" runat="server" />
    <uc2:current ID="current1" runat="server" _menuItem="lbEight" _menuItemMobile="lbMobileEight" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Privacy Policy</span></h2>
                <asp:Label ID="lblDone" runat="server" Visible="false" Text="Changes Saved." CssClass="hideme done back_green padded rounded_5 color_white font_courier fonts_1_2"></asp:Label>
                  
            <asp:Repeater ID="rpPrivacy" runat="server" DataSourceID="ds_Privacy">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                    <div class="back_beautybush padded border-box-solved  font_courier color_mineshaft fonts_1_1">
                     
                        <asp:TextBox ID="txtDescription" runat='server' Text='<%#Eval("description") %>'
                            TextMode="MultiLine" Width="99%" Height="400" CssClass="login-txt rounded_5"></asp:TextBox><br />
                        <br />
                    </div>
                    <p class="save-btn-container back_monza padded font_courier border-box-solved margin_10">
                        <asp:LinkButton ID="btnSave" CommandName="save" runat="server" Text="Save Changes"
                            CssClass="save-btn back_endeavour rounded_5 padded_3 color_white"></asp:LinkButton>
                     
                    </p>
                </ItemTemplate>
              
            </asp:Repeater>
            <asp:SqlDataSource ID="ds_Privacy" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                SelectCommand="select [id], [description] from [general] where category = 'privacy'">
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
