<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminMainScreen.aspx.cs" Inherits="BlueRiverZoo.AdminMainScreen" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Zoo - Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/png" href="BRZLogo.png" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; background: #f4f4f4; }
        header { background: #2e7d32; color: white; padding: 20px; text-align: center; }
        nav { display: flex; justify-content: center; background: #388e3c; padding: 12px; }
        nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
        nav a:hover { color: #ffeb3b; }
        .dashboard { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; padding: 40px; }
        .card {
            background: white; padding: 20px; border-radius: 10px; 
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); text-align: center;
            transition: transform 0.3s;
        }
        .card:hover { transform: scale(1.05); }
        .card h2 { color: #333; }
        .btn { padding: 12px 20px; background: #2e7d32; color: white; border: none; border-radius: 6px; cursor: pointer; }
        .btn:hover { background: #1b5e20; }
        .auto-style1 { font-weight: bold; color: #FFFFFF; }
        .auto-style2 { text-align: center; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Admin Dashboard</h1>
            <p>Manage zoo operations with ease</p>
        </header>
        <nav class="nav-bar">
    <div class="center">
        <a href="AdminReports.aspx">Reports</a>
    </div>
    <div class="right">
        <a href="MainScreen.aspx">Log Out</a>
    </div>
</nav>


        <div class="dashboard">
            <div class="card">
                <h2>Animals</h2>
                <p>Manage and track animal records.</p>
                <button type="button" class="btn" onclick="window.location.href='AdminAnimals.aspx'">Go</button>
            </div>
            <div class="card">
                <h2>Staff</h2>
                <p>Add or manage zoo staff members.</p>
                <button type="button" class="btn" onclick="window.location.href='AdminStaffManagement.aspx'">Go</button>
            </div>
            <div class="card">
                <h2>Alerts</h2>
                <p>Monitor alerts and notifications.</p>
                <button type="button" class="btn" onclick="window.location.href='AdminAlerts.aspx'">Go</button>
            </div>
        </div>
    </form>
</body>
</html>
