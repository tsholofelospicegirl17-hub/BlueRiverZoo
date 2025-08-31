<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffLoginPage.aspx.cs" Inherits="BlueRiverZoo.StaffLoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="background-image: url('tiger.jpg')">
<head runat="server">
    <title>Blue River Zoo Staff Portal</title>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');
        
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
            background-image: url('tiger.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            background-repeat: no-repeat;
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
        
        .login-container {
            width: 420px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            position: relative;
            z-index: 1;
        }
        
        .login-header {
            background: #4CAF50;
            color: white;
            padding: 25px;
            text-align: center;
            font-size: 22px;
            font-weight: 600;
        }
        
        .login-body {
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
            background: #f0f0f0;
            color: #555;
        }
        
        .btn-secondary:hover {
            background: #e0e0e0;
        }
        
        .text-center {
            text-align: center;
        }
        
        .mt-3 {
            margin-top: 16px;
        }
        
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .logo img {
            height: 80px;
        }
        
        .error-message {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 10px;
        }
        
        .forgot-password {
            text-align: right;
            margin-top: 5px;
        }
        
        .forgot-password a {
            color: #4CAF50;
            text-decoration: none;
            font-size: 14px;
        }
        
        .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-header">
                Blue River Zoo Staff Portal
            </div>
            <div class="login-body">
                <div class="logo">
                    <asp:Image ID="Logo" runat="server" ImageUrl="~/BRZLogo.png" />
                </div>
                
                <div class="form-group">
                    <asp:Label ID="Email" runat="server" Text="Email Address" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="EmailTxtbx" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="EmailValidator" runat="server" 
                        ControlToValidate="EmailTxtbx" 
                        ErrorMessage="Please enter a valid email address" 
                        CssClass="error-message"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="Password" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="PasswordTxtbx" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
                    <div class="forgot-password">
                        <asp:Button ID="btnForgetPass" runat="server" OnClick="btnForgetPass_Click" Text="Forgot Password?" CssClass="btn btn-secondary" />
                    </div>
                </div>
                
                <div class="form-group">
                    <asp:Button ID="btnLogIn" runat="server" OnClick="btnLogIn_Click" Text="Sign In" CssClass="btn btn-primary" />
                </div>
                
                <asp:Label ID="Error" runat="server" CssClass="error-message text-center"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>