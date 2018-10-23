<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_services_labels.aspx.vb" Inherits="_aservices_labels" %>


<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<%@ Register Src="dash.ascx" TagName="dash" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <uc1:loginquery ID="loginquery1" runat="server" />
    <uc2:current ID="current1" runat="server" _menuItem="lbTwo" _menuItemMobile="lbMobileTwo" />
    <div id="content" class="div_auto">
        <div id="content-page-container" class="font_courier">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Services: Edit Labels</span>
            </h2>
            <p class="clear-fix">
            </p>
             <asp:LinkButton ID="btnGo" runat="server" Text="Back to Services." CssClass="save-btn back_endeavour rounded_5 padded color_white font_courier fonts_1_2" PostBackUrl="_services.aspx"></asp:LinkButton><br /><br /><br />
             <p class="clear-fix"></p>
            <asp:Label ID="lblDone" runat="server" Visible="false" Text="Changes Saved." CssClass="hideme done back_green padded rounded_5 color_white font_courier fonts_1_2"></asp:Label>
            <asp:Repeater ID="rplabels" runat="server" DataSourceID="ds_labels" >
                <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                <asp:Label ID="lblImage" runat="server" Text='<%#Eval("image") %>' Visible="false"></asp:Label>
                
                        <div class="back-image-services margin_10">
                            <div class="image-upload back_buttercup border-box-solved padded">
                                <asp:TextBox ID="txtlabel" runat="server" CssClass="login-txt rounded_5 margin_10"
                                    Text='<%#Eval("title") %>'></asp:TextBox>
                                 <asp:LinkButton ID="btnSave" CommandName="save" CssClass="save-btn back_monza rounded_5 padded_3 color_white"
                                    runat="server" Text="Save"></asp:LinkButton>
                                <br />
                                <asp:FileUpload ID="fuImage" runat="server" CssClass="login-txt rounded_5 margin_10 back_white  " />
                                <asp:RegularExpressionValidator ID="revImage" ControlToValidate="fuImage" runat="server" ValidationExpression="^.*\.(png|PNG|jpg|JPG)$" CssClass="color_monza bolded " Display="Dynamic" Text="Only .png and .jpg allowed"></asp:RegularExpressionValidator>
                                   
                           
                                <asp:LinkButton ID="btnUpload" CommandName="upload" CssClass="save-btn back_monza rounded_5 padded_3 color_white"
                                    runat="server" Text="Upload"></asp:LinkButton>
                                    <p><asp:LinkButton ID="btnDelete" CommandName="delete" runat="server" CssClass="save-btn back_monza rounded_5 padded_3 color_white" Text="Delete Label"></asp:LinkButton></p>
                                
                    
                            </div>
                            <p class="image-itself">
                               
                                <asp:Image ID="imgImage" runat="server" ImageUrl='<%# Eval("image", "~/img/assets/img/services/{0}") %>' AlternateText='<%#Eval("title") %>' />
                                                            </p>
                            <span class="clear-fix-block"></span>
                        </div>
                  
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="ds_labels" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                SelectCommand="SELECT [id], [title], [image] FROM [services_labels]"></asp:SqlDataSource>
                 <div class="back-image-services margin_10">
                            <div class="image-upload back_endeavour border-box-solved padded image-upload-new">
                                <asp:TextBox ID="txtNewLabel" runat="server" CssClass="login-txt rounded_5 margin_10" ValidationGroup="createnew"></asp:TextBox>
                         
                                <br />
                                <asp:FileUpload ID="fuNewImage" runat="server" CssClass="login-txt rounded_5 margin_10 back_white  " ValidationGroup="createnew" />
                                <asp:RegularExpressionValidator ID="revNewImage" ControlToValidate="fuNewImage" runat="server" ValidationGroup="createnew"  ValidationExpression="^.*\.(png|PNG|jpg|JPG)$" CssClass="color_buttercup bolded " Display="Dynamic" Text="Only .png and .jpg allowed"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfvNewImage" ControlToValidate="fuNewImage" runat="server" ValidationGroup="createnew" CssClass="color_buttercup bolded" Display="Dynamic" Text="no image selected."></asp:RequiredFieldValidator>                                                                       
                           
                                <asp:LinkButton ID="btnSubmit" CssClass="save-btn back_buttercup rounded_5 padded_3 color_mineshaft" ValidationGroup="createnew"
                                    runat="server" Text="Upload">
                                </asp:LinkButton>
                    
                            </div>
                       
                            <span class="clear-fix-block"></span>
                        </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
