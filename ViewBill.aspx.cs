using System;
using System.Data;
using System.Data.SqlClient;

public partial class ViewBill : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBillDetails();
            LoadPaymentHistory();  
        }
    }

    protected void LoadBillDetails()
    {
        if (Session["Name"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
        string username = Session["Name"].ToString();
        string query = @"
        SELECT u.meterno AS MeterNo, 
               u.name AS Name, 
               m.month AS Month, 
               m.unit AS Units, 
               m.amount AS Amount
        FROM [user] u
        INNER JOIN meterdetails m ON u.meterno = m.meterno
        WHERE u.name = @Name AND m.payment = 'incomplete'";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Name", username);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        // Set MeterNo and Name labels
                        lblMeterNo.Text = dt.Rows[0]["MeterNo"].ToString();
                        lblName.Text = dt.Rows[0]["Name"].ToString();

                        // Bind remaining columns to GridView
                        gvBillDetails.DataSource = dt;
                        gvBillDetails.DataBind();
                    }
                    else
                    {
                        gvBillDetails.DataSource = null;
                        gvBillDetails.DataBind();
                    }
                }
            }
        }
    }


    protected void PayNow_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
    {
        string[] args = e.CommandArgument.ToString().Split(',');
        string meterNo = args[0];
        string month = args[1];

        // Update payment status and date in the database
        string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
        string updateQuery = @"
        UPDATE meterdetails 
        SET payment = 'complete', 
            date = @Date 
        WHERE meterno = @MeterNo 
          AND month = @Month";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(updateQuery, con))
            {
                // Add parameters for MeterNo, Month, and the current date/time
                cmd.Parameters.AddWithValue("@MeterNo", meterNo);
                cmd.Parameters.AddWithValue("@Month", month);
                cmd.Parameters.AddWithValue("@Date", DateTime.Now); // Use the current date and time

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                catch (SqlException ex)
                {
                    // Log or display the error message
                    Response.Write("SQL Error: " + ex.Message);
                }
                catch (Exception ex)
                {
                    // Handle any other errors
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

        // Reload the bill details
        LoadBillDetails();
    }
    protected void LoadPaymentHistory()
    {
        if (Session["Name"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
        string username = Session["Name"].ToString();
        string query = @"
    SELECT m.month AS Month, 
           m.meterreading AS MeterReading, 
           m.unit AS Units, 
           m.amount AS Amount, 
           m.payment AS Payment, 
           m.date AS Date
    FROM [user] u
    INNER JOIN meterdetails m ON u.meterno = m.meterno
    WHERE u.name = @Name AND m.payment = 'complete'
    ORDER BY m.date DESC";

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Name", username);

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    if (dt.Rows.Count > 0)
                    {
                        gvPaymentHistory.DataSource = dt;
                        gvPaymentHistory.DataBind();
                    }
                    else
                    {
                        gvPaymentHistory.DataSource = null;
                        gvPaymentHistory.DataBind();
                    }
                }
            }
        }
    }


}
