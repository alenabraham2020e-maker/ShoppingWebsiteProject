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
    public partial class ViewProducts : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"server = LAPTOP-AIRBIC8I\SQLEXPRESS02; database = ASP_Project_1; integrated security = true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string categoryId = Session["CategoryID"].ToString();
                string s = "select * from Product_Table where Category_ID = '" + categoryId + "' and Product_Status = 1";
                SqlDataAdapter da = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();
            }
        }
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            Session["Product_ID"] = btn.CommandArgument;
            Response.Redirect("ViewOneProduct.aspx");
        }
    }
}