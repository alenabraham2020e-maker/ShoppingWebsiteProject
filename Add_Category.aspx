<%@ Page Title="" Language="C#" MasterPageFile="~/s1.Master" AutoEventWireup="true" CodeBehind="Add_Category.aspx.cs" Inherits="WebApplication1.Add_Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><asp:Label ID="lblName" runat="server" Text="Category Name"></asp:Label></td>
            <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                    ErrorMessage="Category name is required" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><asp:Label ID="lblImage" runat="server" Text="Category Image"></asp:Label></td>
            <td><asp:FileUpload ID="fuImage" runat="server" /></td>
            <td>
                <asp:RequiredFieldValidator ID="rfvImage" runat="server" ControlToValidate="fuImage"
                    ErrorMessage="Please choose an image" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label></td>
            <td><asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                    ErrorMessage="Description is required" ForeColor="Red" Display="Dynamic">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><asp:Button ID="btnAdd" runat="server" Text="Add Category" OnClick="btnAdd_Click" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
    </table>

</asp:Content>