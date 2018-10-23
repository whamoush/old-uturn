<%@ Page Title="" Language="VB" MasterPageFile="~/back.master" AutoEventWireup="false"
    CodeFile="_edit_book.aspx.vb" Inherits="_edit_book" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<%@ Register Src="loginquery.ascx" TagName="loginquery" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="Stylesheet" type="text/css" href="css/SearchBox.BlackMetroTouch.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
   
    <uc1:loginquery ID="loginquery1" runat="server" />
    <div id="content" class="div_auto">
        <div id="content-page-container">
            <h2 class="page-title font_courier color_endeavour bolded fonts_1_8">
                <span>Edit Book</span></h2>
            <p class="clear-fix">
            </p>


            <asp:Repeater ID="rpBooks" runat="server" DataSourceID="Ds_Books">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                    <asp:Label ID="lblCategory" runat="server" Visible="false" Text='<%#Eval("category")%>'></asp:Label>
                    <asp:Label ID="lblImage" runat="server" Visible="false" Text='<%#Eval("image") %>'></asp:Label>
                    <asp:Label ID="lblIsrtl" runat="server" Visible="false" Text='<%#Eval("isrtl") %>'></asp:Label>
                    <ul class="content-items content-items-books font_courier">
                        <li id="book" class="border-box-solved">
                            <img src="img/assets/img/books/<%#Eval("image") %>" alt='<%#Eval("title") %>' width="102px" height="150px"
                                alt="" />
                            <span class="books-details">Title:
                                <asp:TextBox ID="txtTitle" runat="server" CssClass="login-txt rounded_5" Text='<%#Eval("title")%>'></asp:TextBox></span>
                            <span class="books-details">Category:
                                <asp:DropDownList ID="ddlCategory" DataSourceID="ds_Categories" DataTextField="category"
                                    runat="server"  DataValueField="id">
                                </asp:DropDownList>
                            </span><span class="books-details">Image:
                                <asp:FileUpload ID="fuImage" runat="server" CssClass="login-txt rounded_5 margin_10 back_white  " /></span>
                            <asp:RegularExpressionValidator ID="revImage" ControlToValidate="fuImage" runat="server"
                                ValidationExpression="^.*\.(png|PNG|jpg|JPG)$" CssClass="color_monza bolded"
                                Display="Dynamic" Text="Only .png and .jpg allowed"></asp:RegularExpressionValidator>
                            <asp:SqlDataSource ID="ds_Categories" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"
                                SelectCommand="SELECT [ID], [category] FROM [books_categories]  WHERE [dir]='ltr'"></asp:SqlDataSource>
                            <span class="books-details" >featured?&nbsp;
                                <asp:CheckBox ID="featuredChk" runat="server" Checked='<%#Eval("featured") %>' />yes </span>
                            <span class="books-details" >in arabic?&nbsp;
                                <asp:CheckBox ID="arabicChk" runat="server" Checked='<%#Eval("dir") = "rtl" %>' />yes </span>
                        </li>
                        <li class="back_buttercup">
                            <div class="list-description books-info-input padded fonts_1_1">
                                <p>
                                    <span>Author:</span>
                                    <asp:TextBox ID="txtAuthor" runat="server" Text='<%#Eval("author")%>' CssClass="login-txt rounded_5"> </asp:TextBox>
                                </p>
                                <p>
                                    <span>Publisher:</span>
                                    <asp:TextBox ID="txtPublisher" runat="server" Text='<%#Eval("publisher")%>' CssClass="login-txt rounded_5"> </asp:TextBox>
                                </p>
                                <p>
                                    <span>Price:</span>
                                    <asp:TextBox ID="txtPrice" runat="server" Text='<%#Eval("price")%>' CssClass="login-txt rounded_5"> </asp:TextBox><br />
                                </p>
                                <p>
                                    <span>Place above:</span>
                                    <asp:DropDownList ID="ddlPosition" DataSourceID="ds_Position" DataTextField="title"
                                        runat="server">
                                    </asp:DropDownList>
                                </p>
                                <asp:SqlDataSource ID="ds_Position" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"></asp:SqlDataSource>
                            </div>
                        </li>
                        <p class="clear-fix">
                    </ul>
                    <p class="save-btn-container back_monza padded font_courier border-box-solved margin_10">
                        <asp:LinkButton ID="btnSave" CommandName="save" runat="server" Text="Save Changes"
                            CssClass="save-btn back_endeavour rounded_5 padded_3 color_white"></asp:LinkButton>
                        <asp:LinkButton ID="btnUpload" CommandName="upload" runat="server" Text="Upload Image"
                            CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                        <asp:LinkButton ID="btnOrder" CommandName="order" runat="server" Text="Change position"
                            CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                        <asp:LinkButton ID="btnDelete" CommandName="delete" runat="server" Text="Delete"
                            CssClass="save-btn back_mineshaft rounded_5 padded_3 color_white"></asp:LinkButton>
                    </p>
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="ds_Books" runat="server" ConnectionString="<%$ ConnectionStrings:UturnCS %>"></asp:SqlDataSource>



        </div>
    </div>
</asp:Content>
