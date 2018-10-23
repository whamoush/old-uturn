<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_email.aspx.vb" Inherits="email" %>

<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc1:loginquery ID="loginquery1" runat="server" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Change Email</span></h2>
            <div id="login" class="font_courier color_mineshaft fonts_1_1">
                <asp:Label ID="lblCurrentPassword" Visible="false" runat="server" CssClass="color_monza bolded"
                    Text="Wrong Current Password"></asp:Label>
                <asp:Label ID="lblCurrentEmail" runat="server" Visible="false" Text="Wrong Current Email"
                    CssClass="color_monza bolded"></asp:Label>
                <asp:Label ID="lblOk" runat="server" Visible="false" Text="Email Changed" CssClass="color_green bolded"></asp:Label>
                <p style="margin-top: 20px; margin-bottom: 10px;">
                    <asp:RequiredFieldValidator  ID="rfvCurrentPassword" ValidationGroup="email" ControlToValidate="txtCurrentPassword"
                        runat="server" Text="Current Password: Required Field" CssClass="back_monza color_white padded_3 rounded_5 bolded"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="rfvCurrentEmail" ValidationGroup="email" ControlToValidate="txtCurrentEmail"
                        runat="server" Text="Current Email: Required Field" CssClass="back_monza color_white padded_3 rounded_5 bolded"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revCurrentEmail" ValidationGroup="email" runat="server" Display="Dynamic"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="Current Email: Wrong Format"
                        ControlToValidate="txtCurrentEmail" CssClass="back_monza color_white padded_3 rounded_5 bolded"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvNewEmail" ValidationGroup="email" ControlToValidate="txtNewEmail" runat="server"
                        Text="New Email: Required Field" CssClass="back_monza color_white padded_3 rounded_5 bolded"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNewEmail" ValidationGroup="email" runat="server" Display="Dynamic"
                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Text="New Email: Wrong Format"
                        ControlToValidate="txtNewEmail" CssClass="back_monza color_white padded_3 rounded_5 bolded"></asp:RegularExpressionValidator>
                </p>
                <ul>
                    <li><span>Current Password:</span><asp:TextBox ID="txtCurrentPassword" ValidationGroup="email" TextMode="Password"
                        CssClass="login-txt rounded_5" runat="server"></asp:TextBox></li>
                    <li><span>Current Email:</span><asp:TextBox ID="txtCurrentEmail" ValidationGroup="email" runat="server" CssClass="login-txt rounded_5"></asp:TextBox></li>
                    <li><span>New Email:</span><asp:TextBox ID="txtNewEmail" ValidationGroup="email" runat="server" CssClass="login-txt rounded_5"></asp:TextBox></li>
                    <li><span>
                        <asp:LinkButton ID="btnSubmit" ValidationGroup="email" runat="server" Text="Submit" CssClass="login-btn back_monza rounded_5 padded_3 color_white"></asp:LinkButton></span></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
