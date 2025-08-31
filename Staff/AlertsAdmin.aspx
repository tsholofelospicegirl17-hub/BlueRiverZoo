<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlertsAdmin.aspx.cs" Inherits="Staff.AlertsAdmin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Zoo Alerts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <link rel ="website icon" type ="png" href ="BRZLogo.png" />
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; background: #f4f4f4; }
        header { background: #c62828; color: white; padding: 20px; text-align: center; }
        nav { display: flex; justify-content: center; background: #388e3c; padding: 12px; }
        nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
        nav a:hover { color: #ffeb3b; }
        .alerts { max-width: 700px; margin: 40px auto; background: white; padding: 20px; border-radius: 10px; }
        .alert {
            padding: 15px; margin-bottom: 12px; border-radius: 6px; 
            background: #ffcdd2; border-left: 5px solid #b71c1c; color: #333;
        }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        select, input[type="text"], textarea {
            width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px;
        }
        .auto-style1 { text-align: center; }
        .submit-btn {
            background: #c62828; color: white; border: none; padding: 10px 20px;
            border-radius: 5px; cursor: pointer;
        }
        .submit-btn:hover { background: #b71c1c; }
        .newStyle1 {
            font-family: "Courier New", Courier, monospace;
            font-size: small;
            color: #B71C1C;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header><h1>Zoo Alerts & Notifications</h1></header>

        <nav class="auto-style1">
            <a href="WillemHomePage.aspx">Home</a>
            <a href="AdminMain.aspx">Dashboard</a>
            <a href="AddStaff.aspx">Staff</a>
            <a href="AnimalsAdmin.aspx">Animals</a>
            <a href="ReportsAdmin.aspx">Reports</a>
        </nav>

        <div class="alerts">
            <div class="form-group">
                <label for="ddlAlertType">Alert Type</label>
                <asp:DropDownList ID="ddlAlertType" runat="server">
                    <asp:ListItem Text="Select Type" Value="" />
                    <asp:ListItem Text="Animal Health" Value="Animal Health" />
                    <asp:ListItem Text="Staff Scheduling" Value="Staff Scheduling" />
                    <asp:ListItem Text="Inventory" Value="Inventory" />
                    <asp:ListItem Text="Security" Value="Security" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtDescription">Alert Description&nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription" CssClass="newStyle1" ErrorMessage="Please enter the alert Description!"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" />
            </div>

            <asp:Button ID="btnAddAlert" runat="server" Text="Add Alert" CssClass="submit-btn" OnClick="btnAddAlert_Click" />

            <hr />

            <asp:Repeater ID="rptAlerts" runat="server">
                <ItemTemplate>
                    <div class="alert">
                        ⚠️ <strong><%# Eval("Type") %>:</strong> <%# Eval("Description") %>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
