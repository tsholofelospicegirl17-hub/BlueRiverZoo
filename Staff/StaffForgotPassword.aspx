<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffForgotPassword.aspx.cs" Inherits="Staff.StaffForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('birds.jpg')">
<head runat="server">
    <title>Password Reset | Blue River Zoo</title>
    <link rel ="website icon" type ="png" href ="BRZLogo.png" />
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css');

        * {
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: url('birds.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 0;
        }

        .reset-container {
            width: 420px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            position: relative;
            z-index: 1;
        }

        .reset-header {
            background: #4CAF50;
            color: white;
            padding: 25px;
            text-align: center;
            font-size: 22px;
            font-weight: 600;
        }

        .reset-body {
            padding: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: #4CAF50;
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
            outline: none;
        }

        .btn {
            display: inline-block;
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }

        .btn-primary {
            background: #4CAF50;
            color: white;
            width: 100%;
        }

        .btn-primary:hover {
            background: #3e8e41;
        }

        .btn-secondary {
            background: #555;
            color: white;
            width: 100%;
        }

        .btn-secondary:hover {
            background: #333;
        }

        .toggle-container {
            text-align: right;
            margin: 10px 0;
        }

        .toggle-btn {
            background: none;
            border: none;
            color: #777;
            cursor: pointer;
            font-size: 14px;
        }

        .toggle-btn:hover {
            color: #4CAF50;
        }

        .message {
            padding: 12px;
            border-radius: 4px;
            margin-bottom: 20px;
            text-align: center;
        }

        .text-center {
            text-align: center;
        }

        .logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .logo img {
            height: 80px;
        }

        .password-requirements {
            font-size: 12px;
            color: #666;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="reset-container">
            <div class="reset-header">
                Password Reset
            </div>
            <div class="reset-body">
                <div class="logo">
                    <asp:Image ID="Logo" runat="server" ImageUrl="~/BRZLogo.png" />
                </div>

                <asp:Label ID="LblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>

                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Email Address" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="form-control" placeholder="Enter your registered email"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="NewPasswordLbl" runat="server" Text="New Password" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="NewPassTxtBx" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter new password"></asp:TextBox>
                    <div class="password-requirements">Must be at least 8 characters with uppercase, lowercase, and numbers</div>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Confirm Password" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="ConfirmPassTxtBx" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm new password"></asp:TextBox>
                </div>

                <div class="toggle-container">
                    <button type="button" class="toggle-btn" onclick="togglePasswords()">
                        <i class="fas fa-eye"></i> Show Passwords
                    </button>
                </div>

                <div class="form-group">
                    <asp:Button ID="ResetBtn" runat="server" OnClick="ResetBtn_Click" Text="Reset Password" CssClass="btn btn-primary" />
                </div>

                <!-- New Back to Login button -->
                <div class="form-group">
                    <asp:Button ID="btnGoToLogin" runat="server" Text="Back to Login" CssClass="btn btn-secondary" OnClick="btnGoToLogin_Click" />
                </div>

            </div>
        </div>

        <script type="text/javascript">
            function togglePasswords() {
                var newPass = document.getElementById('<%= NewPassTxtBx.ClientID %>');
                var confirmPass = document.getElementById('<%= ConfirmPassTxtBx.ClientID %>');
                var toggleBtn = document.querySelector('.toggle-btn i');

                if (newPass.type === "password") {
                    newPass.type = "text";
                    confirmPass.type = "text";
                    toggleBtn.classList.remove('fa-eye');
                    toggleBtn.classList.add('fa-eye-slash');
                    document.querySelector('.toggle-btn').innerHTML = '<i class="fas fa-eye-slash"></i> Hide Passwords';
                } else {
                    newPass.type = "password";
                    confirmPass.type = "password";
                    toggleBtn.classList.remove('fa-eye-slash');
                    toggleBtn.classList.add('fa-eye');
                    document.querySelector('.toggle-btn').innerHTML = '<i class="fas fa-eye"></i> Show Passwords';
                }
            }
        </script>
    </form>
</body>
</html>
