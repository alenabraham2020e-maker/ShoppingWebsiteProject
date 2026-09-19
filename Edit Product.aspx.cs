using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebApplication1
{
    public partial class Edit_Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("pnlNav").Visible = false;

            if (!IsPostBack)
            {
                gridbind();
            }
        }
        public void gridbind()
        {
            ConnectionClass conn = new ConnectionClass();
            GridView1.DataSource = conn.fn_table("SELECT * FROM Product_Table");
            GridView1.DataBind();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            gridbind();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            gridbind();
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int id = Convert.ToInt32(GridView1.DataKeys[i].Value);
            TextBox txtName = (TextBox)GridView1.Rows[i].FindControl("txtName");
            TextBox txtPrice = (TextBox)GridView1.Rows[i].FindControl("txtPrice");
            TextBox txtDescription = (TextBox)GridView1.Rows[i].FindControl("txtDescription");
            TextBox txtStock = (TextBox)GridView1.Rows[i].FindControl("txtStock");
            FileUpload fuImage = (FileUpload)GridView1.Rows[i].FindControl("fuImage");
            TextBox txtStatus = (TextBox)GridView1.Rows[i].FindControl("txtStatus");
            ConnectionClass conn = new ConnectionClass();
            string imageClause = "";
            if (fuImage.HasFile)
            {
                string imageName = System.IO.Path.GetFileName(fuImage.FileName);
                fuImage.SaveAs(Server.MapPath("~/photos/" + imageName));
                imageClause = ", Product_Image = '" + imageName + "'";
            }
            string query = "UPDATE Product_Table SET Product_Name = '" + txtName.Text + "', Product_Price = " + txtPrice.Text + ", Product_Description = '" + txtDescription.Text + "'" + ", Product_Stock = " + txtStock.Text + ", Product_Status = " + txtStatus.Text + imageClause + " WHERE Product_ID = " + id; conn.Fn_NonQuery(query);
            GridView1.EditIndex = -1;
            gridbind();
            lblMessage.Text = "Product updated successfully.";
        }
    }
}