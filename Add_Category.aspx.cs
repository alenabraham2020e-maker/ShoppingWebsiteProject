using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebApplication1
{
    public partial class Add_Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("pnlNav").Visible = false;
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

            string query = "INSERT INTO Category_Table VALUES ('"+ txtName.Text + "', '" + imageName + "', '" + txtDescription.Text + "', 1)";

            conn.Fn_NonQuery(query);

            lblMessage.Text = "Category added successfully.";
        }
    }
}