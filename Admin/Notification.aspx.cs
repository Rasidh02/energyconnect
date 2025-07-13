using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Notification : System.Web.UI.Page
{
    static int notificationCounter = 1;  // Auto-incrementing notification number
    static DataTable notificationsTable = new DataTable();  // In-memory storage

    protected void Page_Load(object sender, EventArgs e)
    {
        // Ensure only admin can access this page
        if (Session["AdminUser"] == null)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        // Initialize columns only once
        if (!IsPostBack)
        {
            if (notificationsTable.Columns.Count == 0)
            {
                notificationsTable.Columns.Add("NotificationNo", typeof(int));
                notificationsTable.Columns.Add("NotificationText", typeof(string));
                notificationsTable.Columns.Add("PublishDate", typeof(string));
            }
            BindGrid();
        }
    }

    protected void btnAddNotification_Click(object sender, EventArgs e)
    {
        if (!string.IsNullOrWhiteSpace(txtNotification.Text))
        {
            DataRow row = notificationsTable.NewRow();
            row["NotificationNo"] = notificationCounter++;
            row["NotificationText"] = txtNotification.Text;
            row["PublishDate"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            notificationsTable.Rows.Add(row);
            txtNotification.Text = "";  // Clear input field
            BindGrid();
        }
    }

    protected void btnDeleteNotification_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int notificationNo = Convert.ToInt32(btn.CommandArgument);

        for (int i = 0; i < notificationsTable.Rows.Count; i++)
        {
            if (Convert.ToInt32(notificationsTable.Rows[i]["NotificationNo"]) == notificationNo)
            {
                notificationsTable.Rows.RemoveAt(i);
                break;
            }
        }
        BindGrid();
    }

    private void BindGrid()
    {
        gvNotifications.DataSource = notificationsTable;
        gvNotifications.DataBind();
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Redirecting to Index.aspx outside the current folder
        Response.Redirect("../Index.aspx");
    }
}
