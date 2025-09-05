<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminBreedingPrograms.aspx.cs" Inherits="BlueRiverZoo.AdminBreedingPrograms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Breeding Programs - BLUERZ Zoo</title>
    <link rel="icon" type="image/png" href="BRZLogo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <style>
        body { font-family: 'Segoe UI', Arial, sans-serif; margin: 0; background: #f4f4f4; }
        header { background: #2e7d32; color: white; padding: 20px; text-align: center; }
        nav { display: flex; justify-content: center; background: #388e3c; padding: 12px; }
        nav a { color: white; text-decoration: none; margin: 0 15px; font-weight: bold; }
        nav a:hover { color: #ffeb3b; }
        .content { max-width: 1000px; margin: 40px auto; background: white; padding: 30px; border-radius: 10px; }
        h2 { color: #2e7d32; }
        .grid { margin-top: 20px; width:100%; border-collapse: collapse; }
        /* Column headers */
        .grid th {
            background-color: #2e7d32;
            color: white !important; /* ensure text is white */
            padding: 10px;
            text-align: left;
        }
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
            <a href="AdminMainScreen.aspx">Home</a>
            <a href="AdminAnimals.aspx">Animals</a>
        </nav>

        <div class="content">
            <h2 class="auto-style1">Animal Breeding Records</h2>
            <div class="auto-style1">
                <p>Select a column header to sort the table</p>
                <asp:GridView ID="gvBreeding" runat="server" 
                    AutoGenerateColumns="False" CssClass="grid"
                    DataKeyNames="AnimalID" AllowPaging="true" PageSize="10" AllowSorting="true"
                    AutoGenerateEditButton="true"
                    OnRowEditing="gvBreeding_RowEditing"
                    OnRowCancelingEdit="gvBreeding_RowCancelingEdit"
                    OnRowUpdating="gvBreeding_RowUpdating"
                    OnPageIndexChanging="gvBreeding_PageIndexChanging"
                    OnSorting="gvBreeding_Sorting">
                    
                    <Columns>
                        <asp:BoundField DataField="AnimalID" HeaderText="Animal ID" ReadOnly="true" SortExpression="AnimalID" />
                        
                        <asp:TemplateField HeaderText="Name" SortExpression="Name">
                            <ItemTemplate>
                                <%# Eval("Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("Name") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Species" SortExpression="Species">
                            <ItemTemplate>
                                <%# Eval("Species") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSpecies" runat="server" Text='<%# Bind("Species") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                            <ItemTemplate>
                                <%# Eval("Gender") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtGender" runat="server" Text='<%# Bind("Gender") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Has Bred" SortExpression="HasBred">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkHasBredView" runat="server" Checked='<%# Eval("HasBred") %>' Enabled="false" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="chkHasBred" runat="server" Checked='<%# Bind("HasBred") %>' />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
