<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageComplaints.aspx.cs" Inherits="Admin_ManageComplaints" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Admin - Manage Complaints</title>
    <style>
        /* Add CSS from your previous dashboard design */
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
        .content {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .grid {
            width: 100%;
            border-collapse: collapse;
        }
        .grid th, .grid td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .grid th {
            background-color: #4CAF50;
            color: white;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
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
                    <li><a href="ManageComplaints.aspx" class="active">Manage Complaints</a></li>
                    <li><a href="GenerateBills.aspx">Generate Bills</a></li>
                    <li><a href="Notification.aspx">Update Notifications</a></li>
                    <li><asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" CssClass="logout-link">Logout</asp:LinkButton></li>
                </ul>
            </div>

            <div class="main-content">
                <div class="content">
                    <asp:GridView ID="gvComplaints" runat="server" AutoGenerateColumns="False" DataKeyNames="cid" CssClass="grid" 
    OnRowCommand="gvComplaints_RowCommand">
    <Columns>
        <asp:BoundField DataField="cid" HeaderText="Complaint ID" ReadOnly="True" />
        <asp:BoundField DataField="name" HeaderText="Name" ReadOnly="True" />
        <asp:BoundField DataField="category" HeaderText="Category" ReadOnly="True" />
        <asp:BoundField DataField="cmessage" HeaderText="Message" ReadOnly="True" />
        <asp:TemplateField HeaderText="Processing">
            <ItemTemplate>
                <asp:DropDownList ID="ddlProcessing" runat="server">
                    <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                    <asp:ListItem Text="In Progress" Value="In Progress"></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnUpdateProcessing" runat="server" Text="Update" CommandName="UpdateProcessing" CommandArgument='<%# Eval("cid") %>' CssClass="btn" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Status">
            <ItemTemplate>
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem Text="Incomplete" Value="Incomplete"></asp:ListItem>
                    <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnUpdateStatus" runat="server" Text="Update" CommandName="UpdateStatus" CommandArgument='<%# Eval("cid") %>' CssClass="btn" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
