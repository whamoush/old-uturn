<%@ Page Title="" Language="VB" MasterPageFile="~/front.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc2:current ID="current1" runat="server" _menuItem="lbOne" _menuItemMobile="lbMobileOne" />
    


    <div id="content" class="div_auto">
    

        <div id="content-services">
            <p id="services-hidden-title" class='content-title font_souvenir color_endeavour fonts_1_1'>
                SERVICES</p>
            <img id="content-services-title" src="img/content-services.png" alt='Our Services' width="32" height="290" />
            <div id="content-services-services" class="back_endeavour">
                <ul class="font_courier product-list">
                    <asp:Repeater ID="rpServices" runat="server" DataSourceID="ds_Services">
                        <ItemTemplate>
                            <li><a class="color_white" href="services.aspx#<%#Eval("id") %>">
                                <%#Eval("title")%></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="ds_Services" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                        SelectCommand="SELECT TOP 9 [id], [title] FROM [services] ORDER BY position ASC"></asp:SqlDataSource>
                </ul>
                <a href="services.aspx" class="services-button font_souvenir color_white"><span class="fonts_0_6">
                    >></span> All Our Services <span class="fonts_0_6"><<</span></a>
            </div>
            <p class="clear-fix">
            </p>
            <p class="seperator">
            </p>
            <div id="yellow_box" class="back_buttercup">
                <a href="http://blog.uturnonline.com" class="content-title font_souvenir color_white fonts_1_1">
                        BLOG
                    </a>
            </div>
        </div>
        <div id="content-bookguidance">
            <div id="content-bookguidance-left" class="border-box-solved">
                <p class='content-title font_souvenir color_buttercup fonts_1_1'>
                    FEATURED BOOKS</p>
                <asp:Repeater ID="rpBook" runat="server" DataSourceID="ds_Book">
                    <ItemTemplate>
                        <div id="content-bookguidance-book" class="back_buttercup">
                            <div style="margin: 10px;">
                                <img class="books-pic" src='img/assets/img/books/<%#Eval("image") %>' height="138"
                                    alt='<%#Eval("title") %>' />
                                <p class="font_courier fonts_0_85">
                                    <span class="bolded">
                                        <%#Eval("title")%></span><br />
                                    <span><%#Eval("author")%></span><br />
                                    <span class="italicized fonts_0_8">
                                        <%#Eval("publisher")%></span><br />
                                    <span class="fonts_2">
                                        <%#Eval("price") %></span>
                                </p>
                                <p class="clear-fix">
                                </p>
                                <a href="books.aspx" class="books-button font_souvenir color_cinnamon"><span class="fonts_0_6">
                                    >></span> More Books <span class="fonts_0_6"><< </span></a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="ds_Book" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                    SelectCommand="SELECT [title], [author], [publisher], [price], [image] FROM [books] WHERE [featured]=1 ">
                </asp:SqlDataSource>
                <p class="clear-fix">
                </p>
                <p class="seperator">
                </p>
                <div id="red_box" class="back_monza">
                    <a href="readings.aspx" class="content-title font_souvenir color_white fonts_1_1">
                        READINGS
                    </a>
                </div>
            </div>
            <div id="content-bookguidance-guidance">
                <p class="content-title font_souvenir fonts_1_1 color_monza">
                    GUIDANCE & COUNSELING</p>
                <div id="content-bookguidance-guidance-content" class="back_monza">
                    <ul class="font_courier product-list">
                        <asp:Repeater ID="rpHelp" runat="server" DataSourceID="ds_Help">
                            <ItemTemplate>
                                <li><a class="color_white" href="help.aspx#<%#Eval("id") %>">
                                    <%#Eval("title")%></a>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:SqlDataSource ID="ds_Help" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                            SelectCommand="SELECT TOP 7 [id], [title] FROM [help] ORDER BY position ASC"></asp:SqlDataSource>
                    </ul>
                    <a href="help.aspx" class="services-button font_souvenir color_white"><span class="fonts_0_6">
                        >></span> Click Here for More <span class="fonts_0_6"><<</span></a>
                </div>
            </div>
            <p class="clear-fix">
            </p>
            <p class="seperator">
            </p>
            <asp:Image ID="verse" CssClass="verse" runat="server" />
           
        </div>
        <p class="clear-fix">
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <!-- SCRIPTS -->
    <!-- JQUERY -->
    <script src="js/jquery-1.10.1.min.js" type="text/javascript"></script>
    <!-- /JQUERY -->
    <!-- SCROLL OFFSET -->
    <script type="text/javascript">
        $("document").ready(function () {

            $('#topbar-menu-4').click(function () {

                $('html, body').animate({
                    scrollTop: $("#bottom").offset().top
                }, 2000);


            });



        });
    </script>
    <!-- /SCROLL OFFSET -->
    <!-- end: SCRIPTS -->
</asp:Content>
