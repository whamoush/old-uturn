<%@ Page Title="" Language="VB" MasterPageFile="~/front.master" AutoEventWireup="false"
    CodeFile="about.aspx.vb" Inherits="about" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc2:current ID="current1" runat="server" _menuItem="lbSix" _menuItemMobile="lbMobileSix" />

    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>About U-Turn</span></h2>  
            <div class="page-description  font_courier color_mineshaft fonts_1_1">
            <asp:Image ID="Verse" CssClass="about-verse" runat='server' />
            
               <asp:Repeater ID="rpAbout" runat="server" DataSourceID="ds_About">
                <ItemTemplate>
                
                <h4 class='fonts_1_1 text-<%#Eval("dir")%>' ><%#Eval("title") %></h4>
                <p class='text-<%#Eval("dir")%>'><%#Eval("description") %></p><br /><br />

              
                </ItemTemplate>
               </asp:Repeater>
               <asp:SqlDataSource ID="ds_About" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                            SelectCommand="select [title], [description], [dir] from [about]"></asp:SqlDataSource>
                           </div>
         
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
