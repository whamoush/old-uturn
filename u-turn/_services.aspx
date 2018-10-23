<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_services.aspx.vb" Inherits="_aservices" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <uc1:loginquery ID="loginquery1" runat="server" />
    <uc2:current ID="current1" runat="server" _menuItem="lbTwo" _menuItemMobile="lbMobileTwo" />
    <div id="content" class="div_auto">
     <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Our Services</span></h2>
            <p class="clear-fix">
            </p>
            <asp:Label ID="lblDone" runat="server" Visible="false" Text="Changes Saved." CssClass="hideme done back_green padded rounded_5 color_white font_courier fonts_1_2"></asp:Label>
            <asp:LinkButton ID="btnAdd" runat="server" Text="Add Service" CssClass="save-btn back_endeavour rounded_5 padded color_white font_courier fonts_1_2"></asp:LinkButton>&nbsp;<asp:LinkButton
                ID="btnlabels" runat="server" Text="Edit labels" PostBackUrl="~/_services_labels.aspx"
                CssClass="save-btn back_endeavour rounded_5 padded color_white font_courier fonts_1_2"></asp:LinkButton><br />
            <br />

             <div id="search-box-container" class="back_gallery">
              
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
                    <asp:Label ID="lblId" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                    <asp:Label ID='lbllabel' runat="server" Visible="false" Text='<%#Eval("label") %>'></asp:Label>
                    <ul id='<%#Eval("id") %>' class="content-items content-items-pages font_courier">
                        <li class="books-info-input border-box-solved relative color_endeavour">
                            <asp:Repeater ID="rpLabel" runat="server" DataSourceID="ds_Label">
                                <ItemTemplate>
                                    <img src='img/assets/img/services/<%#Eval("image") %>' width="100px" height="100px"
                                        alt='<%#Eval("title") %>' />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="ds_label" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>">
                            </asp:SqlDataSource>
                            <h3 class="list-title padded fonts_1_5 border-endeavour">
                               <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("mytitle")%>'></asp:Label></h3>
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="login-txt rounded_5" Text='<%#Eval("title") %>'></asp:TextBox>
                            <asp:DropDownList ID="ddllabel" DataSourceID="ds_labels" DataTextField="title"
                                runat="server">
                            </asp:DropDownList>
                            <br />
                
                            <asp:SqlDataSource ID="ds_labels" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                                SelectCommand="SELECT [ID], [title] FROM [services_labels]"></asp:SqlDataSource>
                      
                        </li>
                        <li class="back_endeavour color_white ">
                            <p class="list-description  padded fonts_1_1">
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="login-txt login-txt-multi rounded_5"
                                    TextMode="MultiLine" Height="40px" Text='<%#Eval("description")%>'></asp:TextBox>
                     <br /><br />
                                    <span>Place above:</span>
                                    <asp:DropDownList ID="ddlPosition" DataSourceID="ds_Position" DataTextField="title"
                                        runat="server">
                                    </asp:DropDownList>
                                          <asp:SqlDataSource ID="ds_Position" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>">
                            </asp:SqlDataSource>
                                </p>
                        </li>
                        <p class="clear-fix">
                    </ul>
                    <p class="save-btn-container back_buttercup padded font_courier border-box-solved margin_10">
                        <asp:LinkButton ID="btnSave" CommandName="save" runat="server" Text="Save Changes"
                            CssClass="save-btn back_monza rounded_5 padded_3 color_white"></asp:LinkButton>
                        <asp:LinkButton ID="btnOrder" CommandName="order" runat="server" Text="Change position"
                            CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" CommandName="delete" runat="server" Text="Delete"
                            CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                    </p>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="ds_Services" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>">
            </asp:SqlDataSource>
                  <asp:SqlDataSource ID="ds_SearchBox" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                    SelectCommand="SELECT [id], [title] from [services]"></asp:SqlDataSource>
            <p class="clear-fix">
            </p>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
