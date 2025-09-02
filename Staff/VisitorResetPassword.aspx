<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitorResetPassword.aspx.cs" Inherits="BlueRiverZoo.VisitorResetPassword" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <link rel="website icon" type="png" href="BRZLogo.png" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body 
        {
            background: linear-gradient(135deg, #d1fae5, #a7f3d0);
            font-family: 'Poppins', sans-serif;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .card 
        {
            background: #fff;
            width: 380px;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            text-align: center;
        }

        h2 
        {
            color: #14532d;
            margin-bottom: 20px;
        }

        label 
        {
            font-weight: 600;
            display: block;
            text-align: left;
            margin-top: 12px;
            margin-bottom: 6px;
            color: #374151;
        }

        input, .aspNetDisabled 
        {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-bottom: 12px;
            font-size: 15px;
            box-sizing: border-box;
        }

        .btn 
        {
            width: 100%;
            padding: 12px;
            background: #10b981;
            color: #fff;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 10px;
        }

        .btn:hover 
        {
            background: #059669;
        }

        .msg {
            margin-top: 12px;
            font-weight: 600;
            color: #dc2626;
        }

        .back-link {
            display: block;
            margin-top: 16px;
            color: #2563eb;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.3s;
        }

        .back-link:hover {
            color: #1e40af;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card">
            <h2>Reset Password</h2>

            <label for="txtNewPass">New Password</label>
            <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" placeholder="Enter new password" />
            <asp:RequiredFieldValidator ID="rfvNewPass" runat="server" ControlToValidate="txtNewPass" ErrorMessage="⚠ New password is required" ForeColor="Red" Display="Dynamic" />

            <label for="txtConfirmPass">Confirm Password</label>
            <asp:TextBox ID="txtConfirmPass" runat="server" TextMode="Password" placeholder="Confirm new password" />
            <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ControlToValidate="txtConfirmPass" ErrorMessage="⚠ Confirm password is required" ForeColor="Red" Display="Dynamic" />
            <asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" ErrorMessage="⚠ Passwords do not match" ForeColor="Red" Display="Dynamic" />

            <asp:Button ID="btnChange" runat="server" Text="Change Password" CssClass="btn" OnClick="btnChange_Click" />

            <div class="msg"><asp:Label ID="lblMsg" runat="server" /></div>

            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="VisitorLogin.aspx" Text="Login" CssClass="back-link" Visible="false" />
        </div>
    </form>
</body>
</html>
