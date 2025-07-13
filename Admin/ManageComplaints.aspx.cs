using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ManageComplaints : System.Web.UI.Page
{
    // Connection string (update as needed)
    private string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Load complaints data into the GridView
            LoadComplaints();
        }
    }

    /// <summary>
    /// Load complaints data into the GridView.
    /// </summary>
    private void LoadComplaints()
    {
        using (SqlConnection conn = new SqlConnection(connString))
        {
            string query = "SELECT * FROM Complaints"; // Replace "Complaints" with your actual table name
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();

            da.Fill(dt);

            gvComplaints.DataSource = dt;
            gvComplaints.DataBind();
        }
    }

    /// <summary>
    /// Handle RowCommand event for updating Processing and Status fields.
    /// </summary>
    protected void gvComplaints_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandArgument != null)
        {
            string cid = e.CommandArgument.ToString();
            GridViewRow row = ((Control)e.CommandSource).NamingContainer as GridViewRow;

            if (row != null)
            {
                if (e.CommandName == "UpdateProcessing")
                {
                    DropDownList ddlProcessing = row.FindControl("ddlProcessing") as DropDownList;
                    if (ddlProcessing != null)
                    {
                        UpdateProcessingField(cid, ddlProcessing.SelectedValue);
                    }
                }
                else if (e.CommandName == "UpdateStatus")
                {
                    DropDownList ddlStatus = row.FindControl("ddlStatus") as DropDownList;
                    if (ddlStatus != null)
                    {
                        UpdateStatusField(cid, ddlStatus.SelectedValue);
                    }
                }
            }
        }
    }


    /// <summary>
    /// Update the 'Processing' field for the given complaint ID.
    /// </summary>
    /// <param name="cid">Complaint ID</param>
    /// <param name="processingValue">Selected processing value</param>
    private void UpdateProcessingField(string cid, string processingValue)
    {
        string processingWithDate = processingValue + " - " + DateTime.Now.ToString("yyyy-MM-dd");

        using (SqlConnection conn = new SqlConnection(connString))
        {
            string query = "UPDATE Complaints SET processing = @processing WHERE cid = @cid";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@processing", processingWithDate);
                cmd.Parameters.AddWithValue("@cid", cid);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        LoadComplaints(); // Refresh GridView
    }

    /// <summary>
    /// Update the 'Status' field for the given complaint ID.
    /// </summary>
    /// <param name="cid">Complaint ID</param>
    /// <param name="statusValue">Selected status value</param>
    private void UpdateStatusField(string cid, string statusValue)
    {
        string statusWithDate = statusValue + " - " + DateTime.Now.ToString("yyyy-MM-dd");

        using (SqlConnection conn = new SqlConnection(connString))
        {
            string query = "UPDATE Complaints SET status = @status WHERE cid = @cid";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@status", statusWithDate);
                cmd.Parameters.AddWithValue("@cid", cid);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        LoadComplaints(); // Refresh GridView
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Redirecting to Index.aspx outside the current folder
        Response.Redirect("../Index.aspx");
    }
}
