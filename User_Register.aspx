<%@ Page Title="" Language="C#" MasterPageFile="~/s1.Master" AutoEventWireup="true" CodeBehind="User_Register.aspx.cs" Inherits="WebApplication1.User_Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
    <br /><br />

    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    <br /><br />

    <asp:Label ID="lblName" runat="server" Text="Full Name"></asp:Label>
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <br /><br />

    <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
    <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="revAge" runat="server" ControlToValidate="txtAge"
        ValidationExpression="^[0-9]+$" ErrorMessage="Age must be numbers only" ForeColor="Red" Display="Dynamic">
    </asp:RegularExpressionValidator>
    <br /><br />

    <asp:Label ID="lblPhone" runat="server" Text="Phone Number"></asp:Label>
    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone"
        ValidationExpression="^[0-9]+$" ErrorMessage="Phone number must be numbers only" ForeColor="Red" Display="Dynamic">
    </asp:RegularExpressionValidator>
    <br /><br />

    <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
    <br /><br />

    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <br /><br />

    <asp:Label ID="lblPincode" runat="server" Text="Pincode"></asp:Label>
    <asp:TextBox ID="txtPincode" runat="server"></asp:TextBox>
    <asp:RegularExpressionValidator ID="revPincode" runat="server" ControlToValidate="txtPincode"
        ValidationExpression="^[0-9]+$" ErrorMessage="Pincode must be numbers only" ForeColor="Red" Display="Dynamic">
    </asp:RegularExpressionValidator>
    <br /><br />

    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
    <br /><br />

    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

</asp:Content>