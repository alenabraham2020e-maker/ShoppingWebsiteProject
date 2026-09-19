<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="WebApplication1.ViewProducts" MasterPageFile="~/s1.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5">
        <h2 class="text-center mb-5" style="font-family:'Marcellus',serif;">Our Products</h2>
        <div class="row g-4">
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" CellPadding="10" Width="100%">
                <ItemTemplate>
                    <div class="card h-100 border-0 shadow-sm">
                        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="card-img-top" Style="height:250px;object-fit:cover;" ImageUrl='<%# "~/photos/" + Eval("Product_Image") %>' CommandArgument='<%# Eval("Product_ID") %>' OnClick="ImageButton1_Click" />
                        <div class="card-body text-center">
                            <asp:Label ID="Label1" runat="server" CssClass="d-block fw-bold mb-1" Text='<%# Eval("Product_Name") %>'></asp:Label>
                            <asp:Label ID="Label2" runat="server" CssClass="d-block text-muted mb-2" Text='<%# "₹" + Eval("Product_Price") %>'></asp:Label>
                            <asp:Label ID="Label3" runat="server" CssClass="d-block small" Text='<%# Eval("Product_Description") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>