using System;
using System.Web.UI;

public partial class Admin_Dashboard : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Additional initialization logic if needed
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Redirecting to Index.aspx outside the current folder
        Response.Redirect("../Index.aspx");
    }
}
