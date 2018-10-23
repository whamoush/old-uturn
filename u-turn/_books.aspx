<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_books.aspx.vb" Inherits="_abooks" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc2:current ID="current1" runat="server" _menuItem="lbThree" _menuItemMobile="lbMobileThree" />
    <uc1:loginquery ID="loginquery1" runat="server" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Our Books</span></h2>
            <p class="clear-fix">
            </p>
            <asp:Label ID="lblDone" runat="server" Visible="false" Text="Changes Saved." CssClass="hideme done back_green padded rounded_5 color_white font_courier fonts_1_2"></asp:Label>
            <asp:LinkButton ID="btnAdd" runat="server" Text="Add Book" CssClass="save-btn back_endeavour rounded_5 padded color_white font_courier fonts_1_2"></asp:LinkButton>&nbsp;<asp:LinkButton
                ID="btnCategories" runat="server" Text="Edit Categories" PostBackUrl="~/_books_categories.aspx"
                CssClass="save-btn back_endeavour rounded_5 padded color_white font_courier fonts_1_2"></asp:LinkButton>
            <br />
            <br />
            <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel1"
                HorizontalAlign="NotSet">
              
            <div id="search-box-container" class="back_gallery">
                <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" IsSticky="true">
                        <asp:Image ID="Image1" CssClass="loadingpanel  " runat="server" ImageUrl="img/ajax-loader.gif">
                        </asp:Image>
                    </telerik:RadAjaxLoadingPanel>
                <h3 class=" color_mineshaft font_courier">Categories</h3>
                <ul class="fonts_0_85 color_white font_courier">
                    <asp:Repeater ID="rpCategories" runat="server" DataSourceID="ds_Categories">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                            <li class="rounded_5" style='background: <%#Eval("color")%>; direction: <%#Eval("dir")%>;'>
                                <asp:LinkButton ID="lbCategorize" CommandName="categorize" runat="server" Text='<%#Eval("category")%>'></asp:LinkButton>
                                (<asp:Literal ID="ltlCount" runat="server"></asp:Literal>) </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="ds_Categories" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                        SelectCommand="select id, category, color, dir from books_categories WHERE [dir]='ltr' ORDER BY [position] asc"></asp:SqlDataSource>
                    <p class="clear-fix">
                    </p>
                </ul>
                <br />
                <h3 class=" color_mineshaft font_courier">Search Books</h3>
                <telerik:RadSearchBox ID="RadSearchBox1" EmptyMessage="Search..." runat="server"
                    Width="100%" DataTextField="title" DataValueField="id" OnSearch="RadSearchBox1_Search"
                    DataSourceID="ds_SearchBox" EnableEmbeddedSkins="false" Skin="BlackMetroTouch">
                </telerik:RadSearchBox>
                <br />
                <br />
                <h3 class="color_mineshaft font_courier">
                    <asp:LinkButton ID="btnGo" runat="server" ValidationGroup="viewall" CssClass="color_endeavour" Text="Click Here"></asp:LinkButton>
                    to View All:
                </h3>
                <span class="clear-fix-block"></span>
                <br />
            </div>
            <asp:Repeater ID="rpBooks" runat="server" DataSourceID="Ds_Books">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                    <ul class="content-items font_courier">
                        <li id="book" class="border-box-solved">                          
                            <h3 class="list-title padded fonts_1_5 border-buttercup color_mineshaft">
                                <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("title")%>'></asp:Label></h3>                           
                        </li>                       
                        <p class="clear-fix">
                    </ul>
                    <p class="save-btn-container back_monza padded font_courier border-box-solved margin_10">
                        <asp:LinkButton ID="btnEdit" CommandName='<%#Eval("id") %>' runat="server" Text="Edit"
                            CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                    </p>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="ds_Books" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>" SelectCommand="select * from books where dir = 'ltr' order by id desc"></asp:SqlDataSource>
            <asp:SqlDataSource ID="ds_SearchBox" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                SelectCommand="SELECT [id], [title] from [books]  WHERE [dir]='ltr'"></asp:SqlDataSource>
        </telerik:RadAjaxPanel>
                </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
