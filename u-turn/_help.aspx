<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_help.aspx.vb" Inherits="_ahelp" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <uc1:loginquery ID="loginquery1" runat="server" />
    <uc2:current ID="current1" runat="server" _menuItem="lbFive" _menuItemMobile="lbMobileFive" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Guidance</span></h2>
            <p class="clear-fix">
            </p>
            <asp:Label ID="lblDone" runat="server" Visible="false" Text="Changes Saved." CssClass="hideme done back_green padded rounded_5 color_white font_courier fonts_1_2"></asp:Label>
            <asp:LinkButton ID="btnAdd" runat="server" Text="Add New Item" CssClass="save-btn back_monza rounded_5 padded color_white font_courier fonts_1_2"></asp:LinkButton><br />
           <br />
            <div id="search-box-container" class="back_gallery">
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
                </h3>
      
                <span class="clear-fix-block"></span>
                <br />
            </div>
            <asp:Repeater ID="rpHelp" runat="server" DataSourceID="ds_Help">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                    <asp:Label ID="lblIsrtl" runat="server" Visible="false" Text='<%#Eval("isrtl") %>'></asp:Label>
                    <ul id='<%#Eval("id") %>' class="content-items content-items-pages font_courier">
                        <li class="border-box-solved relative color_mineshaft">
                            <h3 class="list-title padded fonts_1_5 border-monza">
                                <asp:Label Text='<%#Eval("mytitle")%>' ID="lblTitle" runat="server"></asp:Label></h3>
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="login-txt rounded_5 margin_10"
                                Text='<%#Eval("title") %>'></asp:TextBox>
                            <p>
                                <span>Place above:</span>
                                <asp:DropDownList ID="ddlPosition" DataSourceID="ds_Position" DataTextField="title"
                                    runat="server" Width="300px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ds_Position" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>">
                                </asp:SqlDataSource>
                            </p>
                        </li>
                        <li class=" back_monza">
                            <p class="list-description padded fonts_1_1" style="padding-bottom:2px;">
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="login-txt login-txt-multi rounded_5"
                                    TextMode="MultiLine" Height="55px" Text='<%#Eval("description")%>'></asp:TextBox>
                            </p>
                            <span style="padding-left:10px;">is category in arabic?&nbsp; <asp:CheckBox ID="cbDir" runat="server" />yes </span>
                        </li>
                        <p class="clear-fix">
                    </ul>
                    <p class="save-btn-container back_endeavour padded font_courier border-box-solved margin_10">
                        <asp:LinkButton ID="btnSave" CommandName="save" runat="server" Text="Save Changes"
                            CssClass="save-btn back_buttercup rounded_5 padded_3 color_mineshaft"></asp:LinkButton>
                        <asp:LinkButton ID="btnOrder" CommandName="order" runat="server" Text="Change position"
                            CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" CommandName="delete" runat="server" Text="Delete"
                            CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                    </p>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="ds_Help" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                SelectCommand="SELECT [id], SUBSTRING(title, 1, 25) as mytitle,[title], [description], [isrtl] FROM [help] ORDER BY position ASC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ds_SearchBox" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                SelectCommand="SELECT [id], [title] from [help]"></asp:SqlDataSource>
            <p class="clear-fix">
            </p>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
