<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveFeeding.aspx.cs" Inherits="Staff.RemoveFeeding" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Remove Feeding - Blue River Zoo</title>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');
        
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        body { background-color: #f8fafc; color: #333; line-height: 1.6; padding: 20px; }

        .container {
            max-width: 600px;
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

        .header::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"><path d="M0,0 L100,0 L100,100 Z" fill="rgba(255,255,255,0.1)"/></svg>');
            background-size: cover;
        }

        .zoo-name { font-size: 2.2rem; font-weight: 700; margin-bottom: 5px; color: #e8f4f8; text-shadow: 2px 2px 4px rgba(0,0,0,0.3); }
        .page-title { font-size: 1.5rem; font-weight: 500; letter-spacing: 1px; }
        .form-container { padding: 30px; text-align: center; }
        .zoo-select {
            width: 100%;
            max-width: 300px;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
            margin: 15px 0;
        }
        .zoo-select:focus { border-color: #27ae60; box-shadow: 0 0 0 3px rgba(39,174,96,0.2); outline: none; }
        .button-container { text-align: center; margin-top: 30px; }
        .zoo-btn { padding: 12px 30px; border: none; border-radius: 50px; font-size: 1.1rem; font-weight: 600; cursor: pointer; transition: all 0.3s ease; box-shadow: 0 4px 8px rgba(0,0,0,0.1); text-transform: uppercase; letter-spacing: 1px; margin: 0 10px; }
        .btn-delete { background: linear-gradient(to right, #e74c3c, #c0392b); color: white; }
        .btn-delete:hover { background: linear-gradient(to right, #c0392b, #a93226); box-shadow: 0 6px 12px rgba(231,76,60,0.3); transform: translateY(-2px); }
        .btn-back { background: linear-gradient(to right, #2ecc71, #27ae60); color: white; }
        .btn-back:hover { background: linear-gradient(to right, #27ae60, #219653); box-shadow: 0 6px 12px rgba(39,174,96,0.3); transform: translateY(-2px); }
        .footer { text-align: center; margin-top: 30px; padding: 20px; color: #7f8c8d; font-size: 0.9rem; border-top: 1px solid #eee; }
        .message { color: #e74c3c; font-weight: 500; margin: 15px 0; display: block; }
        .warning-text { color: #7f8c8d; font-style: italic; margin: 15px 0; }

        @media (max-width: 768px) {
            .zoo-btn { padding: 10px 20px; font-size: 1rem; margin-bottom: 10px; }
            .zoo-name { font-size: 1.8rem; }
            .page-title { font-size: 1.3rem; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1 class="zoo-name">BLUE RIVER ZOO</h1>
                <p class="page-title">Remove Feeding Schedule</p>
            </div>
            
            <div class="form-container">
                <p class="warning-text">Select an animal to remove its feeding schedule</p>
                
                <asp:DropDownList ID="DDLAnimal" runat="server" CssClass="zoo-select"></asp:DropDownList>
                
                <div class="button-container">
                    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete Feeding" CssClass="zoo-btn btn-delete" />
                    <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" CssClass="zoo-btn btn-back" />
                </div>
                
                <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="False"></asp:Label>
            </div>
            
            <div class="footer">
                <p>© 2023 Blue River Zoo | Animal Management System</p>
            </div>
        </div>
    </form>
</body>
</html>
