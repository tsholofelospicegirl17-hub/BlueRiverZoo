<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisitorHome.aspx.cs" Inherits="Staff.VisitorHome" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <link rel ="website icon" type ="png" href ="BRZLogo.png" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
    <style>
        body 
        { 
            margin:0; 
            font-family:'Poppins', sans-serif; 
            background:#f0fdf4; 

        }
        .navbar 
        { 
            background:#14532d; 
            color:white; 
            padding:14px; 
            display:flex; 
            align-items:center; 

        }
        .menu-btn 
        { 
            font-size:24px; 
            cursor:pointer; 
            margin-right:15px; 

        }
        .welcome 
        { flex-grow:1; 
          font-weight:600; 

        }

        .sidebar { 
            height:100%; width:0; position:fixed; top:0; left:0; background:#1e293b; overflow-x:hidden; transition:0.3s; padding-top:60px; }
        .sidebar a { 
            padding:12px 24px; text-decoration:none; font-size:18px; color:#f1f5f9; display:block; transition:0.2s; }
        .sidebar a:hover { 
            background:#334155; }
        .content { 
            padding:30px; text-align:center; }


        h2 { 
            color:#14532d; margin-bottom:10px; }
        .gallery { 
            display:flex; justify-content:center; gap:20px; flex-wrap:wrap; }
        .gallery img { 
            width:400px; height:470px; object-fit:cover; border-radius:12px; box-shadow:0 4px 10px rgba(0,0,0,0.2); }
    
        .auto-style1 {
            color: #009933;
        }
    
    </style>
    <script type="text/javascript">
        function openMenu() {
            document.getElementById("mySidebar").style.width = "220px";
        }
        function closeMenu() {
            document.getElementById("mySidebar").style.width = "0";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        
        <div class="navbar">
            <span class="menu-btn" onclick="openMenu()">&#9776;</span>
            <div class="welcome">Welcome Aboard, <asp:Label ID="lblName" runat="server" Text="Visitor"></asp:Label> 👋</div>
        </div>


        <div id="mySidebar" class="sidebar">
            <a href="javascript:void(0)" onclick="closeMenu()">✖ Close</a>
            <a href="VisitorHome.aspx">🏠 Home</a>
            <a href="Reservations.aspx">🎟️ Book Tickets</a>
            <a href="MyReservations.aspx">📋 My Reservations</a>
            
            <asp:LinkButton ID="btnLogout" runat="server" Text="🚪 Logout" OnClick="btnLogout_Click" />
        </div>

        
        <div class="content">
            <h2>Discover the spectacular Blue River Zoo 🐾</h2>
            <p>Enjoy nature’s classroom with fun exhibits, animals, and family experiences!</p>

            <div class="gallery">
                <asp:Image ID="img1" runat="server" ImageUrl="~/lion.jpg" />
                <asp:Image ID="img2" runat="server" ImageUrl="~/zebra.jpg" />
                <asp:Image ID="img3" runat="server" ImageUrl="~/leopard.jpg" />
            </div>

            <p class="auto-style1"><em><strong>The animals are so excited to see you! Book your tickets now! 😀</strong></em></p>
        </div>
    </form>
</body>
</html>
