using System;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Edit_Category : System.Web.UI.Page
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
            GridView1.DataSource = conn.fn_table("SELECT * FROM Category_Table");
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
            TextBox txtDescription = (TextBox)GridView1.Rows[i].FindControl("txtDescription");
            FileUpload fuImage = (FileUpload)GridView1.Rows[i].FindControl("fuImage");
            TextBox txtStatus = (TextBox)GridView1.Rows[i].Cells[6].Controls[0];

            ConnectionClass conn = new ConnectionClass();

            string imageClause = "";
            if (fuImage.HasFile)
            {
                string imageName = System.IO.Path.GetFileName(fuImage.FileName);
                fuImage.SaveAs(Server.MapPath("~/photos/" + imageName));
                imageClause = ", Category_Image = '" + imageName + "'";
            }

            string query = "UPDATE Category_Table SET Category_Name = '" + txtName.Text + "'"
                + ", Category_Description = '" + txtDescription.Text + "'"
                + ", Category_Status = " + txtStatus.Text
                + imageClause
                + " WHERE Category_ID = " + id;

            conn.Fn_NonQuery(query);
            GridView1.EditIndex = -1;
            gridbind();
            lblMessage.Text = "Category updated successfully.";
        }
    }
}