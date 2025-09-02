<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitorForgotPassword.aspx.cs" Inherits="BlueRiverZoo.VisitorForgotPassword" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
    <link rel="website icon" type="png" href="BRZLogo.png" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body { background:#f0fdf4; font-family:'Poppins',sans-serif; margin:0 }
        .back-btn { position:absolute; top:15px; left:15px }
        .back-btn a { text-decoration:none; font-size:16px; color:#14532d; font-weight:600 }
        .card { background:#fff; width:360px; margin:100px auto; padding:28px; border-radius:14px; box-shadow:0 6px 16px rgba(0,0,0,.2) }
        h2 { text-align:center; color:#14532d; margin-bottom:12px }
        input { width:100%; padding:10px; border:1px solid #ccc; border-radius:8px; margin-top:14px; font-size:15px }
        .btn { width:100%; padding:12px; background:#3b82f6; color:#fff; border:none; border-radius:10px; font-weight:600; margin-top:16px; cursor:pointer }
        .btn:hover { background:#2563eb }
        .msg { text-align:center; margin-top:12px; font-weight:600 }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div class="back-btn"><a href="VisitorLogin.aspx">← Back</a></div>

    <div class="card">
        <h2>Forgot Password</h2>

        <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" />
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
            ControlToValidate="txtEmail"
            ErrorMessage="⚠ Email is required"
            ForeColor="Red" Display="Dynamic" />

        <asp:Button ID="btnSend" runat="server" Text="Send Reset Link" CssClass="btn" OnClick="btnSend_Click" />

        <div class="msg"><asp:Label ID="lblMsg" runat="server" /></div>
    </div>
</form>
</body>
</html>
