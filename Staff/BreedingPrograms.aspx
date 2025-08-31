<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BreedingPrograms.aspx.cs" Inherits="Staff.BreedingPrograms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Breeding Programs </title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <link rel ="website icon" type ="png" href ="BRZLogo.png" />
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; background: #f4f4f4; }
        header { background: #2e7d32; color: white; padding: 20px; text-align: center; }
        nav { display: flex; justify-content: center; background: #388e3c; padding: 12px; }
        nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
        nav a:hover { color: #ffeb3b; }
        .content { max-width: 1000px; margin: 40px auto; background: white; padding: 30px; border-radius: 10px; }
        h2 { color: #2e7d32; }
        .grid { margin-top: 20px; width:100%; border-collapse: collapse; }
        .grid th { background-color: #2e7d32; color: white; padding: 10px; text-align: left; }
        .grid td { padding: 10px; border-bottom: 1px solid #ddd; }
        .grid tr:hover { background-color: #f1f8e9; }
        .auto-style1 { text-align: center; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <h1>Breeding Programs</h1>
        </header>
        <nav class="auto-style1">
            <a href="HomePage.aspx">Home</a>
            <a href="StaffAdmin.aspx">Staff</a>
            <a href="AnimalsAdmin.aspx">Animals</a>
            <a href="AlertsAdmin.aspx">Alerts</a>
            <a href="ReportsAdmin.aspx">Reports</a>
        </nav>

        <div class="content">
            <h2 class="auto-style1">Animal Breeding Records</h2>

            <div class="auto-style1">
                <asp:GridView ID="gvBreeding" runat="server" AutoGenerateColumns="False" CssClass="grid"
                    DataKeyNames="AnimalID" AllowPaging="true" PageSize="10" AllowSorting="true"
                    AutoGenerateEditButton="true"
                    OnRowEditing="gvBreeding_RowEditing"
                    OnRowCancelingEdit="gvBreeding_RowCancelingEdit"
                    OnRowUpdating="gvBreeding_RowUpdating">
                    
                    <Columns>
                        <asp:BoundField DataField="AnimalID" HeaderText="Animal ID" ReadOnly="true" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Species" HeaderText="Species" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" />
                        <asp:CheckBoxField DataField="HasBred" HeaderText="Has Bred" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
