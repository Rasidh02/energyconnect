<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TrackComplaint.aspx.cs" Inherits="TrackComplaint" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Track Complaint</title>
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

        .sidebar h3 {
            text-align: center;
            margin-bottom: 20px;
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
            margin-bottom: 20px;
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
        .content .form-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .content .form-container button {
            background-color: #1abc9c;
            color: white;
            border: none;
            cursor: pointer;
        }

        .content .form-container button:hover {
            background-color: #16a085;
        }

        .content .complaint-details {
            margin-top: 20px;
            background-color: #f7f7f7;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .content .complaint-details label {
            display: block;
            font-weight: bold;
            margin: 10px 0 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Sidebar -->
            <div class="sidebar">
                <h3>Welcome</h3>
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
                <h2>Track Complaint</h2>
                <div class="form-container">
                    <label for="referenceNumber">Enter Complaint Reference Number</label>
                    <asp:TextBox ID="txtReferenceNumber" runat="server" placeholder="Enter your reference number" />

                    <asp:Button ID="btnTrack" runat="server" Text="Track Complaint" OnClick="TrackComplaintDetails" />

                    <asp:Label ID="errorMessage" runat="server" ForeColor="Red" Visible="false" Text="Please enter a valid reference number." />

                    <!-- Complaint Details Section -->
                    <div class="complaint-details" runat="server" id="complaintDetails" Visible="false">
                        <label for="complaintId">Complaint ID:</label>
                        <asp:Label ID="lblComplaintId" runat="server" />

                        <label for="name">Name:</label>
                        <asp:Label ID="lblName" runat="server" />

                        <label for="address">Address:</label>
                        <asp:Label ID="lblAddress" runat="server" />

                        <label for="email">Email ID:</label>
                        <asp:Label ID="lblEmail" runat="server" />

                        <label for="phone">Phone Number:</label>
                        <asp:Label ID="lblPhone" runat="server" />

                        <label for="category">Category:</label>
                        <asp:Label ID="lblCategory" runat="server" />

                        <label for="message">Complaint Message:</label>
                        <asp:Label ID="lblMessage" runat="server" />

                        <label for="submitted">Submitted On:</label>
                        <asp:Label ID="lblSubmitted" runat="server" />

                        <label for="processing">Processing Status:</label>
                        <asp:Label ID="lblProcessing" runat="server" />

                        <label for="status">Status:</label>
                        <asp:Label ID="lblStatus" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
