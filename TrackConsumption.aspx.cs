using System;
using System.Data.SqlClient;

public partial class TrackConsumption : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Name"] != null)
        {
            lblUsername.Text = Session["Name"].ToString();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnTrack_Click(object sender, EventArgs e)
    {
        string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
        string meterNo = txtMeterNo.Text.Trim();

        try
        {
            int latestReading = int.Parse(txtLatestReading.Text);

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT MAX(meterreading) FROM meterdetails WHERE meterno = @MeterNo";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@MeterNo", meterNo);

                conn.Open();
                object result = cmd.ExecuteScalar();

                if (result != DBNull.Value && result != null)
                {
                    int previousReading = Convert.ToInt32(result);
                    int unitsConsumed = latestReading - previousReading;

                    if (unitsConsumed < 0)
                    {
                        lblResult.Text = "Latest reading cannot be less than previous reading.";
                        return;
                    }

                    double amount = CalculateBill(unitsConsumed);

                    lblResult.Text = string.Format("<b>Previous Reading:</b> {0}<br/><b>Latest Reading:</b> {1}<br/><b>Units Consumed:</b> {2}<br/><b>Amount Generated:</b> ₹{3:F2}",
                        previousReading, latestReading, unitsConsumed, amount);
                }
                else
                {
                    lblResult.Text = "No previous readings found for the entered meter number.";
                }
            }
        }
        catch (FormatException)
        {
            lblResult.Text = "Please enter a valid number for the latest reading.";
        }
        catch (Exception ex)
        {
            lblResult.Text = "Error: " + ex.Message;
        }
    }

    private double CalculateBill(int units)
    {
        double amount = 0;
        int n = (units != 0) ? (units - 1) / 100 + 1 : 0;

        switch (n)
        {
            case 0:
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
}
