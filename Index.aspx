<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>EnergyConnect - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Header */
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .nav-buttons {
            display: flex;
            gap: 10px;
        }

        .nav-buttons a {
            text-decoration: none;
            padding: 10px 15px;
            background-color: #1abc9c;
            color: white;
            border-radius: 5px;
            font-size: 16px;
        }

        .nav-buttons a:hover {
            background-color: #16a085;
        }

        /* Main content */
        .container {
            width: 90%;  
            max-width: 1200px;
            margin: 50px auto;
            text-align: center;
            padding: 30px;
            background: url('Image/container.png') no-repeat center;
            background-size: cover;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            color: white; /* Improves readability */
        }

        .container h2 {
            font-size: 28px;
        }

        .container p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        /* Features Section */
        .features {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 30px;
        }

        .feature-card {
            flex: 1;
            min-width: 280px;
            max-width: 32%;
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            color: #333; /* Ensures readability */
        }

        .feature-card h3 {
            font-size: 20px;
        }

        .feature-card p {
            font-size: 16px;
        }

        /* Call-to-Action */
        .cta {
            margin-top: 30px;
        }

        .cta a {
            text-decoration: none;
            padding: 12px 24px;
            background-color: #1abc9c;
            color: white;
            border-radius: 5px;
            font-size: 20px;
        }

        .cta a:hover {
            background-color: #16a085;
        }

        /* Responsive Design */
        @media (max-width: 900px) {
            .features {
                flex-direction: column;
                align-items: center;
            }
            
            .feature-card {
                max-width: 90%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <div class="header">
            <h1>EnergyConnect</h1>
            <div class="nav-buttons">
                <a href="Login.aspx">User</a>
                <a href="Admin/AdminLogin.aspx">Admin</a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="container">
            <h2>Welcome to EnergyConnect</h2>
            <p>Effortlessly track your energy usage, manage your bills, and resolve complaints with our user-friendly platform.</p>

            <!-- Features Section -->
            <div class="features">
                <div class="feature-card">
                    <h3>View & Pay Bills</h3>
                    <p>Access your billing details and make quick payments online.</p>
                </div>
                <div class="feature-card">
                    <h3>Monitor Consumption</h3>
                    <p>Track your energy usage in real-time to optimize consumption.</p>
                </div>
                <div class="feature-card">
                    <h3>Raise Complaints</h3>
                    <p>Easily report and track any service-related issues.</p>
                </div>
            </div>

            <!-- Call-to-Action -->
            <div class="cta">
                <a href="Login.aspx">Get Started</a>
            </div>
        </div>
    </form>
</body>
</html>
