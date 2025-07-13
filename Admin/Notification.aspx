<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Notification.aspx.cs" Inherits="Admin_Notification" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Manage Notifications</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        .dashboard-container {
            display: flex;
            height: 100vh;
        }
        .sidebar {
            width: 250px;
            background-color: #343a40;
            color: white;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            margin: 10px 0;
        }
        .sidebar ul li a {
            color: white;
            text-decoration: none;
            padding: 10px;
            display: block;
            border-radius: 4px;
        }
        .sidebar ul li a:hover {
            background-color: #495057;
        }
        .main-content {
            flex: 1;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }
        table, th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #343a40;
            color: white;
        }
        .btn {
            padding: 8px 12px;
            border: none;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border-radius: 4px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .delete-btn {
            background-color: red;
        }
        .delete-btn:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="sidebar">
                <h2>Admin Panel</h2>
                <ul>
                    <li><a href="Dashboard.aspx">Dashboard</a></li>
                    <li><a href="Notification.aspx">Manage Notifications</a></li>
                    <li><a href="ManageUsers.aspx">Manage Users</a></li>
                    <li><a href="ManageComplaints.aspx">Manage Complaints</a></li>
                    <li><a href="Notification.aspx">Update Notifications</a></li>
                    <li><asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" CssClass="logout-link">Logout</asp:LinkButton></li>
                </ul>
            </div>

            <div class="main-content">
                <h2>Manage Notifications</h2>
                
                <div>
                    <label>Notification:</label>
                    <asp:TextBox ID="txtNotification" runat="server" Width="300px"></asp:TextBox>
                    <asp:Button ID="btnAddNotification" runat="server" Text="Add Notification" CssClass="btn" OnClick="btnAddNotification_Click" />
                </div>

                <asp:GridView ID="gvNotifications" runat="server" AutoGenerateColumns="False" Width="100%" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="NotificationNo" HeaderText="Notification No" />
                        <asp:BoundField DataField="NotificationText" HeaderText="Notification" />
                        <asp:BoundField DataField="PublishDate" HeaderText="Publish Date" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="delete-btn" CommandArgument='<%# Eval("NotificationNo") %>' OnClick="btnDeleteNotification_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
