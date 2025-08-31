<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerSignUp.aspx.cs" Inherits="Staff.CustomerSignUp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>

    <link rel="website icon" type="png" href="BRZLogo.png" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body { background:#f0fdf4; font-family:'Poppins',sans-serif; margin:0 }
        .back-btn { position:absolute; top:15px; left:15px }
        .back-btn a { text-decoration:none; font-size:16px; color:#14532d; font-weight:600 }
        .card { background:#fff; width:400px; margin:80px auto; padding:28px; border-radius:14px; box-shadow:0 6px 16px rgba(0,0,0,.2) }
        h2 { text-align:center; color:#14532d }
        label { font-weight:600; margin-top:10px; display:block }
        input { width:100%; padding:10px; border:1px solid #ccc; border-radius:8px; margin-top:6px }
        .btn { width:100%; padding:12px; background:#3b82f6; color:#fff; border:none; border-radius:10px; font-weight:600; margin-top:14px; cursor:pointer }
        .btn:hover { background:#2563eb }
        .msg { text-align:center; margin-top:10px; font-weight:600 }
        .links { text-align:center; margin-top:12px }
        .links a { color:#2563eb; text-decoration:none; font-weight:600 }
        .links a:hover { text-decoration:underline }
    </style>
</head>
<body>
<form id="form1" runat="server">
    <div class="back-btn"><a href="TshidiHomePage.aspx">← Back</a></div>

    <div class="card">
        <h2>Create Account</h2>
        <label>Name</label>
        <asp:TextBox ID="txtName" runat="server" placeholder="Enter name"/>

        <label>Surname</label>
        <asp:TextBox ID="txtSurname" runat="server" placeholder="Enter surname"/>

        <label>Email</label>
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Enter email"/>

        <label>Phone Number</label>
        <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter phone number"/>

        <label>Password</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter password"/>

        <label>Confirm Password</label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Re-enter password"/>

        <asp:Button ID="btnSignup" runat="server" Text="Sign Up" CssClass="btn" OnClick="btnSignup_Click" />
        <div class="msg"><asp:Label ID="lblMsg" runat="server" /></div>

        <div class="links">
            <a href="CustomerLogin.aspx">Already have an account? Login</a>
        </div>
    </div>
</form>
</body>
</html>
