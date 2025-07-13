using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class RaiseComplaint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Ensure user is logged in
        if (Session["Name"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            lblUsername.Text = "Welcome, " + Session["Name"].ToString();
        }
    }

    protected void SubmitComplaint(object sender, EventArgs e)
    {
        // Collect form data
        string name = txtName.Text.Trim();
        string address = txtAddress.Text.Trim();
        string phone = txtPhone.Text.Trim();
        string email = txtEmail.Text.Trim();
        string category = ddlCategory.SelectedValue;
        string message = txtMessage.Text.Trim();

        // Generate a unique Complaint ID (cid)
        string complaintId = "C" + DateTime.Now.ToString("yyyyMMddHHmmssfff"); // Format: C20250122101530456

        // Current date and time for the "submitted" field
        DateTime submittedDate = DateTime.Now;

        // Database connection string
        string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";

        try
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Insert data including the generated cid and submitted date
                string query = @"
                    INSERT INTO complaints (cid, name, address, emailid, phoneno, category, cmessage, submitted, processing, status) 
                    VALUES (@Cid, @Name, @Address, @Email, @Phone, @Category, @Message, @Submitted, 'Pending', 'Incomplete')";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to prevent SQL injection
                    command.Parameters.AddWithValue("@Cid", complaintId);
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Phone", phone);
                    command.Parameters.AddWithValue("@Category", category);
                    command.Parameters.AddWithValue("@Message", message);
                    command.Parameters.AddWithValue("@Submitted", submittedDate);

                    // Execute the query
                    command.ExecuteNonQuery();

                    // Show the Complaint ID as a dialog box
                    string script = "alert('Complaint submitted successfully! Your Reference Number is: " + complaintId + "');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ComplaintSubmitted", script, true);
                }
            }

            // Clear the form fields after successful submission
            txtName.Text = "";
            txtAddress.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            ddlCategory.SelectedIndex = 0;
            txtMessage.Text = "";
        }
        catch (Exception ex)
        {
            // Handle errors (log them in real applications)
            string script = "alert('An error occurred: " + ex.Message.Replace("'", "\\'") + "');";
            ClientScript.RegisterStartupScript(this.GetType(), "Error", script, true);
        }
    }
}
