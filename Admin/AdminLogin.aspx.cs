using System;
using System.Web.UI;

public partial class Admin_AdminLogin : Page
{
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        // Hardcoded credentials
        if (username == "Admin" && password == "Admin@123")
        {
            Session["AdminUser"] = username;  // Store session variable
            Response.Redirect("Dashboard.aspx");  // Redirect to admin dashboard
        }
        else
        {
            lblMessage.Text = "Invalid username or password!";
        }
    }
}
