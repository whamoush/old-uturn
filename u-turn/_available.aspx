<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_available.aspx.vb" Inherits="available" %>

<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc1:loginquery ID="loginquery1" runat="server" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Available Users</span></h2>
            <div id="login" class="font_courier color_mineshaft fonts_1_1">
                <asp:Label ID="lblConfirm" runat="server" Visible="false" CssClass="color_green bolded"></asp:Label>
                <asp:Repeater ID="rpUser" runat="server" DataSourceID="ds_User">
                    <ItemTemplate>
                        <p id="available" class="font_source size-1-4">
                            <span id="available-title" class="back_buttercup color_mineshaft border-box-solved">
                                <asp:Label ID="lblName" runat="server" Text='<%#Eval("name")%>'></asp:Label></span>
                            <asp:LinkButton CommandName="delete" ID="btnDelete" runat="server" class="available-link back_monza border-box-solved">Delete</asp:LinkButton>
                       <span class="clear-fix-block"></span>
                        </p>
                       
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="ds_User" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                    SelectCommand="SELECT [name] FROM [user]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
