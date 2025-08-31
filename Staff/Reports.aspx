<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="BlueRiverZoo.Reports" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Zoo Reports</title>
    <link rel ="website icon" type ="png" href ="BRZLogo.png" />
    <style>
        body { font-family: Segoe UI, Arial, sans-serif; }
        .wrap { max-width: 1100px; margin: 20px auto; }
        h2 { margin: 24px 0 10px; }
        .card { border: 1px solid #e1e1e1; border-radius: 10px; padding: 16px; margin-bottom: 24px; box-shadow: 0 1px 2px rgba(0,0,0,.04); }
        .toolbar { display: flex; gap: 10px; align-items: end; flex-wrap: wrap; margin-bottom: 12px; }
        .toolbar > div { display: flex; flex-direction: column; }
        .toolbar label { font-size: 12px; color: #555; margin-bottom: 4px; }
        .btn { padding: 6px 12px; border: 1px solid #ccc; background: #f8f8f8; border-radius: 6px; cursor: pointer; }
        .btn.primary { background: #2563eb; color: #fff; border-color: #1e40af; }
        .summary { margin-top: 8px; font-weight: 600; color: #333; }
        .grid { width: 100%; }
    </style>
</head>
<body>
<form id="form1" runat="server">
<div class="wrap">

    
    <div class="card">
        <h2>Animal Summary Report</h2>
        <div class="toolbar">
            <div>
                <label for="txtSpecies">Species (contains)</label>
                <asp:TextBox ID="txtSpecies" runat="server" />
            </div>
            <div>
                <label for="txtHabitat">Habitat (equals)</label>
                <asp:TextBox ID="txtHabitat" runat="server" />
            </div>
            <div>
                <label>&nbsp;</label>
                <asp:Button ID="btnSearchAnimals" runat="server" Text="Search" CssClass="btn primary"
                    OnClick="btnSearchAnimals_Click" />
            </div>
            <div>
                <label>&nbsp;</label>
                <asp:Button ID="btnClearAnimals" runat="server" Text="Clear" CssClass="btn"
                    OnClick="btnClearAnimals_Click" />
            </div>
            <div>
                <label>&nbsp;</label>
                <asp:Button ID="btnExportAnimals" runat="server" Text="Export Excel" CssClass="btn"
                    OnClick="btnExportAnimals_Click" />
            </div>
        </div>

        <asp:GridView ID="gvAnimals" runat="server" CssClass="grid" AutoGenerateColumns="False"
            AllowSorting="True" OnSorting="gvAnimals_Sorting"
            GridLines="None" BorderStyle="Solid" BorderWidth="1px" BorderColor="#eee"
            AlternatingRowStyle-BackColor="#fafafa">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Species" HeaderText="Species" SortExpression="Species" />
                <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="Habitat" HeaderText="Habitat" SortExpression="Habitat" />
                <asp:BoundField DataField="ConservationStatus" HeaderText="Status" SortExpression="ConservationStatus" />
                <asp:BoundField DataField="ArrivalDate" HeaderText="Arrival Date"
                    DataFormatString="{0:yyyy-MM-dd}" SortExpression="ArrivalDate" />
            </Columns>
            <EmptyDataTemplate>No animals found for the selected filters.</EmptyDataTemplate>
        </asp:GridView>
        <asp:Label ID="lblAnimalSummary" runat="server" CssClass="summary" />
    </div>

    
    <div class="card">
        <h2>Feeding Report</h2>
        <div class="toolbar">
            <div>
                <label for="txtFrom">From (date)</label>
                <asp:TextBox ID="txtFrom" runat="server" TextMode="Date" />
            </div>
            <div>
                <label for="txtTo">To (date)</label>
                <asp:TextBox ID="txtTo" runat="server" TextMode="Date" />
            </div>
            <div>
                <label for="txtAnimalSearch">Animal (contains)</label>
                <asp:TextBox ID="txtAnimalSearch" runat="server" />
            </div>
            <div>
                <label>&nbsp;</label>
                <asp:Button ID="btnFilterFeedings" runat="server" Text="Filter" CssClass="btn primary"
                    OnClick="btnFilterFeedings_Click" />
            </div>
            <div>
                <label>&nbsp;</label>
                <asp:Button ID="btnClearFeedings" runat="server" Text="Clear" CssClass="btn"
                    OnClick="btnClearFeedings_Click" />
            </div>
            <div>
                <label>&nbsp;</label>
                <asp:Button ID="btnExportFeedings" runat="server" Text="Export Excel" CssClass="btn"
                    OnClick="btnExportFeedings_Click" />
            </div>
        </div>

        <asp:GridView ID="gvFeedings" runat="server" CssClass="grid" AutoGenerateColumns="False"
            AllowSorting="True" OnSorting="gvFeedings_Sorting"
            GridLines="None" BorderStyle="Solid" BorderWidth="1px" BorderColor="#eee"
            AlternatingRowStyle-BackColor="#fafafa">
            <Columns>
                <asp:BoundField DataField="Animal" HeaderText="Animal" SortExpression="Animal" />
                <asp:BoundField DataField="FeedingTime" HeaderText="Feeding Time"
                    DataFormatString="{0:yyyy-MM-dd HH:mm}" SortExpression="FeedingTime" />
                <asp:BoundField DataField="Keeper" HeaderText="Keeper" SortExpression="Keeper" />
                <asp:BoundField DataField="FoodItems" HeaderText="Food Items" SortExpression="FoodItems" />
            </Columns>
            <EmptyDataTemplate>No feedings found for the selected parameters.</EmptyDataTemplate>
        </asp:GridView>
        <asp:Label ID="lblFeedingSummary" runat="server" CssClass="summary" />
    </div>

</div>
</form>
</body>
</html>
