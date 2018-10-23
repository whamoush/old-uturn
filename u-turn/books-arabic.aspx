<%@ Page Title="" Language="VB" MasterPageFile="~/front.master" AutoEventWireup="false"
    CodeFile="books-arabic.aspx.vb" Inherits="books_arabic" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc2:current ID="current1" runat="server" _menuItem="lbBooksAr" _menuItemMobile="lnMobBooksAr" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Our Books</span></h2>
            <p class="clear-fix">
            </p>
            <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel1"
                HorizontalAlign="NotSet">
                <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
                <div id="search-box-container" class="back_gallery">
                    <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" IsSticky="true">
                        <asp:Image ID="Image1" CssClass="loadingpanel  " runat="server" ImageUrl="img/ajax-loader.gif">
                        </asp:Image>
                    </telerik:RadAjaxLoadingPanel>
                    <h3 class=" color_mineshaft font_courier">
                        Categories</h3>
                    <ul class="fonts_0_85 color_white font_courier">
                        <asp:Repeater ID="rpCategories" runat="server" DataSourceID="ds_Categories">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                                <li class='rounded_5 text-<%#Eval("dir") %>' style='background: <%#Eval("color")%>;'>
                                    <asp:LinkButton ID="lbCategorize" CommandName="categorize" runat="server" Text='<%#Eval("category")%>'></asp:LinkButton>
                                    -<asp:Literal ID="ltlCount" runat="server"></asp:Literal>- </li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="ds_Categories" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                            SelectCommand="select id, category, color, dir from books_categories WHERE [dir]='rtl' ORDER BY [position] asc "></asp:SqlDataSource>
                        <p class="clear-fix">
                        </p>
                    </ul>
                    <br />
                    <h3 class=" color_mineshaft font_courier">
                        Search Books</h3>
                    <telerik:RadSearchBox ID="RadSearchBox1" EmptyMessage="Search..." runat="server"
                        Width="100%" DataTextField="title" DataValueField="id" OnSearch="RadSearchBox1_Search"
                        DataSourceID="ds_SearchBox" EnableEmbeddedSkins="false" Skin="BlackMetroTouch" >
                    </telerik:RadSearchBox>
                     <br />
                    <br />
                   <h3 class="color_mineshaft font_courier">
                      <asp:LinkButton ID="btnGo" runat="server" ValidationGroup="viewall" CssClass="color_endeavour" Text="Click Here"></asp:LinkButton> to View All:
                    </h3><span class="clear-fix-block"></span>
                    <br />
                </div>
                <asp:Repeater ID="rpBooks" runat="server" DataSourceID="DS_Books">
                    <ItemTemplate>
                        <asp:Label ID="lblCategory" runat="server" Visible="false" Text='<%#Eval("category")%>'></asp:Label>
                        <ul class="content-items content-items-books font_courier margin_10">
                            <li id="book" class='border-box-solved <%#Eval("dir") %>'>
                                <img src='img/assets/img/books/<%#Eval("image") %>' width="102px" height="150px" class='book-img-<%#Eval("dir") %>' alt='<%#Eval("title") %>' />
                                <h3 class="list-title padded fonts_1_5 border-buttercup color_mineshaft text-<%#Eval("dir") %>">
                                    <%#Eval("title")%></h3>
                                    <div class='books-<%#Eval("dir") %>'>
                                <asp:Repeater ID="rpThisCategory" runat="server" DataSourceID="ds_ThisCategory">
                                    <ItemTemplate>
                                        <span class="padded category">in: <span class="rounded_5 padded_3 color_white"
                                            style='background-color: <%#Eval("color")%>'>
                                            <%#Eval("category") %></span></span>
                                    </ItemTemplate>
                                </asp:Repeater>
                                </div>
                                <asp:SqlDataSource ID="ds_ThisCategory" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>">
                                </asp:SqlDataSource>
                            </li>
                            <li class="content-items-description back_buttercup <%#Eval("dir") %>">  
                                <p class='list-description padded fonts_1_1  text-<%#Eval("dir") %>'>
                                    <span><%#Eval("author")%></span><br />
                                    <span class="italicized">
                                        <%#Eval("publisher")%></span> <br />
                                    <span class="list-description-price fonts_1_5 font_courier">
                                        <%#Eval("price") %></span></p>
                            </li>
                            <p class="clear-fix">
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="ds_Books" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="ds_SearchBox" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                    SelectCommand="SELECT [id], [title] from [books]"></asp:SqlDataSource>
            </telerik:RadAjaxPanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
