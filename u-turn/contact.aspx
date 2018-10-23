<%@ Page Title="" Language="VB" MasterPageFile="~/front.master" AutoEventWireup="false"
    CodeFile="contact.aspx.vb" Inherits="contact" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
 
    <div id="content" class="div_auto font_courier">
        <div>
            <h2 class="page-title color_endeavour bolded fonts_1_8">
                <span>Contact Us</span></h2>
            <p class="clear-fix">
            </p>
            <div id="contact">
                <ul>
                    <li class="back_endeavour">
                        <asp:Repeater ID="rpHelp" runat="server" DataSourceID="ds_Help">
                            <ItemTemplate>
                                <h3 class="contact-title color_mineshaft padded fonts_1_5 back_buttercup">
                                    <%#Eval("title")%></h3>
                                <div class="contact-info color_white padded">
                                    <h4 class="fonts_1_2">
                                        CONTACT US AT:</h4>
                                    <span><%#Eval("description")%></span>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </li>
                    <li class="back_monza padded color_white border-box-solved">
                    <asp:Label ID="lblConfirm" runat="server" Text="Email Sent Successfully" CssClass="hideme contact-label padded_3 font_courier back_endeavour color_white rounded_5" Visible="false"></asp:Label>
                        <h4 class="fonts_1_2">
                            CONTACT FORM:</h4>
                        Full Name:
                        <asp:RequiredFieldValidator ID="rfvFullname" ValidationGroup="contact" ControlToValidate="txtFullname"
                            Text="field required" CssClass="back_buttercup color_white contact-validator"
                            runat="server" /><br />
                        <asp:TextBox ID="txtFullname" CssClass="contact-txt rounded_5 font_courier" runat="server"
                            ValidationGroup="contact"></asp:TextBox>
                        Email:
                        <asp:RequiredFieldValidator ID="rfvEmail" ValidationGroup="contact" ControlToValidate="txtEmail"
                            Text="field required" CssClass="back_buttercup color_white contact-validator"
                            runat="server" Display="dynamic   " /><asp:RegularExpressionValidator ID="revEmail"
                                runat="server" CssClass="back_buttercup color_white contact-validator" ControlToValidate="txtEmail"
                                ValidationGroup="contact" Display="Dynamic" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ErrorMessage="invalid email address"></asp:RegularExpressionValidator><br />
                        <asp:TextBox ID="txtEmail" CssClass="contact-txt rounded_5 font_courier" runat="server"
                            ValidationGroup="contact"></asp:TextBox>
                        Questions:
                        <asp:RequiredFieldValidator ID="rfvQuestions" ValidationGroup="contact" ControlToValidate="txtQuestions"
                            Text="field required" CssClass="back_buttercup color_white contact-validator"
                            runat="server" /><br />
                        <asp:TextBox ID="txtQuestions" runat="server" CssClass="contact-txt rounded_5 font_courier"
                            TextMode="MultiLine" Height="70px" ValidationGroup="contact"></asp:TextBox>
                            <asp:TextBox ID="txtDo" runat="server" Visible="false" ValidationGroup="contact"></asp:TextBox>
                        <asp:LinkButton ID="btnSend" runat="server" Text="Send" ValidationGroup="contact"
                            CssClass=" padded contact-btn rounded_5 color_monza back_buttercup border-box-solved" />
                        <p class="clear-fix">
                        </p>
                    </li>
                </ul>
            </div>
            <asp:SqlDataSource ID="ds_Help" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                SelectCommand="SELECT [title], [description] from [general] where category='contact'">
            </asp:SqlDataSource>
            <p class="clear-fix">
            </p>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
