<%@ Page Title="" Language="C#" MasterPageFile="~/s1.Master" AutoEventWireup="true" CodeBehind="Edit_Category.aspx.cs" Inherits="WebApplication1.Edit_Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
        DataKeyNames="Category_ID"
        OnRowEditing="GridView1_RowEditing"
        OnRowCancelingEdit="GridView1_RowCancelingEdit"
        OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="Category_ID" HeaderText="ID" ReadOnly="true" />

            <asp:TemplateField HeaderText="Category Name">
                <ItemTemplate><%# Eval("Category_Name") %></ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Category_Name") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Description">
                <ItemTemplate><%# Eval("Category_Description") %></ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtDescription" runat="server" Text='<%# Eval("Category_Description") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Image">
                <ItemTemplate><%# Eval("Category_Image") %></ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="fuImage" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="true" />
            <asp:BoundField />
            <asp:BoundField DataField="Category_Status" HeaderText="Availability(yes=1,not=0)" />
        </Columns>
    </asp:GridView>

    <br />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

</asp:Content>