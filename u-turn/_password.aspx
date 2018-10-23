<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_password.aspx.vb" Inherits="password" %>

<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc1:loginquery ID="loginquery1" runat="server" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Change Password</span></h2>
            <div id="login" class="font_courier color_mineshaft fonts_1_1">
                <asp:Label ID="lblNotAvailable" Visible="false" runat="server" CssClass="color_monza bolded"
                    Text="Wrong Current Password"></asp:Label>
                <asp:Label ID="lblOk" runat="server" Visible="false" Text="Password Changed" CssClass="color_green bolded"></asp:Label>
                <p style="margin-top: 20px; margin-bottom: 10px;">
                    <asp:RequiredFieldValidator ID="rfvCurrent" ValidationGroup="password" ControlToValidate="txtCurrent"
                        CssClass="back_monza color_white padded_3 rounded_5 bolded" runat="server" Text="Current Password: Required Field"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="rfvNew" ValidationGroup="password" ControlToValidate="txtNew"
                        CssClass="back_monza color_white padded_3 rounded_5 bolded" runat="server" Text="New Password: Required Field"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNew" ValidationGroup="password" runat="server"
                        Display="Dynamic" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,16}$"
                        CssClass="back_monza color_white padded_3 rounded_5 bolded" Text="New Password: Password is Not Strong Enough"
                        ControlToValidate="txtNew"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvRepeat" ValidationGroup="password" ControlToValidate="txtRepeat"
                        CssClass="back_monza color_white padded_3 rounded_5 bolded" runat="server" Text="Repeat Password: Required Field"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvRepeat" ValidationGroup="password" runat="server" Text="Passwords do not match"
                        CssClass="back_monza color_white padded_3 rounded_5 bolded" ControlToCompare="txtNew"
                        ControlToValidate="txtRepeat" Display="Dynamic"></asp:CompareValidator>
                </p>
                <p class="fonts_0_75 color_boulder" style="text-align: left; width: 300px; margin: 0 auto 25px auto;">
                    Note: Password must be at least 4 characters, no more than 8 characters, and must
                    include at least one upper case letter, one lower case letter, and one numeric digit.</p>
                <ul>
                    <li><span>Current Password:</span><asp:TextBox ID="txtCurrent" ValidationGroup="password"
                        TextMode="Password" CssClass="login-txt rounded_5" runat="server"></asp:TextBox></li>
                    <li><span>New Password:</span><asp:TextBox ID="txtNew" ValidationGroup="password"
                        runat="server" CssClass="login-txt rounded_5" TextMode="Password"></asp:TextBox></li>
                    <li><span>Repeat Password:</span><asp:TextBox ID="txtRepeat" ValidationGroup="password"
                        runat="server" CssClass="login-txt rounded_5" TextMode="Password"></asp:TextBox></li>
                    <li><span>
                        <asp:LinkButton ID="btnSubmit" ValidationGroup="password" runat="server" Text="Submit"
                            CssClass="login-btn back_monza rounded_5 padded_3 color_white"></asp:LinkButton></span></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
