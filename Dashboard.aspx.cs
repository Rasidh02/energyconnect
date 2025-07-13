using System;
using System.Web;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if user is logged in by verifying session variable
        if (Session["Name"] == null)
        {
            // Redirect to login page if user is not logged in
            Response.Redirect("Login.aspx");
        }
        else
        {
            // Display username in the sidebar
            lblUsername.Text = "Welcome, " + Session["Name"].ToString();
        }
    }
}
