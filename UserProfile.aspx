<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Profile</title>
    <style>
        /* Basic styling for the page */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
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

        .sidebar a {
            display: block;
            padding: 15px;
            color: white;
            text-decoration: none;
            margin-bottom: 10px;
            font-size: 18px;
        }

        .sidebar a:hover {
            background-color: #1abc9c;
        }

        /* Main content area */
        .content {
            margin-left: 250px;
            padding: 20px;
            width: 100%;
        }

        .content h2 {
            text-align: center;
        }

        /* Card for the user profile form */
        .card {
            margin: 20px;
            padding: 20px;
            border-radius: 8px;
            background-color: #ecf0f1;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .card input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .card button {
            padding: 10px 20px;
            background-color: #1abc9c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .card button:hover {
            background-color: #16a085;
        }

        .welcome-label {
            display: block;
            text-align: center;
            font-size: 20px;
            margin-top: 10px;
        }

        .message {
            color: red;
            text-align: center;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Sidebar -->
            <div class="sidebar">
                <h3 style="color:white; text-align:center;">Welcome</h3>
                <asp:Label ID="lblUsername" runat="server" Text="User" CssClass="welcome-label" />
                <a href="Dashboard.aspx">Dashboard</a>
                <a href="UserProfile.aspx">Profile</a>
                <a href="ViewBill.aspx">View Bill</a>
                <a href="TrackConsumption.aspx">Track Consumption</a>
                <a href="RaiseComplaint.aspx">Raise Complaint</a>
                <a href="TrackComplaint.aspx">Track Complaint</a>
                <a href="Index.aspx">Logout</a>
            </div>

            <!-- Main Content -->
            <div class="content">
                <h2>User Profile</h2>
                <div class="card">
                    <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
                    <h3>Update Your Profile Information</h3>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Name"></asp:TextBox>
                    <asp:TextBox ID="txtMeterNo" runat="server" placeholder="Meter Number"></asp:TextBox>
                    <asp:TextBox ID="txtPhone" runat="server" placeholder="Phone Number"></asp:TextBox>
                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Address"></asp:TextBox>
                    <asp:TextBox ID="txtCity" runat="server" placeholder="City"></asp:TextBox>
                    <asp:TextBox ID="txtPincode" runat="server" placeholder="Pincode"></asp:TextBox>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" OnClick="btnUpdate_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
