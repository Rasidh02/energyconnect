<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GenerateBills.aspx.cs" Inherits="Admin_GenerateBills" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Generate Bills</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .dashboard-container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            background-color: #343a40;
            color: #fff;
            width: 250px;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 10px 0;
        }

        .sidebar ul li a {
            color: #fff;
            text-decoration: none;
            display: block;
            padding: 10px;
            border-radius: 4px;
        }

        .sidebar ul li a:hover {
            background-color: #495057;
        }

        .main-content {
            flex: 1;
            padding: 20px;
        }

        .card {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin: auto;
            max-width: 500px;
        }

        .card h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="sidebar">
                <h2>Admin Dashboard</h2>
                <ul>
                    <li><a href="Dashboard.aspx">Home</a></li>
                    <li><a href="ManageUsers.aspx">Manage Users</a></li>
                    <li><a href="GenerateBills.aspx">Generate Bills</a></li>
                    <li><a href="ManageComplaints.aspx">Manage Complaints</a></li>
                    <li><a href="Notification.aspx">Update Notifications</a></li>
                    <li><asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" CssClass="logout-link">Logout</asp:LinkButton></li>
                </ul>
            </div>
            <div class="main-content">
                <div class="card">
                    <h2>Generate Bills</h2>
                    <div class="form-group">
                        <label for="txtMeterNo">Meter Number:</label>
                        <asp:TextBox ID="txtMeterNo" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ddlMonth">Month:</label>
                        <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control">
                            <asp:ListItem Text="JAN-FEB" Value="JAN-FEB"></asp:ListItem>
                            <asp:ListItem Text="MAR-APR" Value="MAR-APR"></asp:ListItem>
                            <asp:ListItem Text="MAY-JUN" Value="MAY-JUN"></asp:ListItem>
                            <asp:ListItem Text="JUL-AUG" Value="JUL-AUG"></asp:ListItem>
                            <asp:ListItem Text="SEP-OCT" Value="SEP-OCT"></asp:ListItem>
                            <asp:ListItem Text="NOV-DEC" Value="NOV-DEC"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="txtMeterReading">Current Meter Reading:</label>
                        <asp:TextBox ID="txtMeterReading" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnGenerate" runat="server" Text="Generate Bill" OnClick="btnGenerate_Click" CssClass="btn" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
