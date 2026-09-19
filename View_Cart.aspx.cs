using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class View_Cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"server = LAPTOP-AIRBIC8I\SQLEXPRESS02; database = ASP_Project_1; integrated security = true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCart();
            }
        }
        void BindCart()
        {
            int userId = Convert.ToInt32(Session["User_ID"]);

            string query = @"SELECT Cart_Table.Cart_ID, Product_Table.Product_Name, 
                      Product_Table.Product_Image, Cart_Table.Quantity, Cart_Table.Subtotal 
                      FROM Cart_Table 
                      INNER JOIN Product_Table ON Cart_Table.Product_ID = Product_Table.Product_ID 
                      WHERE Cart_Table.Cart_Status = 1 AND Cart_Table.User_ID = @uid";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@uid", userId);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        protected void DataList1_EditCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = e.Item.ItemIndex;
            BindCart();
        }

        protected void DataList1_CancelCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.EditItemIndex = -1;
            BindCart();
        }
        protected void DataList1_UpdateCommand(object source, DataListCommandEventArgs e)
        {
            int cartId = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);
            TextBox txtQty = (TextBox)e.Item.FindControl("txtQty");
            int qty = Convert.ToInt32(txtQty.Text);

            con.Open();
            SqlCommand cmdGetPid = new SqlCommand("SELECT Product_ID FROM Cart_Table WHERE Cart_ID=@cid", con);
            cmdGetPid.Parameters.AddWithValue("@cid", cartId);
            int productId = Convert.ToInt32(cmdGetPid.ExecuteScalar());
            con.Close();

            con.Open();
            SqlCommand cmdPrice = new SqlCommand("SELECT Product_Price FROM Product_Table WHERE Product_ID=@pid", con);
            cmdPrice.Parameters.AddWithValue("@pid", productId);
            int price = Convert.ToInt32(cmdPrice.ExecuteScalar());
            con.Close();

            int subtotal = price * qty;

            con.Open();
            SqlCommand cmdUpdate = new SqlCommand("UPDATE Cart_Table SET Quantity=@qty, Subtotal=@sub WHERE Cart_ID=@cid", con);
            cmdUpdate.Parameters.AddWithValue("@qty", qty);
            cmdUpdate.Parameters.AddWithValue("@sub", subtotal);
            cmdUpdate.Parameters.AddWithValue("@cid", cartId);
            cmdUpdate.ExecuteNonQuery();
            con.Close();

            DataList1.EditItemIndex = -1;
            BindCart();
        }
        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            int cartId = Convert.ToInt32(DataList1.DataKeys[e.Item.ItemIndex]);

            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM Cart_Table WHERE Cart_ID=@cid", con);
            cmd.Parameters.AddWithValue("@cid", cartId);
            cmd.ExecuteNonQuery();
            con.Close();

            BindCart();
        }
    }
}