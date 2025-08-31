<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitorLogin.aspx.cs" Inherits="BlueRiverZoo.VisitorLogin" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="website icon" type="png" href="BRZLogo.png" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body { background:#f0fdf4; font-family:'Poppins',sans-serif; margin:0 }
        .back-btn { position:absolute; top:15px; left:15px }
        .back-btn a { text-decoration:none; font-size:16px; color:#14532d; font-weight:600 }
        .card { background:#fff; width:360px; margin:100px auto; padding:28px; border-radius:14px; box-shadow:0 6px 16px rgba(0,0,0,.2) }
        h2 { text-align:center; color:#14532d }
        label { font-weight:600; margin-top:10px; display:block }
        input { width:100%; padding:10px; border:1px solid #ccc; border-radius:8px; margin-top:6px }
        .btn { width:100%; padding:12px; background:#10b981; color:#fff; border:none; border-radius:10px; font-weight:600; margin-top:14px; cursor:pointer }
        .btn:hover { background:#0f766e }
        .msg { text-align:center; margin-top:10px; font-weight:600 }
        .links { text-align:center; margin-top:12px }
        .links a { color:#2563eb; text-decoration:none; font-weight:600 }
        .links a:hover { text-decoration:underline }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div class="back-btn"><a href="VisitorWelcome.aspx">← Back</a></div>

    <div class="card">
        <h2>Login</h2>
        <label>Email</label>
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Enter email"/>

        <label>Password</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter password"/>

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
        <div class="msg"><asp:Label ID="lblMsg" runat="server" /></div>

        <div class="links">
            <a href="VisitorSignUp.aspx">Sign Up</a> | <a href="VisitorForgotPassword.aspx">Forgot Password?</a>
        </div>
    </div>
</form>
</body>
</html>
