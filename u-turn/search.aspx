<%@ Page Title="" Language="VB" MasterPageFile="~/front.master" AutoEventWireup="false"
    CodeFile="search.aspx.vb" Inherits="search" %>

<%@ Register Src="mycurrent.ascx" TagName="current" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <uc2:current ID="current1" runat="server" _menuItem="lbTwo" _menuItemMobile="lbMobileTwo" />
    <div id="content" class="div_auto">
        <div>
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Search Results</span></h2>
            <p class="clear-fix">
            </p>
<div>
<script>
    (function () {
        var cx = '014768036805331790789:tlrug5dnmni';
        var gcse = document.createElement('script');
        gcse.type = 'text/javascript';
        gcse.async = true;
        gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//cse.google.com/cse.js?cx=' + cx;
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(gcse, s);
    })();
</script>
<gcse:searchresults-only></gcse:searchresults-only>
</div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
</asp:Content>
