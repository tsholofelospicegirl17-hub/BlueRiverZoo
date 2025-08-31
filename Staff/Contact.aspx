<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Staff.Contact" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact & Help Desk - BLUERZ Zoo System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f0f0f0;
        }
        header {
            background-color: #2e7d32;
            color: white;
            padding: 20px;
            text-align: center;
        }
        nav {
            display: flex;
            justify-content: center;
            background-color: #388e3c;
            padding: 12px;
        }
        nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }
        nav a:hover {
            color: #ffeb3b;
        }
        .content {
            text-align: center;
            padding: 40px;
        }
        .help-card {
            background: white;
            padding: 25px;
            margin: 15px auto;
            max-width: 600px;
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.15);
        }
        .help-card h2 {
            color: #2e7d32;
            margin-bottom: 15px;
        }
        .btn {
            display: inline-block;
            margin: 10px;
            padding: 15px 30px;
            border-radius: 6px;
            background-color: #2e7d32;
            color: white;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #1b5e20;
        }
        #lblInfo {
            display: block;
            margin-top: 20px;
            font-size: 18px;
            color: #333;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Help Desk & Contact Information</h1>
        </header>

        <nav>
            <a href="HomePage.aspx">Home</a>
        </nav>

        <div class="content">
            <div class="help-card">
                <h2>Need Assistance?</h2>
                <p>Select one of the following options for help:</p>

                <asp:Button ID="btnGeneral" runat="server" CssClass="btn" Text="General Information" OnClick="btnGeneral_Click" />
                <asp:Button ID="btnTickets" runat="server" CssClass="btn" Text="Ticket Help" OnClick="btnTickets_Click" />
                <asp:Button ID="btnLost" runat="server" CssClass="btn" Text="Lost & Found" OnClick="btnLost_Click" />
                <asp:Button ID="btnEmergency" runat="server" CssClass="btn" Text="Emergency Contact" OnClick="btnEmergency_Click" />

                <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
