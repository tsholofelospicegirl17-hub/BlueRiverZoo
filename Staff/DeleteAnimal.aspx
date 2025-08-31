<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteAnimal.aspx.cs" Inherits="Staff.DeleteAnimal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Animal - Blue River Zoo</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        :root {
            --primary-green: #2e7d32;
            --light-green: #4caf50;
            --lighter-green: #e8f5e9;
            --dark-green: #1b5e20;
            --white: #ffffff;
            --text-dark: #333333;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: linear-gradient(135deg, var(--lighter-green) 0%, var(--white) 100%); min-height:100vh; padding:20px; color:var(--text-dark); }
        .header { text-align:center; margin-bottom:30px; padding:20px 0; }
        .header h1 { color:var(--dark-green); font-size:2.5rem; margin-bottom:10px; font-weight:700; }
        .header p { color:var(--primary-green); font-size:1.1rem; max-width:700px; margin:0 auto; }
        .container { max-width:1200px; margin:0 auto; background:var(--white); border-radius:12px; box-shadow:var(--shadow); overflow:hidden; }
        .grid-container { padding:20px; overflow-x:auto; }
        .gridview { width:100%; border-collapse:collapse; margin:20px 0; font-size:1rem; min-width:600px; }
        .gridview th { background-color:var(--primary-green); color:var(--white); padding:16px 12px; text-align:left; font-weight:600; text-transform:uppercase; letter-spacing:0.5px; }
        .gridview td { padding:14px 12px; border-bottom:1px solid rgba(0,0,0,0.1); vertical-align:middle; }
        .gridview tr:nth-child(even) { background-color:var(--lighter-green); }
        .gridview tr:hover { background-color:rgba(76,175,80,0.1); }
        .command-button { background-color:#f44336; color:white; border:none; padding:8px 16px; border-radius:4px; cursor:pointer; font-weight:500; transition:all 0.3s ease; display:inline-flex; align-items:center; justify-content:center; margin:0 5px; }
        .command-button:hover { background-color:#d32f2f; transform:translateY(-2px); box-shadow:0 2px 8px rgba(0,0,0,0.2); }
        .command-button i { margin-right:6px; }
        .no-records { text-align:center; padding:40px; color:var(--primary-green); font-size:1.2rem; }
        .footer { text-align:center; margin-top:30px; padding:20px; color:var(--primary-green); font-size:0.9rem; }
        .status-message { padding:15px; margin:20px auto; border-radius:4px; text-align:center; font-weight:500; max-width:1200px; }
        .success { background-color:#e8f5e9; color:#2e7d32; border:1px solid #c8e6c9; }
        .error { background-color:#ffebee; color:#c62828; border:1px solid #ffcdd2; }
        @media (max-width:768px) {
            .header h1 { font-size:2rem; }
            .grid-container { padding:10px; }
            .gridview { font-size:0.9rem; }
            .command-button { padding:6px 12px; font-size:0.9rem; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1><i class="fas fa-paw"></i> Blue River Zoo</h1>
            <p>Manage the animals in our care</p>
        </div>
        
        <asp:Panel ID="pnlStatus" runat="server" Visible="false" CssClass="status-message">
            <asp:Literal ID="litStatus" runat="server"></asp:Literal>
        </asp:Panel>
        
        <div class="container">
            <div class="grid-container">
                <asp:GridView ID="GridViewAnimals" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                    DataKeyNames="Id" OnRowDeleting="GridViewAnimals_RowDeleting" 
                    EmptyDataText="No animals found in the database." OnRowDataBound="GridViewAnimals_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" ItemStyle-Width="80px" />
                        <asp:BoundField DataField="Name" HeaderText="Animal Name" ItemStyle-Font-Bold="true" />
                        <asp:BoundField DataField="Species" HeaderText="Species" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="command-button" 
                                    CommandName="Delete" CommandArgument='<%# Eval("Id") %>' 
                                    OnClientClick="return confirm('Are you sure you want to delete this animal record? This action cannot be undone.');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <!-- Back button -->
                <div style="text-align:center; margin-top:20px;">
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="command-button" OnClick="btnBack_Click" />
                </div>
            </div>
        </div>
        
        <div class="footer">
            <p>© 2023 Blue River Zoo Administration System | Protecting Wildlife Since 1995</p>
        </div>
    </form>
</body>
</html>
