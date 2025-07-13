using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        // Connection string for SqlConnection
        string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";

        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Modified query to select the name instead of counting
                string query = "SELECT name FROM [user] WHERE username = @username AND password = @password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);

                conn.Open();
                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    // Store the user's name in the session
                    Session["Name"] = result.ToString();
                    Response.Redirect("Dashboard.aspx"); // Redirect to the dashboard
                }
                else
                {
                    lblMessage.Text = "Invalid username or password.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        catch (SqlException ex)
        {
            lblMessage.Text = "Database error: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "An unexpected error occurred: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
