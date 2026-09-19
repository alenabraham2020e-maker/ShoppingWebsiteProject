using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebApplication1
{
    public partial class User_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.FindControl("pnlNav").Visible = false;
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            ConnectionClass conn = new ConnectionClass();
            string insertUser = "INSERT INTO User_Table VALUES ('"+ txtName.Text + "', " + txtAge.Text + ", " + txtPhone.Text + ", '" + txtAddress.Text + "', '" + txtEmail.Text + "', " + txtPincode.Text + ", 1)";
            conn.Fn_NonQuery(insertUser);
            string getUserId = "SELECT MAX(User_ID) FROM User_Table";
            string newUserId = conn.Fn_Scalar(getUserId);
            string insertLogin = "INSERT INTO Login_Table VALUES ("+ newUserId + ", '" + txtUsername.Text + "', '" + txtPassword.Text + "', 'User')";
            conn.Fn_NonQuery(insertLogin);
            lblMessage.Text = "Registration successful.";
        }
    }
}