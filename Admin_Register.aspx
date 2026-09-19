<%@ Page Title="" Language="C#" MasterPageFile="~/s1.Master" AutoEventWireup="true" CodeBehind="Admin_Register.aspx.cs" Inherits="WebApplication1.Admin_Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername"
        ErrorMessage="Username is required" ForeColor="Red" Display="Dynamic">
    </asp:RequiredFieldValidator>
    <br /><br />

    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
        ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic">
    </asp:RequiredFieldValidator>
    <br /><br />

    <asp:Label ID="lblName" runat="server" Text="Admin Name"></asp:Label>
    <asp:TextBox ID="txtAdminName" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvAdminName" runat="server" ControlToValidate="txtAdminName"
        ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic">
    </asp:RequiredFieldValidator>
    <br /><br />

    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
        ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic">
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic">
    </asp:RegularExpressionValidator>
    <br /><br />

    <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
    <br /><br />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>