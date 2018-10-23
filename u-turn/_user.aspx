<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_user.aspx.vb" Inherits="user_" %>

<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc1:loginquery ID="loginquery1" runat="server" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Add User</span></h2>
            <div id="login" class="font_courier color_mineshaft fonts_1_1">
                <asp:Label ID="lblNotAvailable" Visible="false" runat="server" CssClass="color_monza bolded"
                    Text="Username already exists"></asp:Label>
                <asp:Label ID="lblOk" runat="server" Visible="false" Text="User Added" CssClass="color_green bolded"></asp:Label>
                <p style="margin-top: 20px; margin-bottom: 10px;">
                    <asp:RequiredFieldValidator ID="rfvUsername" ValidationGroup="user" ControlToValidate="txtUsername"
                        runat="server" Text="Username: Required Field" CssClass="back_monza color_white padded_3 rounded_5 bolded"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="rfvEmail" ValidationGroup="user" ControlToValidate="txtEmail"
                        runat="server" Text="Email: Required Field" CssClass="back_monza color_white padded_3 rounded_5 bolded"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" ValidationGroup="user" runat="server"
                        CssClass="back_monza color_white padded_3 rounded_5 bolded" ControlToValidate="txtEmail"
                        Display="Dynamic" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ErrorMessage="Email: Wrong Format"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvPass" ValidationGroup="user" ControlToValidate="txtPass"
                        runat="server" Text="Password: Required Field" CssClass="back_monza color_white padded_3 rounded_5 bolded"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPass" ValidationGroup="user" runat="server"
                        Display="Dynamic" ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,16}$"
                        Text="Password: Password is Not Strong Enough" ControlToValidate="txtPass" CssClass="back_monza color_white padded_3 rounded_5 bolded"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvRepeat" ValidationGroup="user" ControlToValidate="txtRepeat"
                        runat="server" Text="Repeat Password: Required Field" CssClass="back_monza color_white padded_3 rounded_5 bolded"
                        Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvRepeat" ValidationGroup="user" S runat="server" Text="Passwords do not match"
                        ControlToCompare="txtPass" ControlToValidate="txtRepeat" CssClass="back_monza color_white padded_3 rounded_5 bolded"
                        Display="Dynamic"></asp:CompareValidator>
                </p>
                <p class="fonts_0_75 color_boulder" style="text-align: left; width: 300px; margin: 0 auto 25px auto;">
                    Note: Password must be at least 4 characters, no more than 8 characters, and must
                    include at least one upper case letter, one lower case letter, and one numeric digit.</p>
                <ul>
                    <li><span>Username:</span><asp:TextBox ID="txtUsername" ValidationGroup="user" CssClass="login-txt rounded_5"
                        runat="server"></asp:TextBox></li>
                    <li><span>Email:</span><asp:TextBox ID="txtEmail" ValidationGroup="user" runat="server"
                        CssClass="login-txt rounded_5"></asp:TextBox></li>
                    <li><span>Password:</span><asp:TextBox ID="txtPass" ValidationGroup="user" TextMode="Password"
                        runat="server" CssClass="login-txt rounded_5"></asp:TextBox></li>
                    <li><span>Repeat Password:</span><asp:TextBox ID="txtRepeat" ValidationGroup="user"
                        TextMode="Password" runat="server" CssClass="login-txt rounded_5"></asp:TextBox></li>
                    <li><span>
                        <asp:LinkButton ID="btnSubmit" ValidationGroup="user" runat="server" Text="Submit"
                            CssClass="login-btn back_monza rounded_5 padded_3 color_white"></asp:LinkButton></span></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
