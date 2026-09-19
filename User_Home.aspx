<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Home.aspx.cs" Inherits="WebApplication1.User_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background-color: #f7f7f5;
            font-family: 'Segoe UI', Georgia, serif;
            margin: 0;
            padding: 40px;
        }

        .auto-style1 {
            width: 100%;
            border-collapse: collapse;
        }

        .category-card {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 1px 4px rgba(0,0,0,0.05);
        }

        .category-card img {
            border-radius: 4px;
        }

        .category-name {
            font-size: 18px;
            font-weight: 600;
            color: #333333;
            margin-top: 10px;
            display: block;
        }

        .category-description {
            font-size: 13px;
            color: #777777;
            margin-top: 4px;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>

        <asp:DataList ID="dlCategory" runat="server" RepeatColumns="3" CellPadding="20" OnSelectedIndexChanged="dlCategory_SelectedIndexChanged">
            <ItemTemplate>
                <div class="category-card">
                   <asp:ImageButton ID="ImageButton1" runat="server" Height="150px" Width="150px"
    ImageUrl='<%# "~/photos/" + Eval("Category_Image") %>'
    CommandName="ViewCategory"
    CommandArgument='<%# Eval("Category_ID") %>'
    OnCommand="ImageButton1_Command" />
                    <span class="category-name"><%# Eval("Category_Name") %></span>
                    <span class="category-description"><%# Eval("Category_Description") %></span>
                </div>
            </ItemTemplate>
        </asp:DataList>

    </form>
</body>
</html>