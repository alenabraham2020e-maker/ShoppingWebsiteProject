using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (rblRole.SelectedValue == "User")
            {
                Response.Redirect("User_Register.aspx");
            }
            else
            {
                Response.Redirect("Admin_Register.aspx");
            }
        }
    }
}