<%@ Page Title="" Language="VB" MasterPageFile="~/front.master" AutoEventWireup="false"
    CodeFile="help.aspx.vb" Inherits="help" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc2:current ID="current1" runat="server" _menuItem="lbFive" _menuItemMobile="lbMobileFive" />
    <div id="content" class="div_auto">
            <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Guidance</span></h2>
            <p class="clear-fix">
            </p>
            <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel1"
                HorizontalAlign="NotSet">
                <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
                <div id="search-box-container" class="back_gallery">
                    <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" IsSticky="true">
                        <asp:Image ID="Image1" CssClass="loadingpanel" runat="server" ImageUrl="img/ajax-loader.gif">
                        </asp:Image>
                    </telerik:RadAjaxLoadingPanel>
                    <h3 class=" color_mineshaft font_courier">
                        Search Guidance</h3>
                    <telerik:RadSearchBox ID="RadSearchBox1" EmptyMessage="Search..." runat="server"
                        Width="100%" DataTextField="title" DataValueField="id" OnSearch="RadSearchBox1_Search"
                        DataSourceID="ds_SearchBox" EnableEmbeddedSkins="false" Skin="BlackMetroTouch">
                    </telerik:RadSearchBox>

                    <br />
                    <br />
                   <h3 class="color_mineshaft font_courier">
                      <asp:LinkButton ID="btnGo" runat="server" ValidationGroup="viewall" CssClass="color_monza" Text="Click Here"></asp:LinkButton> to View All:
                    </h3> <span class="clear-fix-block"></span>
                    <br />
                </div>
                <asp:Repeater ID="rpHelp" runat="server" DataSourceID="ds_Help">
                    <ItemTemplate>
                        <ul id='<%#Eval("id") %>' class="content-items content-items-pages font_courier margin_10">
                        
                            <li class='help-title border-box-solved color_mineshaft <%#Eval("dir") %> text-<%#Eval("dir") %>'>
                                <h3 class="list-title padded fonts_1_5 border-monza">
                                    <%#Eval("title")%></h3>
                            </li>
                            <li class='help-description border-box-solved color_monzadark <%#Eval("dir") %> text-<%#Eval("dir") %>'>
                                <p class="list-description padded fonts_1_1">
                                    <%#Eval("description")%></p>
                            </li>
                            <p class="clear-fix">
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="ds_Help" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="ds_SearchBox" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                    SelectCommand="SELECT [id], [title] from [help]"></asp:SqlDataSource>
                <p class="clear-fix">
                </p>
            </telerik:RadAjaxPanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
