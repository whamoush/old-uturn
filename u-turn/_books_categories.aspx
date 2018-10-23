<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_books_categories.aspx.vb" Inherits="_abooks_categories" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<%@ Register Src="dash.ascx" TagName="dash" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <uc1:loginquery ID="loginquery1" runat="server" />
    <uc2:current ID="current1" runat="server" _menuItem="lbThree" _menuItemMobile="lbMobileThree" />
   
    <div id="content" class="div_auto">
        <div id="content-page-container" class="font_courier">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Books: Edit Categories</span>
            </h2>
            <p class="clear-fix">
            </p>
            <asp:LinkButton ID="btnGo" runat="server" Text="Back to Books." CssClass="save-btn back_endeavour rounded_5 padded color_white font_courier fonts_1_2"
                PostBackUrl="_books.aspx"></asp:LinkButton>&nbsp;<asp:LinkButton ID="btnGoArabic" runat="server" Text="Back to Arabic Books." CssClass="save-btn back_endeavour rounded_5 padded color_white font_courier fonts_1_2"
                PostBackUrl="_books_arabic.aspx"></asp:LinkButton><br />
            <br />
            <br />
            <p class="clear-fix">
            </p>
            <asp:Label ID="lblDone" runat="server" Visible="false" Text="Changes Saved." CssClass="hideme done back_green padded rounded_5 color_white font_courier fonts_1_2"></asp:Label>
            <asp:Repeater ID="rpCategories" runat="server" DataSourceID="ds_Categories">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblColor" runat="server" Text='<%#Eval("color") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblIsrtl" runat="server" Text='<%#Eval("isrtl") %>' Visible="false"></asp:Label>
                    <div class="back-image-services margin_10">
                        <div class="books-category border-box-solved padded back_buttercup">
                            <span class="books-details">category title:&nbsp;<asp:TextBox ID="txtCategory" runat="server"
                                CssClass="login-txt login-txt-multi rounded_5 margin_10" Text='<%#Eval("category") %>'></asp:TextBox></span>
                                <span>Place above:</span>
                                    <asp:DropDownList ID="ddlPosition" DataSourceID="ds_Position" DataTextField="category"
                                        runat="server">
                                    </asp:DropDownList>
                                            <asp:SqlDataSource ID="ds_Position" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>">
                                </asp:SqlDataSource>
                                <span class="books-details">is category in arabic?&nbsp; <asp:CheckBox ID="cbDir" runat="server" />yes </span>

                           

                            <span class="books-details">category color:&nbsp;
                                 <telerik:RadColorPicker ID="rcpColor" RenderMode="Lightweight" PaletteModes="All" runat="server" CssClass="login-txt login-txt-multi rounded_5 margin_10">
                                </telerik:RadColorPicker>
                            </span>
                        </div>
                        <span class="clear-fix-block"></span>
                        <p class="save-btn-container back_monza padded font_courier border-box-solved margin_10">
                            <asp:LinkButton ID="btnSave" CommandName="save" runat="server" Text="Save Changes"
                                CssClass="save-btn back_endeavour rounded_5 padded_3 color_white"></asp:LinkButton>
                                <asp:LinkButton ID="btnOrder" CommandName="order" runat="server" Text="Change position"
                            CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" CommandName="delete" runat="server" Text="Delete"
                                CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="ds_Categories" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                SelectCommand="SELECT [id], [category], [color], [dir], [isrtl] FROM [books_categories] ORDER BY [position] asc"></asp:SqlDataSource>
            <div class="back-image-services margin_10">
                <div class="books-category border-box-solved padded back_endeavour">
                    <span class="books-details">category title:&nbsp;<asp:TextBox ID="txtNewCategory"
                        runat="server" CssClass="login-txt login-txt-multi rounded_5 margin_10"></asp:TextBox></span>
                        <span class="books-details">is category in arabic?&nbsp; <asp:CheckBox ID="cbDir" runat="server" />yes </span>
                    <span class="books-details">category color:&nbsp;<telerik:RadColorPicker ID="rcpNewColor"
                        runat="server" CssClass="login-txt login-txt-multi rounded_5 margin_10">
                    </telerik:RadColorPicker>
                    </span>
                </div>
                <span class="clear-fix-block"></span>
                <p class="save-btn-container back_monza padded font_courier border-box-solved margin_10">
                    <asp:LinkButton ID="btnAdd" CommandName="add" runat="server" Text="Add New Category"
                        CssClass="save-btn back_endeavour rounded_5 padded_3 color_white"></asp:LinkButton>
                </p>

                          

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
