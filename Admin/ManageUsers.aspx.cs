using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Admin_ManageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadUsers();
            LoadIncompletePayments();
        }
    }
    private void LoadIncompletePayments()
    {
        string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
        using (SqlConnection conn = new SqlConnection(connString))
        {
            string query = "SELECT * FROM meterdetails WHERE payment = 'incomplete'";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);

            try
            {
                DataTable dt = new DataTable();
                da.Fill(dt); // Filling the DataTable

                gvIncompletePayments.DataSource = dt;
                gvIncompletePayments.DataBind();
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

    private void LoadUsers()
    {
        string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
        using (SqlConnection conn = new SqlConnection(connString))
        {
            string query = "SELECT * FROM [user]"; // Use brackets for reserved keywords
            SqlDataAdapter da = new SqlDataAdapter(query, conn);

            try
            {
                DataTable dt = new DataTable();
                da.Fill(dt); // Filling the DataTable

                gvUsers.DataSource = dt;
                gvUsers.DataBind();
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

    protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvUsers.EditIndex = e.NewEditIndex;
        LoadUsers();
    }

    protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int meterno = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
        string name = ((TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtName")).Text;
        string phno = ((TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtPhno")).Text;
        string address = ((TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtAddress")).Text;
        string city = ((TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtCity")).Text;
        long pincode = Convert.ToInt64(((TextBox)gvUsers.Rows[e.RowIndex].FindControl("txtPincode")).Text);

        string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
        using (SqlConnection conn = new SqlConnection(connString))
        {
           try
           {
              string query = "UPDATE [user] SET name = @name, Phno = @phno, address = @address, city = @city, pincode = @pincode WHERE meterno = @meterno";
              using (SqlCommand cmd = new SqlCommand(query, conn))
              {
                cmd.Parameters.AddWithValue("@name", name ?? string.Empty);
                cmd.Parameters.AddWithValue("@phno", phno ?? string.Empty);
                cmd.Parameters.AddWithValue("@address", address ?? string.Empty);
                cmd.Parameters.AddWithValue("@city", city ?? string.Empty);
                cmd.Parameters.AddWithValue("@pincode", pincode > 0 ? pincode : 0);
                cmd.Parameters.AddWithValue("@meterno", meterno > 0 ? meterno : 0);

               conn.Open();
               cmd.ExecuteNonQuery();
              }
            }
            catch (SqlException ex)
            {
              Response.Write("SQL Error: " + ex.Message);
             }
             catch (Exception ex) 
             {
               Response.Write("Error: " + ex.Message);
             }
           gvUsers.EditIndex = -1;
           LoadUsers();
            }
        }

        
    

    protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvUsers.EditIndex = -1;
        LoadUsers();
    }

    protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int meterno = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

        string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\EBProject.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
        using (SqlConnection conn = new SqlConnection(connString))
        {
            string query = "DELETE FROM user WHERE meterno = @meterno";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@meterno", meterno);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        LoadUsers();
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Redirecting to Index.aspx outside the current folder
        Response.Redirect("../Index.aspx");
    }
}
