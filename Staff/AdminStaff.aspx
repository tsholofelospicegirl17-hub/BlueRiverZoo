<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminStaff.aspx.cs" Inherits="BlueRiverZoo.AdminStaff" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Management - BLUERZ Zoo</title>
    <link rel ="website icon" type ="png" href ="BRZLogo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; background: #f4f4f4; }
        header { background: #2e7d32; color: white; padding: 20px; text-align: center; }
        nav { display: flex; justify-content: center; background: #388e3c; padding: 12px; }
        nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
        nav a:hover { color: #ffeb3b; }

        .content { max-width: 900px; margin: 40px auto; background: white; padding: 30px; border-radius: 10px; }
        .actions { text-align: right; margin-bottom: 15px; }
        .btn {
            padding: 10px 16px; background: #2e7d32; color: white; border: none;
            border-radius: 6px; cursor: pointer; font-weight: bold;
        }
        .btn:hover { background: #1b5e20; }
        table {
            width: 100%; border-collapse: collapse; margin-top: 10px;
        }
        table, th, td { border: 1px solid #ccc; }
        th, td { padding: 12px; text-align: center; }
        th { background: #388e3c; color: white; }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            text-align: justify;
        }
        .auto-style3 {
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="auto-style1">
    <form id="form1" runat="server">
        <header>
            <h1>Staff Management</h1>
            <p>View and manage zoo staff members</p>
        </header>
        
        <nav>
            <a href="AdminHomePage.aspx">Home</a>
            <a href="AdminMain.aspx">Dashboard</a>
            <a href="AdminAlerts.aspx">Alerts</a>
            <a href="AdminAnimals.aspx">Animals</a>
            <a href="AdminReports.aspx">Reports</a>
        </nav>

        <div class="content">
            <div class="auto-style3">
                <button type="button" class="btn" onclick="window.location.href='AdminAddStaff.aspx'">
                    <div class="auto-style1">
                        ➕ Add New Staff
                    </div>
                </button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn" onclick="window.location.href='AdminUpdateStaff.aspx'">
                    <div class="auto-style2">
                        ➕ Update Staff Info
                    </div>
                </button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn" onclick="window.location.href='AdminRemoveStaff.aspx'">
                    <div class="auto-style1">
                        ➕ Delete Staff
                    </div>
                </button>
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </div>
        </div>
    </form>
    </div>
</body>
</html>
