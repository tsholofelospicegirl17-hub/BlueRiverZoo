<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAnimals.aspx.cs" Inherits="BlueRiverZoo.AdminAnimals" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Animals - BLUERZ Zoo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="icon" type="image/png" href="BRZLogo.png" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; background: #f4f4f4; }
        header { background: #2e7d32; color: white; padding: 20px; text-align: center; }
        nav { display: flex; justify-content: center; background: #388e3c; padding: 12px; }
        nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
        nav a:hover { color: #ffeb3b; }
        .content { max-width: 800px; margin: 40px auto; background: white; padding: 30px; border-radius: 10px; }
        table {
            width: 100%; border-collapse: collapse; margin-top: 20px;
        }
        table, th, td { border: 1px solid #ccc; }
        th, td { padding: 12px; text-align: center; }
        th { background: #388e3c; color: white; }
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header><h1>Animal Records</h1></header>
        <!-- ✅ Updated Home link -->
        <nav class="auto-style1">
            <a href="AdminMainScreen.aspx">Home</a>
            <a href="AdminStaffManagement.aspx">Staff Management</a>
            <a href="AdminBreedingPrograms.aspx">Breeding Programs</a>
            <a href="AdminAlerts.aspx">Alerts</a>
            <a href="MainScreen.aspx">Log Out</a>
        </nav>
        <div class="content">
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            </asp:GridView>
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
