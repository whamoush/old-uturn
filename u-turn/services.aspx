<%@ Page Title="" Language="VB" MasterPageFile="~/front.master" AutoEventWireup="false"
    CodeFile="services.aspx.vb" Inherits="services" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc2:current ID="current1" runat="server" _menuItem="lbTwo" _menuItemMobile="lbMobileTwo" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Our Services</span></h2>
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
                        Search Services</h3>
                    <telerik:RadSearchBox ID="RadSearchBox1" EmptyMessage="Search..." runat="server"
                        Width="100%" DataTextField="title" DataValueField="id" OnSearch="RadSearchBox1_Search"
                        DataSourceID="ds_SearchBox" EnableEmbeddedSkins="false" Skin="BlackMetroTouch">
                    </telerik:RadSearchBox>
                    <br />
                    <br />


                         <h3 class="color_mineshaft font_courier">
<asp:LinkButton ID="btnGo" runat="server" ValidationGroup="viewall" CssClass="color_endeavour" Text="Click Here"></asp:LinkButton> to View All:
                    </h3>
                  




                               <span class="clear-fix-block"></span>
                    <br />
                </div>
                <asp:Repeater ID="rpServices" runat="server" DataSourceID="ds_Services">
                    <ItemTemplate>
                        <asp:Label ID='lbllabel' runat="server" Visible="false" Text='<%#Eval("label") %>'></asp:Label>
                        <ul id='<%#Eval("id") %>' class="content-items content-items-pages font_courier margin_10">
                            <li class="border-box-solved color_endeavour">
                                <asp:Repeater ID="rplabel" runat="server" DataSourceID="ds_label">
                                    <ItemTemplate>
                                        <img src='img/assets/img/services/<%#Eval("image") %>' width="100px" height="100px"
                                            alt='<%#Eval("title") %>' />
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="ds_label" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>">
                                </asp:SqlDataSource>
                                <h3 class="list-title padded fonts_1_5 border-endeavour">
                                    <%#Eval("title")%></h3>
                            </li>
                            <li class="content-items-description back_endeavour color_white">
                                <p class="list-description padded fonts_1_1">
                                    <%#Eval("description")%></p>
                            </li>
                            <p class="clear-fix">
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="ds_Services" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                    SelectCommand="SELECT [id], [title], [description], [label] FROM [services] order by position asc">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="ds_SearchBox" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                    SelectCommand="SELECT [id], [title] from [services]"></asp:SqlDataSource>
                <p class="clear-fix">
                </p>
            </telerik:RadAjaxPanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
