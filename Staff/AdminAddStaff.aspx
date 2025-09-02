<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAddStaff.aspx.cs" Inherits="BlueRiverZoo.AdminAddStaff" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Staff - BLUERZ Zoo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; background: #f4f4f4; }
        header { background: #2e7d32; color: white; padding: 20px; text-align: center; }
        nav { display: flex; justify-content: center; background: #388e3c; padding: 12px; }
        nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
        nav a:hover { color: #ffeb3b; }
        .form-container {
            max-width: 500px; margin: 40px auto; padding: 30px; background: white;
            border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        label { font-weight: bold; display: block; margin-top: 15px; }
        input, select {
            width: 100%; padding: 10px; margin-top: 5px; border: 1px solid #ccc; border-radius: 6px;
        }
        .btn { margin-top: 20px; width: 100%; padding: 12px; background: #2e7d32; color: white; border: none; border-radius: 6px; }
        .btn:hover { background: #1b5e20; }
        .auto-style1 { text-align: center; }
        .auto-style2 {
            border-style: none; border-color: inherit; border-width: medium;
            width: 100%; padding: 12px; background: #2e7d32; color: white; border-radius: 6px;
        }
        .newStyle1, .newStyle2, .newStyle3 {
            font-family: "Courier New", Courier, monospace;
            font-size: small; color: #CC0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header><h1>Add New Staff Member</h1></header>
        <nav class="auto-style1">
            <a href="WillemHomePage.aspx">Home</a>
            <a href="AdminMain.aspx">Dashboard</a>
            <a href="StaffAdmin.aspx">Manage Staff</a>
            <a href="UpdateStaff.aspx">Update Staff</a>
            <a href="RemoveStaff.aspx">Remove Staff</a>
        </nav>
        
        <div class="form-container">
            <label for="txtName">Full Name&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtName" CssClass="newStyle1" ErrorMessage="Please enter a name!"></asp:RequiredFieldValidator>
            </label>
            <asp:TextBox ID="txtName" runat="server" ForeColor="Gray" Width="100%"
                placeholder="Staff's name" OnTextChanged="txtName_TextChanged" />

            <label for="txtSurname">Surname&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtSurname" CssClass="newStyle2" ErrorMessage="Please enter a surname!"></asp:RequiredFieldValidator>
            </label>
            <asp:TextBox ID="txtSurname" runat="server" ForeColor="Gray" Width="100%" placeholder="Staff's surname" />

            <label for="txtEmail">Email&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server"
                    ControlToValidate="txtEmail" CssClass="newStyle2" ErrorMessage="Please enter an email!"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="txtEmail" CssClass="newStyle3" ErrorMessage="Please enter a valid email!"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" ForeColor="Gray" Width="100%" placeholder="Staff's Email" />

            <label for="txtPassword">Password&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtPassword" CssClass="newStyle2" ErrorMessage="Please enter a Password!"></asp:RequiredFieldValidator>
            </label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" ForeColor="Gray" Width="100%" placeholder="Create a password" />

            <label for="ddlRole">Role</label>
            <asp:DropDownList ID="ddlRole" runat="server">
                <asp:ListItem>Keeper</asp:ListItem>
                <asp:ListItem>Veterinarian</asp:ListItem>
                <asp:ListItem>Guide</asp:ListItem>
                <asp:ListItem>Admin</asp:ListItem>
            </asp:DropDownList>

            <asp:Button ID="btnAddStaff" runat="server" CssClass="auto-style2" Text="Add Staff" OnClick="btnAddStaff_Click" />
            <asp:Label ID="lblMessage" runat="server" />
        </div>
    </form>
</body>
</html>

