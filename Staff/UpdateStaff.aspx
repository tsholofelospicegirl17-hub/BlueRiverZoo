<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateStaff.aspx.cs" Inherits="Staff.UpdateStaff" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Staff - BLUERZ Zoo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; background: #f4f4f4; }
        header { background: #1976d2; color: white; padding: 20px; text-align: center; }
        nav { display: flex; justify-content: center; background: #1565c0; padding: 12px; }
        nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
        nav a:hover { color: #ffeb3b; }
        .content { max-width: 600px; margin: 40px auto; background: white; padding: 30px; border-radius: 10px; }
        label { display: block; margin-top: 15px; font-weight: bold; }
        .input { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 6px; }
        .btn { margin-top: 20px; padding: 10px 16px; background: #1976d2; color: white; border: none; border-radius: 6px; cursor: pointer; }
        .btn:hover { background: #0d47a1; }
        .auto-style1 { text-align: center; }
        .newStyle1 {
            font-family: "Courier New", Courier, monospace;
            font-size: small;
            color: #CC0000;
        }
        .newStyle2 {
            font-family: "Courier New", Courier, monospace;
            font-size: small;
            color: #CC0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Update Staff Details</h1>
            <p>Select a column and update its value</p>
        </header>
        <nav class="auto-style1">
            <a href="HomePage.aspx">Home</a>
            <a href="AdminMain.aspx">Dashboard</a>
            <a href="StaffAdmin.aspx">Manage Staff</a>
            <a href="AddStaff.aspx">Add Staff</a>
            <a href="RemoveStaff.aspx">Remove Staff</a>
        </nav>

        <div class="content">
            <!-- Dropdown for Column Names -->
            <label for="ddlColumn">Select Field</label>
            <asp:DropDownList ID="ddlColumn" runat="server" CssClass="input">
                <asp:ListItem Value="--Select Column--"></asp:ListItem>
                <asp:ListItem Value="Id"></asp:ListItem>
                <asp:ListItem Value="FullName"></asp:ListItem>
                <asp:ListItem Value="Surname"></asp:ListItem>
                <asp:ListItem Value="Password"></asp:ListItem>
                <asp:ListItem Value="Email"></asp:ListItem>
                <asp:ListItem Value="Role"></asp:ListItem>
            </asp:DropDownList>

            <!-- Old Value -->
            <label for="txtOldValue">Current Entry&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldValue" CssClass="newStyle1" ErrorMessage="Please enter the entry to change"></asp:RequiredFieldValidator>
            </label>
&nbsp;<asp:TextBox ID="txtOldValue" runat="server" CssClass="input"></asp:TextBox>

            <!-- New Value -->
            <label for="txtNewValue">New Entry&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewValue" CssClass="newStyle2" ErrorMessage="Please enter the new entry"></asp:RequiredFieldValidator>
            </label>
&nbsp;<asp:TextBox ID="txtNewValue" runat="server" CssClass="input"></asp:TextBox>

            <!-- Update Button -->
            <asp:Button ID="btnUpdate" runat="server" Text="Update Staff" CssClass="btn" OnClick="btnUpdate_Click" />

            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
        </div>
    </form>
</body>
</html>
