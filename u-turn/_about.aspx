<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_about.aspx.vb" Inherits="_aabout" %>

<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>

<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc1:loginquery ID="loginquery1" runat="server" />
    <uc2:current ID="current1" runat="server" _menuItem="lbSix" _menuItemMobile="lbMobileSix" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>About U-Turn</span></h2>
                <asp:Label ID="lblDone" runat="server" Visible="false" Text="Changes Saved." CssClass="hideme done back_green padded rounded_5 color_white font_courier fonts_1_2"></asp:Label>
                    <asp:LinkButton ID="btnAdd" runat="server" Text="Add 'About' Entry" CssClass="save-btn back_endeavour rounded_5 padded color_white font_courier fonts_1_2"></asp:LinkButton><br /><br /><br />
            <asp:Repeater ID="rpAbout" runat="server" DataSourceID="ds_About">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                    <asp:label ID="lblIsrtl" runat="server" Text='<%#Eval("isrtl") %>' Visible="false"></asp:label>
                    <div class="back_givry padded border-box-solved  font_courier color_mineshaft fonts_1_1">
                        <h4 class="fonts_1_1">
                            <%#Eval("title") %>
                            &nbsp;<asp:TextBox ID="txtTitle" runat="server" CssClass="login-txt rounded_5" Text='<%#Eval("title") %>'></asp:TextBox> <span style="padding-left:10px;">is it in arabic?&nbsp; <asp:CheckBox ID="cbDir" runat="server" />yes </span></h4>
                        <asp:TextBox ID="txtDescription" runat='server' Text='<%#Eval("description") %>'
                            TextMode="MultiLine" Width="99%" Height="150px" CssClass="login-txt rounded_5"></asp:TextBox><br />
                        <br />
                    </div>
                    <p class="save-btn-container back_buttercup padded font_courier border-box-solved margin_10">
                        <asp:LinkButton ID="btnSave" CommandName="save" runat="server" Text="Save Changes"
                            CssClass="save-btn back_monza rounded_5 padded_3 color_white"></asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" CommandName="delete" runat="server" Text="Delete"
                            CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                    </p>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                    <asp:label ID="lblIsrtl" runat="server" Text='<%#Eval("isrtl") %>' Visible="false"></asp:label>
                    <div class="back_onahau padded border-box-solved  font_courier color_mineshaft fonts_1_1">
                        <h4 class="fonts_1_1">
                            <%#Eval("title") %>
                            &nbsp;<asp:TextBox ID="txtTitle" runat="server" CssClass="login-txt rounded_5" Text='<%#Eval("title") %>'></asp:TextBox> <span style="padding-left:10px;">is it in arabic?&nbsp; <asp:CheckBox ID="cbDir" runat="server" />yes </span></h4>
                        <asp:TextBox ID="txtDescription" runat='server' Text='<%#Eval("description") %>'
                            TextMode="MultiLine" Width="99%" Height="150px" CssClass="login-txt rounded_5"></asp:TextBox><br />
                        <br />
                    </div>
                    <p class="save-btn-container back_endeavour padded font_courier border-box-solved margin_10">
                        <asp:LinkButton ID="btnSave" CommandName="save" runat="server" Text="Save Changes"
                            CssClass="save-btn back_monza rounded_5 padded_3 color_white"></asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" CommandName="delete" runat="server" Text="Delete"
                            CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                    </p>
                </AlternatingItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="ds_About" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                SelectCommand="select [id], [title], [description], [isrtl] from [about]">
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
