using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class TrackComplaint : System.Web.UI.Page
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

    // Renamed method to TrackComplaintDetails to avoid conflict
    protected void TrackComplaintDetails(object sender, EventArgs e)
    {
        string referenceNumber = txtReferenceNumber.Text.Trim();

        if (string.IsNullOrEmpty(referenceNumber))
        {
            // Handle case where reference number is empty
            errorMessage.Visible = true;
            return;
        }

        // Database connection string
        string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";

        try
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Query to fetch complaint details by CID (reference number)
                string query = @"
                    SELECT cid, name, address, emailid, phoneno, category, cmessage, submitted, processing, status
                    FROM complaints
                    WHERE cid = @Cid";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Cid", referenceNumber);

                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();

                        // Assign fetched data to labels
                        lblComplaintId.Text = reader["cid"].ToString();
                        lblName.Text = reader["name"].ToString();
                        lblAddress.Text = reader["address"].ToString();
                        lblEmail.Text = reader["emailid"].ToString();
                        lblPhone.Text = reader["phoneno"].ToString();
                        lblCategory.Text = reader["category"].ToString();
                        lblMessage.Text = reader["cmessage"].ToString();
                        lblSubmitted.Text = reader["submitted"].ToString();
                        lblProcessing.Text = reader["processing"].ToString();
                        lblStatus.Text = reader["status"].ToString();

                        // Show the complaint details div
                        complaintDetails.Visible = true;
                        errorMessage.Visible = false;
                    }
                    else
                    {
                        // If no matching complaint is found
                        errorMessage.Visible = true;
                        complaintDetails.Visible = false;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Handle any errors
            errorMessage.Visible = true;
            errorMessage.Text = "Error: " + ex.Message; // Use Text instead of InnerHtml
        }
    }
}
