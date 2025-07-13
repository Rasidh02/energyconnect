<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Admin_Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Dashboard</title>
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

        /* Sidebar */
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding-top: 30px;
            position: fixed;
            height: 100%;
            top: 0;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a, .logout-link {
            display: block;
            padding: 15px;
            color: white;
            text-decoration: none;
            margin-bottom: 10px;
            font-size: 18px;
            border: none;
            background: none;
            cursor: pointer;
            text-align: left;
            width: 100%;
        }

        .sidebar a:hover, .logout-link:hover {
            background-color: #1abc9c;
        }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: 100%;
        }

        .welcome-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .welcome-card h1 {
            color: #333;
        }

        .welcome-card p {
            font-size: 18px;
            color: #555;
        }

        /* Image links grid (optional for additional functionality) */
        .image-links {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 30px;
            justify-items: center;
        }

        .image-links a {
            text-decoration: none;
            color: black;
            text-align: center;
        }

        .image-links img {
            width: 150px;
            height: 150px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .image-links img:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        .image-links p {
            margin-top: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <!-- Sidebar -->
            <div class="sidebar">
                <h2>Admin Dashboard</h2>
                <a href="Dashboard.aspx">Home</a>
                <a href="ManageUsers.aspx">Manage Users</a>
                <a href="GenerateBills.aspx">Generate Bills</a>
                <a href="ManageComplaints.aspx">Manage Complaints</a>
                <a href="Notification.aspx">Update Notifications</a>
                <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" CssClass="logout-link">Logout</asp:LinkButton>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <div class="welcome-card">
                    <h1>Welcome to the Admin Dashboard</h1>
                    <p>Manage users, generate bills, and resolve complaints efficiently with the tools available in the sidebar.</p>

                    <!-- Image Links Section -->
                    <div class="image-links">
                        <a href="ManageUsers.aspx">
                            <img src="../Image/UserManagement.png" alt="Manage Users" />
                            <p>Manage Users</p>
                        </a>
                        <a href="GenerateBills.aspx">
                            <img src="../Image/GenerateBill.png" alt="Generate Bills" />
                            <p>Generate Bills</p>
                        </a>
                        <a href="ManageComplaints.aspx">
                            <img src="../Image/ComplaintManagement.png" alt="Manage Complaints" />
                            <p>Manage Complaints</p>
                        </a>
                        <a href="Notification.aspx">
                            <img src="../Image/Notification.png" alt="Update Notifications" />
                            <p>Update Notifications</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
