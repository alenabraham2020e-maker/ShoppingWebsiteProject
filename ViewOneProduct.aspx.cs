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
    public partial class ViewOneProduct : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"server = LAPTOP-AIRBIC8I\SQLEXPRESS02; database = ASP_Project_1; integrated security = true");
        int availableStock = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productId = Session["Product_ID"].ToString();
                string s = "select * from Product_Table where Product_ID = '" + productId + "'";
                SqlDataAdapter da = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    DataRow row = ds.Tables[0].Rows[0];
                    Image1.ImageUrl = "~/photos/" + row["Product_Image"].ToString();
                    Label1.Text = row["Product_Name"].ToString();
                    Label2.Text = row["Product_Description"].ToString();
                    Label3.Text = "₹" + row["Product_Price"].ToString();
                    availableStock = Convert.ToInt32(row["Product_Stock"]);
                    ViewState["Stock"] = availableStock;
                }
            }
            else
            {
                availableStock = Convert.ToInt32(ViewState["Stock"]);
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                Label5.Text = "Please enter quantity";
                Label5.Visible = true;
                return;
            }

            int qty = Convert.ToInt32(TextBox1.Text);
            int stock = Convert.ToInt32(ViewState["Stock"]);

            if (qty > stock)
            {
                Label5.Text = "Only " + stock + " items in stock. Please enter a lower quantity.";
                Label5.Visible = true;
                return;
            }
            int productId = Convert.ToInt32(Session["Product_ID"]);
            int userId = Convert.ToInt32(Session["User_ID"]);

            con.Open();
            SqlCommand cmdPrice = new SqlCommand("SELECT Product_Price FROM Product_Table WHERE Product_ID=@pid", con);
            cmdPrice.Parameters.AddWithValue("@pid", productId);
            int price = Convert.ToInt32(cmdPrice.ExecuteScalar());
            con.Close();

            int subtotal = price * qty;

            con.Open();
            SqlCommand cmdCheck = new SqlCommand("SELECT COUNT(*) FROM Cart_Table WHERE Product_ID=@pid AND User_ID=@uid AND Cart_Status=1", con);
            cmdCheck.Parameters.AddWithValue("@pid", productId);
            cmdCheck.Parameters.AddWithValue("@uid", userId);
            int exists = Convert.ToInt32(cmdCheck.ExecuteScalar());
            con.Close();

            if (exists > 0)
            {
                con.Open();
                SqlCommand cmdUpdate = new SqlCommand("UPDATE Cart_Table SET Quantity=Quantity+@qty, Subtotal=Subtotal+@sub WHERE Product_ID=@pid AND User_ID=@uid AND Cart_Status=1", con);
                cmdUpdate.Parameters.AddWithValue("@qty", qty);
                cmdUpdate.Parameters.AddWithValue("@sub", subtotal);
                cmdUpdate.Parameters.AddWithValue("@pid", productId);
                cmdUpdate.Parameters.AddWithValue("@uid", userId);
                cmdUpdate.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                con.Open();
                SqlCommand cmdInsert = new SqlCommand("INSERT INTO Cart_Table (User_ID, Product_ID, Quantity, Subtotal, Cart_Date, Cart_Status) VALUES (@uid, @pid, @qty, @sub, @cdate, 1)", con);
                cmdInsert.Parameters.AddWithValue("@uid", userId);
                cmdInsert.Parameters.AddWithValue("@pid", productId);
                cmdInsert.Parameters.AddWithValue("@qty", qty);
                cmdInsert.Parameters.AddWithValue("@sub", subtotal);
                cmdInsert.Parameters.AddWithValue("@cdate", DateTime.Now);
                cmdInsert.ExecuteNonQuery();
                con.Close();
            }

            Response.Redirect("View_Cart.aspx");
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(TextBox1.Text);
            if (qty > availableStock)
            {
                Label5.Text = "Only " + availableStock + " items in stock. Please enter a lower quantity.";
                Label5.Visible = true;
            }
            else
            {
                Label5.Visible = false;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_Cart.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_Home.aspx");
        }
    }
}