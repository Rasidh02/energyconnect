using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_GenerateBills : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Additional initialization logic if needed
        }
    }

    private double CalculateBill(int units)
    {
        double amount = 0;
        int n = (units != 0) ? (units - 1) / 100 + 1 : 0;

        switch (n)
        {
            case 0:
                amount = 0.0;
                break;
            case 1:
                amount = 0.0;
                break;
            case 2:
                amount = (units - 100) * 2.25;
                break;
            case 3:
            case 4:
                amount = 225 + (units - 200) * 4.50;
                break;
            case 5:
                amount = 1125.0 + (units - 400) * 6;
                break;
            case 6:
                amount = 1950.0 + (units - 500) * 8;
                break;
            case 7:
            case 8:
                amount = 2750.0 + (units - 600) * 9;
                break;
            case 9:
            case 10:
                amount = 4550.0 + (units - 800) * 10;
                break;
            default:
                amount = 6550.0 + (units - 1000) * 11;
                break;
        }

        return amount;
    }

    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        string meterNo = txtMeterNo.Text.Trim();
        string month = ddlMonth.SelectedValue;
        int currentReading;

        if (!int.TryParse(txtMeterReading.Text.Trim(), out currentReading) || currentReading < 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter a valid meter reading.');", true);
            return;
        }

        int units = 0;

        try
        {
            // Fetch the highest previous meter reading for the given meter number
            string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT ISNULL(MAX(meterreading), 0) AS HighestReading FROM meterdetails WHERE meterno = @meterno";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@meterno", meterNo);
                    conn.Open();
                    object result = cmd.ExecuteScalar();
                    int highestReading = Convert.ToInt32(result);

                    // Calculate units based on the difference
                    units = currentReading - highestReading;
                    if (units < 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Meter reading cannot be less than the previous reading.');", true);
                        return;
                    }
                }
            }

            // Calculate the bill amount
            double amount = CalculateBill(units);

            // Insert the new meter details into the database
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string insertQuery = "INSERT INTO meterdetails (meterno, month, meterreading, unit, amount, payment) VALUES (@meterno, @month, @reading, @units, @amount, @payment)";
                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@meterno", meterNo);
                    cmd.Parameters.AddWithValue("@month", month);
                    cmd.Parameters.AddWithValue("@reading", currentReading);
                    cmd.Parameters.AddWithValue("@units", units);
                    cmd.Parameters.AddWithValue("@amount", amount);
                    cmd.Parameters.AddWithValue("@payment", "incomplete");

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            // Success message
            ClientScript.RegisterStartupScript(this.GetType(), "alert", string.Format("alert('Bill generated successfully!\\nMeter No: {0}\\nMonth: {1}\\nUnits: {2}\\nAmount: {3:C}');", meterNo, month, units, amount), true);
        }
        catch (Exception ex)
        {
            // Handle any errors
            ClientScript.RegisterStartupScript(this.GetType(), "alert", string.Format("alert('Error: {0}');", ex.Message), true);
        }
        finally
        {
            // Clear input fields
            txtMeterNo.Text = string.Empty;
            txtMeterReading.Text = string.Empty;
        }
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Redirecting to Index.aspx outside the current folder
        Response.Redirect("../Index.aspx");
    }
}
