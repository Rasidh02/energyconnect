using System;
using System.Data.SqlClient;

public partial class Register : System.Web.UI.Page
{
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        // Use the connection string for SqlConnection
        string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";

        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO [user] (name, meterno, address, city, pincode, Phno, username, password) " +
                               "VALUES (@name, @meterno, @address, @city, @pincode, @phone, @username, @password)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@meterno", txtMeterNo.Text);
                cmd.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@city", txtCity.Text); // Added City parameter
                cmd.Parameters.AddWithValue("@pincode", txtPincode.Text); // Added Pincode parameter
                cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);

                conn.Open();
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    lblMessage.Text = "Registration successful!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Registration failed. Please try again.";
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
