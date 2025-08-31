<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveStaff.aspx.cs" Inherits="Staff.RemoveStaff" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Remove Staff - BLUERZ Zoo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; background: #f4f4f4; }
        header { background: #d32f2f; color: white; padding: 20px; text-align: center; }
        nav { display: flex; justify-content: center; background: #b71c1c; padding: 12px; }
        nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
        nav a:hover { color: #ffeb3b; }
        .content { max-width: 1000px; margin: 40px auto; background: white; padding: 30px; border-radius: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        th, td { border: 1px solid #ccc; padding: 12px; text-align: center; }
        th { background: #d32f2f; color: white; }
        .btn { padding: 8px 12px; background: #d32f2f; color: white; border: none; border-radius: 6px; cursor: pointer; }
        .btn:hover { background: #b71c1c; }
        .auto-style1 { text-align: center; }
        .input-box { padding: 6px; width: 200px; }
        .message { font-weight: bold; margin-top: 10px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <header>
            <h1>Remove Staff</h1>
            <p>Type the Email of the staff you want to delete</p>
        </header>

        <!-- Navigation -->
        <nav class="auto-style1">
            <a href="WillemHomePage.aspx">Home</a>
            <a href="StaffAdmin.aspx">Dashboard</a>
            <a href="AddStaff.aspx">Add Staff</a>
            <a href="UpdateStaff.aspx">Update Staff</a>
        </nav>

        <!-- Main Content -->
        <div class="content">
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            <br /><br />
            <asp:Label ID="lblEnterEmail" runat="server" Text="Staff Email:" AssociatedControlID="txtEmail"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box"></asp:TextBox>
            <asp:Button ID="btnDeleteByEmail" runat="server" Text="Delete Staff" CssClass="btn" OnClick="btnDeleteByEmail_Click" />
            <br /><br />

            <!-- Display Staff Table -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"></asp:GridView>
        </div>
    </form>
</body>
</html>
