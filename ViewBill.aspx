<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewBill.aspx.cs" Inherits="ViewBill" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>View Bill</title>
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
            margin-bottom: 20px;
        }

        /* Card for bill details */
        .card {
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            background-color: #ecf0f1;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 1000px;
        }

        .bill-info {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
            font-size: 16px;
        }

        .bill-info span {
            margin-left: 20px;
        }

        .card table {
            width: 100%;
            border-collapse: collapse;
        }

        .card table, .card th, .card td {
            border: 1px solid #ddd;
        }

        .card th, .card td {
            padding: 10px;
            text-align: center;
        }

        .card th {
            background-color: #2c3e50;
            color: white;
        }

        .card button {
            padding: 5px 10px;
            background-color: #1abc9c;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .card button:hover {
            background-color: #16a085;
        }
        .green-button {
        padding: 5px 10px;
        background-color: #28a745; /* Green color */
        color: white;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }

    .green-button:hover {
        background-color: #218838; /* Darker green on hover */
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
                <h2>Incomplete Payment Details</h2>

                <!-- MeterNo and Name in the right corner -->
                <div class="bill-info">
                    <span><strong>Meter Number:</strong> <asp:Label ID="lblMeterNo" runat="server" Text=""></asp:Label></span>
                    <span><strong>Name:</strong> <asp:Label ID="lblName" runat="server" Text=""></asp:Label></span>
                </div>

                <div class="card">
                    <asp:GridView ID="gvBillDetails" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                        <Columns>
                            <asp:BoundField DataField="Month" HeaderText="Month" />
                            <asp:BoundField DataField="Units" HeaderText="Units" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount (₹)" DataFormatString="{0:F2}" />
                            <asp:TemplateField HeaderText="Payment">
                                <ItemTemplate>
                                    <asp:Button ID="btnPay" runat="server" Text="Pay Now" CssClass="green-button" CommandArgument='<%# Eval("MeterNo") + "," + Eval("Month") %>' OnCommand="PayNow_Command" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <h2>Payment History</h2>
    <div class="card">
        <asp:GridView ID="gvPaymentHistory" runat="server" AutoGenerateColumns="False" CssClass="gridview">
            <Columns>
                <asp:BoundField DataField="Month" HeaderText="Month" />
                <asp:BoundField DataField="MeterReading" HeaderText="Meter Reading" />
                <asp:BoundField DataField="Units" HeaderText="Units" />
                <asp:BoundField DataField="Amount" HeaderText="Amount (₹)" DataFormatString="{0:F2}" />
                <asp:BoundField DataField="Payment" HeaderText="Payment Status" />
                <asp:BoundField DataField="Date" HeaderText="Payment Date" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
            </Columns>
        </asp:GridView>
    </div>
            </div>
        </div>
    </form>
</body>
</html>
