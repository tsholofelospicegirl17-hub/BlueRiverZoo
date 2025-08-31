<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainAnimals.aspx.cs" Inherits="YourNamespace.MaintainAnimals" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Animal Management - Blue River Zoo</title>
    <link rel ="website icon" type ="png" href ="BRZLogo.png" />
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background-color: #f8fafc;
            color: #333;
            line-height: 1.6;
        }
        
        .header {
            background: linear-gradient(135deg, #0e5a2f 0%, #1e8449 100%);
            color: white;
            padding: 20px 0;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            position: relative;
            overflow: hidden;
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
        
        .zoo-name {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 5px;
            color: #e8f4f8;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        
        .page-title {
            font-size: 1.8rem;
            font-weight: 500;
            letter-spacing: 1px;
        }
        
        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
        }
        
        .animal-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
            margin-top: 20px;
        }
        
        .animal-table td {
            padding: 15px;
            vertical-align: middle;
        }
        
        .action-label {
            font-size: 1.1rem;
            color: #2c3e50;
            font-weight: 500;
            padding-left: 20px;
        }
        
        .zoo-btn {
            padding: 12px 25px;
            border: none;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }
        
        .zoo-btn::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1, 1) translate(-50%);
            transform-origin: 50% 50%;
        }
        
        .zoo-btn:focus:not(:active)::after {
            animation: ripple 1s ease-out;
        }
        
        @keyframes ripple {
            0% { transform: scale(0, 0); opacity: 1; }
            20% { transform: scale(20, 20); opacity: 1; }
            100% { transform: scale(50, 50); opacity: 0; }
        }
        
        .btn-add {
            background: linear-gradient(to right, #2ecc71, #27ae60);
            color: white;
        }
        
        .btn-add:hover {
            background: linear-gradient(to right, #27ae60, #219653);
            box-shadow: 0 6px 12px rgba(39, 174, 96, 0.3);
            transform: translateY(-2px);
        }
        
        .btn-remove {
            background: linear-gradient(to right, #e74c3c, #c0392b);
            color: white;
        }
        
        .btn-remove:hover {
            background: linear-gradient(to right, #c0392b, #a93226);
            box-shadow: 0 6px 12px rgba(192, 57, 43, 0.3);
            transform: translateY(-2px);
        }
        
        .btn-update {
            background: linear-gradient(to right, #3498db, #2980b9);
            color: white;
        }
        
        .btn-update:hover {
            background: linear-gradient(to right, #2980b9, #1c6ea4);
            box-shadow: 0 6px 12px rgba(41, 128, 185, 0.3);
            transform: translateY(-2px);
        }
        
        .btn-back {
            background: linear-gradient(to right, #95a5a6, #7f8c8d);
            color: white;
        }
        
        .btn-back:hover {
            background: linear-gradient(to right, #7f8c8d, #6c7a7b);
            box-shadow: 0 6px 12px rgba(127, 140, 141, 0.3);
            transform: translateY(-2px);
        }
        
        .table-row {
            transition: all 0.3s ease;
            border-radius: 8px;
        }
        
        .table-row:hover {
            background-color: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        }
        
        .footer {
            text-align: center;
            margin-top: 40px;
            padding: 20px;
            color: #7f8c8d;
            font-size: 0.9rem;
        }
        
        .animal-icon {
            font-size: 24px;
            margin-right: 10px;
            vertical-align: middle;
        }
        
        @media (max-width: 768px) {
            .container { margin: 15px; padding: 15px; }
            .animal-table { border-spacing: 0 10px; }
            .zoo-btn { padding: 10px 20px; font-size: 0.9rem; }
            .zoo-name { font-size: 2rem; }
            .page-title { font-size: 1.5rem; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h1 class="zoo-name">BLUE RIVER ZOO</h1>
            <p class="page-title">Animal Management System</p>
        </div>
        
        <div class="container">
            <table class="animal-table">
                <tr class="table-row">
                    <td class="action-label"><span class="animal-icon">🦁</span>Add New Animal</td>
                    <td><asp:Button ID="AddAnimalBtn" runat="server" Text="Add Animal" CssClass="zoo-btn btn-add" OnClick="AddAnimalBtn_Click" /></td>
                </tr>
                <tr class="table-row">
                    <td class="action-label"><span class="animal-icon">🐘</span>Remove Animal</td>
                    <td><asp:Button ID="RemoveAnimalBtn" runat="server" Text="Remove Animal" CssClass="zoo-btn btn-remove" OnClick="RemoveAnimalBtn_Click" /></td>
                </tr>
                <tr class="table-row">
                    <td class="action-label"><span class="animal-icon">🐾</span>Update Animal Information</td>
                    <td><asp:Button ID="btnUpdateAnimalInfo" runat="server" Text="Update Animal" CssClass="zoo-btn btn-update" OnClick="btnUpdateAnimalInfo_Click" /></td>
                </tr>
                <tr class="table-row">
                    <td class="action-label"><span class="animal-icon">🏠</span>Back to Home</td>
                    <td><asp:Button ID="btnBack" runat="server" Text="Home" CssClass="zoo-btn btn-back" OnClick="btnBack_Click" CausesValidation="false" /></td>
                </tr>
            </table>
        </div>
        
        <div class="footer">
            <p>© 2023 Blue River Zoo | Animal Management System v2.1</p>
        </div>
    </form>
</body>
</html>
