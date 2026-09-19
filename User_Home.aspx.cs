using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class User_Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"server = LAPTOP-AIRBIC8I\SQLEXPRESS02; database = ASP_Project_1; integrated security = true");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string s = "select * from Category_Table where Category_Status = 1";
                SqlDataAdapter da = new SqlDataAdapter(s, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                dlCategory.DataSource = ds;
                dlCategory.DataBind();
            }
        }

        protected void dlCategory_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "ViewCategory")
            {
                string categoryId = e.CommandArgument.ToString();
                Response.Redirect("Product_List.aspx?catid=" + categoryId);
            }
        }

        protected void dlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            Session["CategoryID"] = e.CommandArgument.ToString();
            Response.Redirect("ViewProducts.aspx");
        }
    }
}