using System;

namespace WebApplication1
{
    public partial class Admin_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("pnlNav").Visible = false;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            ConnectionClass conn = new ConnectionClass();

            string insertAdmin = "INSERT INTO Admin_Table VALUES('"+ txtAdminName.Text + "', '" + txtEmail.Text + "')";
            conn.Fn_NonQuery(insertAdmin);

            string getAdminId = "SELECT MAX(Admin_ID) FROM Admin_Table";
            string newAdminId = conn.Fn_Scalar(getAdminId);

            string insertLogin = "INSERT INTO Login_Table VALUES ("+ newAdminId + ", '" + txtUsername.Text + "', '" + txtPassword.Text + "', 'Admin')";
            conn.Fn_NonQuery(insertLogin);

            lblMessage.Text = "Admin registered successfully.";
        }
    }
}