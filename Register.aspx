<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
             /* Replace with your image path */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .registration-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            padding: 30px 40px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
            width: 100%;
            max-width: 750px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .form-column {
            flex: 1;
            min-width: 280px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            color: #444;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input:focus {
            border-color: #007bff;
            outline: none;
        }

        .btn {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background-color: #218838;
        }

        .message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

        .login-link {
            text-align: center;
            margin-top: 20px;
        }

        .login-link a {
            color: #007bff;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="registration-container">
            <h2>User Registration</h2>
            <div class="form-row">
                <div class="form-column">
                    <div class="form-group">
                        <label for="txtName">Name</label>
                        <asp:TextBox ID="txtName" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="txtAddress">Address</label>
                        <asp:TextBox ID="txtAddress" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="txtPincode">Pincode</label>
                        <asp:TextBox ID="txtPincode" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="txtUsername">Username</label>
                        <asp:TextBox ID="txtUsername" runat="server" />
                    </div>
                </div>

                <div class="form-column">
                    <div class="form-group">
                        <label for="txtMeterNo">Meter No</label>
                        <asp:TextBox ID="txtMeterNo" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="txtCity">City</label>
                        <asp:TextBox ID="txtCity" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="txtPhone">Phone</label>
                        <asp:TextBox ID="txtPhone" runat="server" />
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                    </div>
                </div>
            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
            <div class="login-link">
                <asp:HyperLink ID="hlLogin" runat="server" NavigateUrl="Login.aspx">Already have an account? Login</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
