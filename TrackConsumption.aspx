<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TrackConsumption.aspx.cs" Inherits="TrackConsumption" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Track Consumption</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            padding-top: 30px;
            position: fixed;
            height: 100%;
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

        .content {
            margin-left: 250px;
            padding: 20px;
            width: 100%;
        }

        .content h2 {
            text-align: center;
        }

        .card {
            margin: 20px auto;
            max-width: 500px;
            padding: 20px;
            border-radius: 8px;
            background-color: #ecf0f1;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .card label {
            font-weight: bold;
        }

        .card input {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px;
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

        .result {
            margin-top: 15px;
            color: green;
            font-size: 16px;
        }

        .message {
            color: red;
            font-size: 14px;
        }

        .welcome-label {
            display: block;
            text-align: center;
            font-size: 20px;
            margin-top: 10px;
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
                <h2>Track Units Consumption</h2>
                <div class="card">
                    <label for="txtMeterNo">Meter Number</label>
                    <asp:TextBox ID="txtMeterNo" runat="server" placeholder="Enter Meter Number"></asp:TextBox>

                    <label for="txtLatestReading">Latest Meter Reading</label>
                    <asp:TextBox ID="txtLatestReading" runat="server" placeholder="Enter Latest Meter Reading"></asp:TextBox>

                    <asp:Button ID="btnTrack" runat="server" Text="Track" OnClick="btnTrack_Click" />

                    <div class="result">
                        <asp:Label ID="lblResult" runat="server" CssClass="message" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
