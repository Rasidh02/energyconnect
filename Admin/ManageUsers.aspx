<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="Admin_ManageUsers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin - Manage Users</title>
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
            <!-- Sidebar -->
            <div class="sidebar">
                <h2>Admin Dashboard</h2>
                <ul>
                    <li><a href="Dashboard.aspx">Home</a></li>
                    <li><a href="ManageUsers.aspx" class="active">Manage Users</a></li>
                    <li><a href="GenerateBills.aspx">Generate Bills</a></li>
                    <li><a href="ManageComplaints.aspx">Manage Complaints</a></li>
                    <li><a href="Notification.aspx">Update Notifications</a></li>
                    <li><asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" CssClass="logout-link">Logout</asp:LinkButton></li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <div class="content">
                <h3>User Details</h3>
    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="meterno"
        CssClass="grid" OnRowEditing="gvUsers_RowEditing" 
        OnRowUpdating="gvUsers_RowUpdating" OnRowCancelingEdit="gvUsers_RowCancelingEdit" 
        OnRowDeleting="gvUsers_RowDeleting">
        <Columns>
            <asp:BoundField DataField="meterno" HeaderText="Meter No" ReadOnly="True" />
            <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPhno" runat="server" Text='<%# Bind("Phno") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPhno" runat="server" Text='<%# Bind("Phno") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
                <EditItemTemplate>
                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="City">
                <EditItemTemplate>
                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pincode">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPincode" runat="server" Text='<%# Bind("pincode") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPincode" runat="server" Text='<%# Bind("pincode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Edit" />
            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Delete" />
        </Columns>
    </asp:GridView>
</div>

<!-- New GridView for displaying incomplete payments -->
<div class="content">
    <h3>Incomplete Payments</h3>
    <asp:GridView ID="gvIncompletePayments" runat="server" AutoGenerateColumns="False" CssClass="grid">
        <Columns>
            <asp:BoundField DataField="meterno" HeaderText="Meter No" />
            <asp:BoundField DataField="month" HeaderText="Month" />
            <asp:BoundField DataField="meterreading" HeaderText="Meter Reading" />
            <asp:BoundField DataField="unit" HeaderText="Unit" />
            <asp:BoundField DataField="amount" HeaderText="Amount" />
            <asp:BoundField DataField="payment" HeaderText="Payment" />
        </Columns>
    </asp:GridView>
</div>
            </div>
        </div>
    </form>
</body>
</html>
