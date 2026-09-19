<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Cart.aspx.cs" Inherits="WebApplication1.View_Cart" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Cart_ID"
                OnEditCommand="DataList1_EditCommand"
                OnCancelCommand="DataList1_CancelCommand"
                OnUpdateCommand="DataList1_UpdateCommand"
                OnDeleteCommand="DataList1_DeleteCommand"
                RepeatColumns="1">
                <ItemTemplate>
                    <table border="1" cellpadding="8">
                    <tr>
                        <td><asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/photos/" + Eval("Product_Image") %>' Width="80" Height="80" /></td>
                        <td><asp:Label ID="lblName" runat="server" Text='<%# Eval("Product_Name") %>' /></td>
                        <td>Qty: <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Quantity") %>' /></td>
                        <td>Subtotal: <asp:Label ID="lblSubtotal" runat="server" Text='<%# Eval("Subtotal") %>' /></td>
                        <td>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" Text="Edit" />
                            &nbsp;
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" Text="Delete"
                                OnClientClick="return confirm('Remove this item from cart?');" />
                        </td>
                    </tr>
                    </table>
                </ItemTemplate>
                <EditItemTemplate>
                    <table border="1" cellpadding="8">
                    <tr>
                        <td><asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/photos/" + Eval("Product_Image") %>' Width="80" Height="80" /></td>
                        <td><asp:Label ID="lblName" runat="server" Text='<%# Eval("Product_Name") %>' /></td>
                        <td>Qty: <asp:TextBox ID="txtQty" runat="server" Text='<%# Eval("Quantity") %>' Columns="3" /></td>
                        <td>Subtotal: <asp:Label ID="lblSubtotal" runat="server" Text='<%# Eval("Subtotal") %>' /></td>
                        <td>
                            <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" Text="Update" />
                            &nbsp;
                            <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                    </table>
                </EditItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>