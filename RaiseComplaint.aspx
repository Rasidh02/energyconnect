<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RaiseComplaint.aspx.cs" Inherits="RaiseComplaint" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Raise Complaint</title>
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

        .content .form-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border-radius: 8px;
            background-color: #ecf0f1;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .content .form-container label {
            display: block;
            margin: 10px 0 5px;
        }

        .content .form-container input,
        .content .form-container select,
        .content .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .content .form-container textarea {
            resize: vertical;
        }

        .content .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #1abc9c;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .content .form-container button:hover {
            background-color: #16a085;
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
                <h2>Raise a Complaint</h2>
                <div class="form-container">
                    <label for="name">Name</label>
                    <asp:TextBox ID="txtName" runat="server" placeholder="Enter your name" />

                    <label for="address">Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter your address" TextMode="MultiLine" />

                    <label for="phone">Phone Number</label>
                    <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter your phone number" />

                    <label for="email">Email ID</label>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" />

                    <label for="category">Category</label>
                    <asp:DropDownList ID="ddlCategory" runat="server">
                        <asp:ListItem Text="Billing Issues" Value="Billing Issues" />
                        <asp:ListItem Text="Payment Issues" Value="Payment Issues" />
                        <asp:ListItem Text="Power Supply Issues" Value="Power Supply Issues" />
                        <asp:ListItem Text="Meter-Related Complaints" Value="Meter-Related Complaints" />
                        <asp:ListItem Text="Connection Issues" Value="Connection Issues" />
                        <asp:ListItem Text="Safety Concerns" Value="Safety Concerns" />
                        <asp:ListItem Text="Service Requests" Value="Service Requests" />
                        <asp:ListItem Text="Maintenance Complaints" Value="Maintenance Complaints" />
                        <asp:ListItem Text="Theft and Fraud" Value="Theft and Fraud" />
                        <asp:ListItem Text="Customer Service Issues" Value="Customer Service Issues" />
                        <asp:ListItem Text="Others" Value="Others" />
                    </asp:DropDownList>

                    <label for="complaintMessage">Complaint Message</label>
                    <asp:TextBox ID="txtMessage" runat="server" placeholder="Describe your issue" TextMode="MultiLine" Rows="5" />

                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Complaint" OnClick="SubmitComplaint" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
