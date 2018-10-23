<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_remove.aspx.vb" Inherits="remove" %>

<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc1:loginquery ID="loginquery1" runat="server" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Remove User</span></h2>
            <div id="login" class="font_courier color_mineshaft fonts_1_1">
                <asp:Label ID="lblNotAvailable" Visible="false" runat="server" CssClass="color_monza bolded"
                    Text="The Username You Entered is Not Available in Our Database"></asp:Label>
                <asp:Label ID="lblOk" runat="server" Visible="false" Text="Username Removed" CssClass="color_green bolded"></asp:Label>

              
                <ul>
                    <li><span>Username:</span><asp:TextBox ID="txtUsername" ValidationGroup="remove" CssClass="login-txt rounded_5"
                        runat="server"></asp:TextBox></li>
                   
                    <li><span>
                        <asp:LinkButton ID="btnRemove" ValidationGroup="remove" runat="server" Text="Submit"
                            CssClass="login-btn back_monza rounded_5 padded_3 color_white"></asp:LinkButton></span></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
