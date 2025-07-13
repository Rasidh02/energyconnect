using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadUserProfile();
        }
    }

    private void LoadUserProfile()
    {
        // Correct connection string from the configuration file
        string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";

        try
        {
            // Use "Name" session variable instead of "Username"
            string name = Session["Name"] != null ? Session["Name"].ToString() : null;

            if (string.IsNullOrEmpty(name))
            {
                lblMessage.Text = "Session expired. Please log in again.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT name, meterno, Phno, address, city, pincode FROM [user] WHERE name = @Name";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", name);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Populate text fields with user data
                    txtName.Text = reader["name"] != DBNull.Value ? reader["name"].ToString() : "";
                    txtMeterNo.Text = reader["meterno"] != DBNull.Value ? reader["meterno"].ToString() : "";
                    txtPhone.Text = reader["Phno"] != DBNull.Value ? reader["Phno"].ToString() : "";
                    txtAddress.Text = reader["address"] != DBNull.Value ? reader["address"].ToString() : "";
                    txtCity.Text = reader["city"] != DBNull.Value ? reader["city"].ToString() : "";
                    txtPincode.Text = reader["pincode"] != DBNull.Value ? reader["pincode"].ToString() : "";
                }
                else
                {
                    lblMessage.Text = "User not found.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error loading profile: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";

        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Update query using the "Name" session variable
                string query = "UPDATE [user] SET name = @Name, meterno = @MeterNo, Phno = @Phone, address = @Address, city = @City, pincode = @Pincode WHERE name = @CurrentName";
                SqlCommand cmd = new SqlCommand(query, conn);

                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@MeterNo", txtMeterNo.Text);
                cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@Pincode", txtPincode.Text);
                cmd.Parameters.AddWithValue("@CurrentName", Session["Name"]);

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    lblMessage.Text = "Profile updated successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    // Update session "Name" if the name is changed
                    Session["Name"] = txtName.Text;
                }
                else
                {
                    lblMessage.Text = "No changes made or error updating profile.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error updating profile: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
