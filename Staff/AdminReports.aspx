<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminReports.aspx.cs" Inherits="BlueRiverZoo.AdminReports" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports - BLUERZ Zoo</title>
    <link rel="icon" type="image/png" href="BRZLogo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; background: #f4f4f4; }
        header { background: #6a1b9a; color: white; padding: 20px; text-align: center; }
        nav { display: flex; justify-content: center; background: #4a148c; padding: 12px; }
        nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
        nav a:hover { color: #ffeb3b; }
        .content { max-width: 900px; margin: 40px auto; background: white; padding: 30px; border-radius: 10px; }
        h2 { color: #6a1b9a; margin-bottom: 20px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 12px; text-align: center; }
        th { background: #6a1b9a; color: white; }
        .auto-style1 { text-align: center; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Reports Dashboard</h1>
            <p>View staff and zoo performance reports</p>
        </header>

        <!-- Combined navigation: first one kept as base, but added useful links from second -->
        <nav class="auto-style1">
            <a href="AdminMainScreen.aspx">Home</a>
            <a href="AdminMainScreen.aspx">Dashboard</a>
            <a href="AdminStaffManagement.aspx">Staff Management</a>
            <a href="AdminAlerts.aspx">Alerts</a>
            <a href="AdminAnimals.aspx">Animals</a>
            <a href="MainScreen.aspx">Log Out</a>
        </nav>

        <div class="content">
            <h2>Staff Report</h2>
            <asp:GridView ID="gvStaffReport" runat="server" AutoGenerateColumns="True"></asp:GridView>
            <div> 
            <asp:Label ID="Label1" runat="server" Text="Reports of the Animals that has been recently added or updated"></asp:Label>
                </div>
            <h2>Zoo Statistics</h2>
            <asp:GridView ID="gvZooReport" runat="server" AutoGenerateColumns="True"></asp:GridView>
        </div>
    </form>
</body>
</html>
