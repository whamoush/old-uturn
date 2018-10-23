<%@ Page Title="" Language="VB" MasterPageFile="~/front.master" AutoEventWireup="false"
    CodeFile="readings.aspx.vb" Inherits="readings" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc2:current ID="current1" runat="server" _menuItem="lbTen" _menuItemMobile="lbMobileTen" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Readings</span></h2>
            <p class="clear-fix">
            </p>
            <h3 class="font_souvenir color_buttercup italicized normal fonts_2 margin_10">We chose for you:</h3>

            <asp:Repeater ID="rpBooks" runat="server" DataSourceID="ds_readings">
                <ItemTemplate>
                    <div class="border-buttercup"></div>
                     <div class="content-items content-items-books font_courier margin margin_30">
                         <p class="list-title padded fonts_1_5  color_mineshaft">
                                   "<%#Eval("text")%>"</p>

                            <h4 style="width:auto; float: right" class="list-title padded fonts_1_5  color_mineshaft %>">
                                    <%#Eval("author")%></h4>

                        <span class="clear-fix-block"></span>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
             <asp:SqlDataSource ID="ds_readings" SelectCommand="select [text], [author] from readings where active = 1 and arabic = 0" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>">
                </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
