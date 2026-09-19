<%@ Page Title="" Language="C#" MasterPageFile="~/s1.Master" AutoEventWireup="true" CodeBehind="Edit_Product.aspx.cs" Inherits="WebApplication1.Edit_Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"
        DataKeyNames="Product_ID"
        OnRowEditing="GridView1_RowEditing"
        OnRowCancelingEdit="GridView1_RowCancelingEdit"
        OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="Product_ID" HeaderText="ID" ReadOnly="true" />
            <asp:BoundField DataField="Category_ID" HeaderText="Category ID" ReadOnly="true" />

            <asp:TemplateField HeaderText="Product Name">
                <ItemTemplate><%# Eval("Product_Name") %></ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Product_Name") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Price">
                <ItemTemplate><%# Eval("Product_Price") %></ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPrice" runat="server" Text='<%# Eval("Product_Price") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description">
                <ItemTemplate><%# Eval("Product_Description") %></ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtDescription" runat="server" Text='<%# Eval("Product_Description") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Stock">
                <ItemTemplate><%# Eval("Product_Stock") %></ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtStock" runat="server" Text='<%# Eval("Product_Stock") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Image">
                <ItemTemplate><%# Eval("Product_Image") %></ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="fuImage" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status">
    <ItemTemplate><%# Eval("Product_Status") %></ItemTemplate>
    <EditItemTemplate>
        <asp:TextBox ID="txtStatus" runat="server" Text='<%# Eval("Product_Status") %>'></asp:TextBox>
    </EditItemTemplate>
</asp:TemplateField>

            <asp:CommandField ShowEditButton="true" />
        </Columns>
    </asp:GridView>

    <br />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

</asp:Content>