<%@ Control Language="VB" AutoEventWireup="false" CodeFile="dash.ascx.vb" Inherits="_dash" %>

    <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>User: <asp:Label ID="lblUsername" runat="server"></asp:Label></span></h2>

                <h4 class="fonts_1_2"><asp:Label ID="lblEmail" runat="server" CssClass="color_mineshaft"></asp:Label></h4>
      
            
            <div id="dash-links">
                <a href="_password.aspx" class="login-btn back_monza rounded_5 padded_3 border-box-solved color_white">Change Password</a>
                <a href="_email.aspx" class="login-btn back_monza rounded_5 padded_3 border-box-solved color_white">Change Email</a>
                <a href="_user.aspx" class="login-btn back_monza rounded_5 padded_3 border-box-solved color_white">Add New User</a>
                <a href="_remove.aspx" class="login-btn back_monza rounded_5 padded_3 border-box-solved color_white">Remove User</a>
                <a href="_available.aspx" class="login-btn back_monza rounded_5 padded_3 border-box-solved color_white">Available Users</a>
                <a href="mailto:walid.hamoush@gmail.com" class="login-btn back_monza rounded_5 padded_3 border-box-solved color_white">Contact Support</a>
                <p class="clear-fix"></p>
            </div>

    
    <br />