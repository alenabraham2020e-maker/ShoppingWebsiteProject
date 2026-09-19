using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            ConnectionClass conn = new ConnectionClass();

            string query = "SELECT Reg_ID, Log_Type FROM Login_Table WHERE User_Name = '" + username + "' AND Password = '" + password + "'"; DataTable dt = conn.fn_table(query);

            if (dt.Rows.Count > 0)
            {
                string logType = dt.Rows[0]["Log_Type"].ToString();
                Session["User_ID"] = dt.Rows[0]["Reg_ID"].ToString();
                if (logType == "User")
                {
                    Response.Redirect("User_Home.aspx");
                }
                else if (logType == "Admin")
                {
                    Response.Redirect("Admin_Home.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Invalid credentials.";
            }
        }
    }
}