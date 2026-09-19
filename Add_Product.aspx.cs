using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebApplication1
{
    public partial class Add_Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("pnlNav").Visible = false;

            if (!IsPostBack)
            {
                BindCategoryDropdown();
            }
        }

        private void BindCategoryDropdown()
        {
            ConnectionClass conn = new ConnectionClass();
            ddlCategory.DataSource = conn.fn_table("SELECT Category_ID, Category_Name FROM Category_Table");
            ddlCategory.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ConnectionClass conn = new ConnectionClass();

            string imageName = "";
            if (fuImage.HasFile)
            {
                imageName = Path.GetFileName(fuImage.FileName);
                fuImage.SaveAs(Server.MapPath("~/photos/" + imageName));
            }

            string query = "INSERT INTO Product_Table VALUES ("+ ddlCategory.SelectedValue + ",'" + txtName.Text + "', "+ txtPrice.Text + ", '"+ imageName + "', '"+ txtDescription.Text + "', "+ txtStock.Text + ", 1)";
            conn.Fn_NonQuery(query);
            lblMessage.Text = "Product added successfully.";
        }
    }
}