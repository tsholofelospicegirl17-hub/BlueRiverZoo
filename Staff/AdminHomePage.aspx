<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="BlueRiverZoo.AdminHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Blue River Zoo - Staff Portal</title>
    <link rel ="website icon" type ="png" href ="BRZLogo.png" />
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f5fff5;
            margin: 0;
            padding: 0;
            color: #2a3f27;
        }
        
        .header {
            background-color: #4a8c4a;
            color: white;
            padding: 20px;
            text-align: center;
            border-bottom: 5px solid #2d572c;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .container {
            display: flex;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .animal-gallery {
            flex: 2;
            padding: 15px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin-right: 20px;
        }
        
        .sidebar {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            padding: 15px;
        }
        
        .animal-card {
            border: 1px solid #d4e6d4;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 15px;
            background-color: #f9fff9;
        }
        
        .animal-card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 4px;
        }
        
        .btn-zoo {
            background-color: #4a8c4a;
            color: white;
            border: none;
            padding: 12px 20px;
            text-align: left;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 8px 0;
            cursor: pointer;
            border-radius: 5px;
            width: 100%;
            transition: background-color 0.3s;
            background-size: 40px;
            background-repeat: no-repeat;
            background-position: 10px center;
            padding-left: 60px;
        }
        
        .btn-zoo:hover {
            background-color: #3a7a3a;
        }
        
        .btn-animals {
            background-image: url('https://cdn-icons-png.flaticon.com/512/616/616408.png');
        }
        
        .btn-feeding {
            background-image: url('https://cdn-icons-png.flaticon.com/512/1046/1046857.png');
        }
        
        .btn-reports {
            background-image: url('https://cdn-icons-png.flaticon.com/512/2933/2933245.png');
        }
        
        .btn-back {
            background-image: url('https://cdn-icons-png.flaticon.com/512/271/271220.png');
            padding-left: 60px;
            background-size: 40px;
            background-repeat: no-repeat;
            background-position: 10px center;
        }
        
        .alert-box {
            background-color: #fff3f3;
            border-left: 5px solid #ff6b6b;
            padding: 15px;
            margin-top: 20px;
        }
        
        .comments-box {
            background-color: #f0f7ff;
            border-left: 5px solid #6ba3ff;
            padding: 15px;
            margin-top: 20px;
        }
        
        h2 {
            color: #2d572c;
            border-bottom: 2px solid #d4e6d4;
            padding-bottom: 5px;
        }
        
        .animal-name {
            font-weight: bold;
            color: #2d572c;
            margin: 5px 0;
        }
        
        .animal-species {
            font-style: italic;
            color: #5a7d5a;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1>BLUE RIVER ZOO STAFF PORTAL</h1>
            <p>Animal Care & Management System</p>
        </div>
        
        <div class="container">
            <div class="animal-gallery">
                <h2>Animal Gallery</h2>
                
                <div class="animal-card">
                    <img src="https://images.unsplash.com/photo-1552410260-0fd9b577afa6?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Lion"/>
                    <div class="animal-name">Leo</div>
                    <div class="animal-species">Panthera leo</div>
                    <div>Male, 8 years old. Last health check: 08/10/2023</div>
                </div>
                
                <div class="animal-card">
                    <img src="https://images.unsplash.com/photo-1534188753412-3e26d0d618d6?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Giraffe"/>
                    <div class="animal-name">Stretch</div>
                    <div class="animal-species">Giraffa camelopardalis</div>
                    <div>Female, 12 years old. Next feeding: 2:00 PM</div>
                </div>
                
                <div class="animal-card">
                    <img src="https://images.unsplash.com/photo-1564349683135-4e5d3ddae889?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60" alt="Penguin"/>
                    <div class="animal-name">Waddles</div>
                    <div class="animal-species">Aptenodytes forsteri</div>
                    <div>Male, 5 years old. Currently in breeding program</div>
                </div>
            </div>
            
            <div class="sidebar">
                <h2>Quick Actions</h2>
                <asp:Button ID="btnMaintainAnimal" runat="server" Text="Maintain Animals" CssClass="btn-zoo btn-animals" OnClick="Button1_Click" />
                <asp:Button ID="btnMaintainFeedWelfare" runat="server" Text="Maintain Feeding & Welfare" CssClass="btn-zoo btn-feeding" OnClick="Button2_Click" />
                <asp:Button ID="btnviewReport" runat="server" Text="View Reports" CssClass="btn-zoo btn-reports" OnClick="btnviewReport_Click" />
                
                <asp:Button ID="btnBack" runat="server" Text="⬅ Back to Home" CssClass="btn-zoo btn-back" OnClick="btnBack_Click" />

                <div class="comments-box">
                    <h3>Admin Comments</h3>
                    <p><strong>08/14/2023:</strong> Please complete all feeding logs by end of day.</p>
                    <p><strong>08/12/2023:</strong> Veterinarian visit scheduled for Thursday.</p>
                    <p><strong>08/10/2023:</strong> New enrichment items arrived for primates.</p>
                </div>
                
                <div class="alert-box">
                    <h3>Animal Alerts</h3>
                    <p>⚠️ Lemur exhibit temperature slightly high - check cooling system</p>
                    <p>⚠️ Tiger "Rajah" due for vaccination</p>
                    <p>⚠️ Penguin pool cleaning scheduled for tomorrow AM</p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
