<%@ Page Title="" Language="VB" MasterPageFile="~/front.master" AutoEventWireup="false"
    CodeFile="readings-arabic.aspx.vb" Inherits="readings_arabic" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc2:current ID="current1" runat="server" _menuItem="lbReadAr" _menuItemMobile="lbMobReadAr" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Readings</span></h2>
            <p class="clear-fix">
            </p>


            <asp:Repeater ID="rpBooks" runat="server" DataSourceID="ds_readings">
                <ItemTemplate>

                     <div class="content-items content-items-books font_courier margin_10">
                         <h3 class="list-title padded fonts_1_5 border-buttercup color_mineshaft %>">
                                   "<%#Eval("text")%>"</h3>

                            <h3 style="width:auto; float: right" class="list-title padded fonts_1_5  color_mineshaft %>">
                                    <%#Eval("author")%></h3>

                           
                    </div>

                </ItemTemplate>
            </asp:Repeater>
             <asp:SqlDataSource ID="ds_readings" SelectCommand="select [text], [author] from readings where active = 1 and arabic = 1" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>">
                </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
