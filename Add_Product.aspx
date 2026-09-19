<%@ Page Title="" Language="C#" MasterPageFile="~/s1.Master" AutoEventWireup="true" CodeBehind="Add_Product.aspx.cs" Inherits="WebApplication1.Add_Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
    <asp:DropDownList ID="ddlCategory" runat="server" DataTextField="Category_Name" DataValueField="Category_ID"></asp:DropDownList>
    <br /><br />

    <asp:Label ID="lblName" runat="server" Text="Product Name"></asp:Label>
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
        ErrorMessage="Product name is required" ForeColor="Red" Display="Dynamic">
    </asp:RequiredFieldValidator>
    <br /><br />

    <asp:Label ID="lblPrice" runat="server" Text="Price"></asp:Label>
    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice"
        ErrorMessage="Price is required" ForeColor="Red" Display="Dynamic">
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revPrice" runat="server" ControlToValidate="txtPrice"
        ValidationExpression="^[0-9]+$" ErrorMessage="Price must be numbers only" ForeColor="Red" Display="Dynamic">
    </asp:RegularExpressionValidator>
    <br /><br />

    <asp:Label ID="lblImage" runat="server" Text="Product Image"></asp:Label>
    <asp:FileUpload ID="fuImage" runat="server" />
    <asp:RequiredFieldValidator ID="rfvImage" runat="server" ControlToValidate="fuImage"
        ErrorMessage="Please choose an image" ForeColor="Red" Display="Dynamic">
    </asp:RequiredFieldValidator>
    <br /><br />

    <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
        ErrorMessage="Description is required" ForeColor="Red" Display="Dynamic">
    </asp:RequiredFieldValidator>
    <br /><br />

    <asp:Label ID="lblStock" runat="server" Text="Stock"></asp:Label>
    <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock"
        ErrorMessage="Stock is required" ForeColor="Red" Display="Dynamic">
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revStock" runat="server" ControlToValidate="txtStock"
        ValidationExpression="^[0-9]+$" ErrorMessage="Stock must be numbers only" ForeColor="Red" Display="Dynamic">
    </asp:RegularExpressionValidator>
    <br /><br />

    <asp:Button ID="btnAdd" runat="server" Text="Add Product" OnClick="btnAdd_Click" />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

</asp:Content>