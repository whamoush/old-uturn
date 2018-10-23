<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_default.aspx.vb" Inherits="_adefault" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<%@ Register Src="dash.ascx" TagName="dash" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<link rel="Stylesheet" href="css/marquee.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

    <uc1:loginquery ID="loginquery1" runat="server" />
    <uc2:current ID="current1" runat="server" _menuItem="lbOne" _menuItemMobile="lbMobileOne" />
    <div id="content" class="div_auto">
        <div id="content-page-container" class="font_courier">
            <uc2:dash ID="dash1" runat="server" />
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Homepage</span>
            </h2>
            <asp:Label ID="lblDone" runat="server" Visible="false" Text="Changes Saved." CssClass="hideme done back_green padded rounded_5 color_white font_courier fonts_1_2"></asp:Label>
                 <h4 class="fonts_1_2 color_mineshaft">Marquee text</h4>
                <asp:Repeater ID="rpMarquee" runat="server" DataSourceID="ds_Marquee">
                <ItemTemplate>
                <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                <div class="marquee-edit">
                <asp:TextBox ID="txtMarquee" runat="server" CssClass="login-txt marquee-txt rounded_5" Text='<%#Eval("description") %>'></asp:TextBox>
                     <asp:linkbutton ID="btnSave" CommandName="Save" CssClass="marquee-btn save-btn back_monza rounded_5 padded_3 color_white" runat="server" Text="Save">
                        </asp:linkbutton>&nbsp;<asp:linkbutton ID="btnDelete" CommandName="Delete" CssClass=" marquee-btn save-btn back_monza rounded_5 padded_3 color_white" runat="server" Text="Delete">
                        </asp:linkbutton>
                        </div>
                </ItemTemplate>
                </asp:Repeater>
                  <asp:SqlDataSource ID="ds_Marquee" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>" SelectCommand="SELECT [description],[id] from [general] where category='marquee'"></asp:SqlDataSource>
              <div class="marquee-edit">
                <asp:TextBox ID="txtMarqueeNew" runat="server" CssClass="login-txt marquee-txt rounded_5"></asp:TextBox>
                     <asp:linkbutton ID="btnNew" CommandName="New" CssClass="marquee-btn save-btn back_endeavour rounded_5 padded_3 color_white" runat="server" Text="Add New">
                        </asp:linkbutton>
                        </div>
            <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel1" LoadingPanelID="LoadingPanel1"
                HorizontalAlign="NotSet">
              
                <h4 class="fonts_1_2 color_mineshaft">
                    Cybergarden Link</h4>
                <div class="back-image">
                    <div class="image-upload back_buttercup border-box-solved padded">
                        <p class="font_courier color_mineshaft">
                            Change the cybergarden link image:</p>
                        <asp:Label ID="lblConfirm" runat="server" Visible="false" Text="Image Saved" CssClass="color_green font_courier bolded"></asp:Label>
                        <br />
                        <telerik:RadAsyncUpload ID="rauImage" AllowedFileExtensions="jpeg,jpg,gif,png,bmp"
                            runat="server" MultipleFileSelection="Disabled" OnFileUploaded="RadAsyncUpload1_FileUploaded">
                        </telerik:RadAsyncUpload>
                        <asp:linkbutton ID="btnSubmit" CssClass="save-btn back_monza rounded_5 padded_3 color_white" runat="server" Text="Submit">
                        </asp:linkbutton>
                         <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server" IsSticky="true">
                        <asp:Image ID="Image1" CssClass="adminloadingpanel" runat="server" ImageUrl="img/ajax-loader.gif">
                        </asp:Image>
                    </telerik:RadAjaxLoadingPanel>
                    </div>
                    <p class="image-itself">
                        <asp:Image ID="imgCybergarden" runat="server" />
                    </p>
                    <span class="clear-fix-block"></span>
                   
                </div>
            </telerik:RadAjaxPanel>
            <br />
            <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel2" LoadingPanelID="LoadingPanel2"
                HorizontalAlign="NotSet">
                <h4 class="fonts_1_2 color_mineshaft">
                    Verse Image</h4>
                <div class="back-image">
                    <div class="image-upload back_buttercup border-box-solved padded">
                        <p class="font_courier color_mineshaft">
                            Change the verse image:</p>
                        <asp:Label ID="lblConfirm2" runat="server" Visible="false" Text="Image Saved" CssClass="color_green font_courier bolded"></asp:Label>
                        <br />
                        <telerik:RadAsyncUpload ID="rauImage2" AllowedFileExtensions="jpeg,jpg,gif,png,bmp"
                            runat="server" MultipleFileSelection="Disabled" OnFileUploaded="RadAsyncUpload2_FileUploaded">
                        </telerik:RadAsyncUpload>
                        <asp:linkbutton ID="btnSubmit2" runat="server" CssClass="save-btn back_monza rounded_5 padded_3 color_white" Text="Submit">
                        </asp:linkbutton>
                           <telerik:RadAjaxLoadingPanel ID="LoadingPanel2" runat="server" IsSticky="true">
                        <asp:Image ID="Image2" CssClass="adminloadingpanel" runat="server" ImageUrl="img/ajax-loader.gif">
                        </asp:Image>
                    </telerik:RadAjaxLoadingPanel>
                    </div>
                    <p class="image-itself">
                        <asp:Image ID="imgVerse" runat="server" /></p>
                    <span class="clear-fix-block"></span>
                 
                </div>
            </telerik:RadAjaxPanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
