<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainFeeding.aspx.cs" Inherits="Staff.MaintainFeeding" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Maintain Feeding - Blue River Zoo</title>
    <link rel ="website icon" type ="png" href ="BRZLogo.png" />
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');
        
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        body { background-color: #f8fafc; color: #333; line-height: 1.6; padding: 20px; }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #0e5a2f 0%, #1e8449 100%);
            color: white;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            position: relative;
            overflow: hidden;
            border-radius: 10px 10px 0 0;
            margin-bottom: 20px;
        }

        .zoo-name { font-size: 2.2rem; font-weight: 700; margin-bottom: 5px; color: #e8f4f8; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); }
        .page-title { font-size: 1.5rem; font-weight: 500; letter-spacing: 1px; }

        .menu-container { padding: 30px; text-align: center; }
        .menu-card {
            background: #f9f9f9;
            border-radius: 10px;
            padding: 25px;
            margin: 20px 0;
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            border-left: 4px solid #27ae60;
        }
        .menu-card:hover { transform: translateY(-5px); box-shadow: 0 8px 16px rgba(0,0,0,0.1); }

        .menu-label { font-weight: 600; color: #2c3e50; font-size: 1.1rem; display: block; margin-bottom: 15px; }
        .menu-description { color: #7f8c8d; font-size: 0.9rem; margin-bottom: 20px; }

        .zoo-btn {
            padding: 12px 30px; border: none; border-radius: 50px;
            font-size: 1.1rem; font-weight: 600; cursor: pointer;
            transition: all 0.3s ease; box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-transform: uppercase; letter-spacing: 1px; width: 250px;
        }

        .btn-add { background: linear-gradient(to right, #2ecc71, #27ae60); color: white; }
        .btn-add:hover { background: linear-gradient(to right, #27ae60, #219653); transform: translateY(-2px); box-shadow: 0 6px 12px rgba(39, 174, 96, 0.3); }

        .btn-update { background: linear-gradient(to right, #3498db, #2980b9); color: white; }
        .btn-update:hover { background: linear-gradient(to right, #2980b9, #2471a3); transform: translateY(-2px); box-shadow: 0 6px 12px rgba(41, 128, 185, 0.3); }

        .btn-remove { background: linear-gradient(to right, #e74c3c, #c0392b); color: white; }
        .btn-remove:hover { background: linear-gradient(to right, #c0392b, #a93226); transform: translateY(-2px); box-shadow: 0 6px 12px rgba(231, 76, 60, 0.3); }

        .btn-back { background: linear-gradient(to right, #95a5a6, #7f8c8d); color: white; }
        .btn-back:hover { background: linear-gradient(to right, #7f8c8d, #6c7a7b); transform: translateY(-2px); box-shadow: 0 6px 12px rgba(127, 140, 141, 0.3); }

        .footer { text-align: center; margin-top: 30px; padding: 20px; color: #7f8c8d; font-size: 0.9rem; border-top: 1px solid #eee; }

        @media (max-width: 768px) {
            .zoo-btn { width: 100%; padding: 10px 20px; font-size: 1rem; }
            .zoo-name { font-size: 1.8rem; }
            .page-title { font-size: 1.3rem; }
            .menu-card { padding: 15px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1 class="zoo-name">BLUE RIVER ZOO</h1>
                <p class="page-title">Feeding Schedule Management</p>
            </div>
            
            <div class="menu-container">
                <div class="menu-card">
                    <asp:Label ID="AddFeedingLbl" runat="server" Text="Add New Feeding Schedule" CssClass="menu-label"></asp:Label>
                    <p class="menu-description">Create a new feeding schedule for an animal</p>
                    <asp:Button ID="AddFeedingSchedule" runat="server" OnClick="AddFeedingSchedule_Click" Text="Add Feeding" CssClass="zoo-btn btn-add" />
                </div>
                
                <div class="menu-card">
                    <asp:Label ID="Label3" runat="server" Text="Update Existing Schedule" CssClass="menu-label"></asp:Label>
                    <p class="menu-description">Modify an existing animal feeding schedule</p>
                    <asp:Button ID="UpdateFeedingBtn" runat="server" OnClick="UpdateFeedingBtn_Click" Text="Update Schedule" CssClass="zoo-btn btn-update" />
                </div>
                
                <div class="menu-card">
                    <asp:Label ID="Label2" runat="server" Text="Remove Feeding Schedule" CssClass="menu-label"></asp:Label>
                    <p class="menu-description">Delete an animal's feeding schedule</p>
                    <asp:Button ID="RemoveFeeding" runat="server" OnClick="RemoveFeeding_Click" Text="Remove Schedule" CssClass="zoo-btn btn-remove" />
                </div>

                <div class="menu-card">
                    <asp:Label ID="BackLabel" runat="server" Text="Return to Home Page" CssClass="menu-label"></asp:Label>
                    <p class="menu-description">Go back to the main homepage</p>
                    <asp:Button ID="BackBtn" runat="server" OnClick="BackBtn_Click" Text="Back" CssClass="zoo-btn btn-back" CausesValidation="false" />
                </div>
            </div>
            
            <div class="footer">
                <p>© 2023 Blue River Zoo | Animal Management System</p>
            </div>
        </div>
    </form>
</body>
</html>
