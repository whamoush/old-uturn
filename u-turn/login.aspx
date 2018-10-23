<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="login.aspx.vb" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Login</span></h2>
            <div id="login" class="font_courier color_mineshaft fonts_1_1">
             <asp:Label ID="lblConfirm" Visible="false" runat="server" CssClass="color_endeavour"
                            Text="Username/Password Combination Incorrect"></asp:Label>
            <ul>
            <li><span>Username:</span><asp:textbox ID="txtUsername" CssClass="login-txt rounded_5" runat="server" ValidationGroup="login" ></asp:textbox></li>
            <li><span>Password:</span><asp:TextBox ID="txtPassword" runat="server" CssClass="login-txt rounded_5" TextMode="Password" ValidationGroup="login" ></asp:TextBox></li>
            <li><span><asp:linkbutton id="btnSubmit" runat="server" text="Submit" CssClass="login-btn back_monza rounded_5 padded_3 color_white" ValidationGroup="login" ></asp:linkbutton></span></li>
            </ul>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
