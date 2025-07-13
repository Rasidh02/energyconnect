<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Dashboard</title>
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

        .content .card {
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            background-color: #ecf0f1;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        /* Image links grid */
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
        <div class="container">
            <!-- Sidebar -->
            <div class="sidebar">
                <h3 style="color:white; text-align:center;">Welcome</h3>
                <asp:Label ID="lblUsername" runat="server" Text="" CssClass="welcome-label" />
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
                <h2>Dashboard</h2>
                <div class="card">
                    <h3>Welcome to your Dashboard</h3>
                   <!-- <p>Here you can view and manage your information, track your consumption, and raise complaints if needed.</p> -->

                    <!-- Image Links Section -->
                    <div class="image-links">
                        <a href="UserProfile.aspx">
                            <img src="Image/Profile.png" alt="Profile" />
                            <p>Profile</p>
                        </a>
                        <a href="ViewBill.aspx">
                            <img src="Image/ViewBill.png" alt="View Bill" />
                            <p>View Bill Details</p>
                        </a>
                        <a href="TrackConsumption.aspx">
                            <img src="Image/TrackUnit.png" alt="Track Consumption" />
                            <p>Track Unit Consumption</p>
                        </a>
                        <a href="RaiseComplaint.aspx">
                            <img src="Image/Complaint.png" alt="Raise Complaint" />
                            <p>Create Complaint</p>
                        </a>
                        <a href="TrackComplaint.aspx">
                            <img src="Image/Check.png" alt="Track Complaint" />
                            <p>Track Complaint Status</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
