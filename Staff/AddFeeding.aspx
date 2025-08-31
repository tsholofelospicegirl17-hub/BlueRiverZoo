<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFeeding.aspx.cs" Inherits="Staff.AddFeeding" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Feeding - Blue River Zoo</title>
    <link rel ="website icon" type ="png" href ="BRZLogo.png" />
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

        .zoo-name {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 5px;
            color: #e8f4f8;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .page-title {
            font-size: 1.5rem;
            font-weight: 500;
            letter-spacing: 1px;
        }

        .form-container {
            padding: 30px;
        }

        .form-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
        }

        .form-table td {
            padding: 10px;
            vertical-align: middle;
        }

        .label-cell {
            width: 35%;
            text-align: right;
            font-weight: 500;
            color: #2c3e50;
            padding-right: 20px;
        }

        .input-cell {
            width: 65%;
        }

        .zoo-input, .zoo-select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .zoo-input:focus, .zoo-select:focus {
            border-color: #27ae60;
            box-shadow: 0 0 0 3px rgba(39, 174, 96, 0.2);
            outline: none;
        }

        .button-container {
            text-align: center;
            margin-top: 30px;
        }

        .zoo-btn {
            padding: 12px 30px;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin: 0 10px;
        }

        .btn-submit {
            background: linear-gradient(to right, #2ecc71, #27ae60);
            color: white;
        }

        .btn-submit:hover {
            background: linear-gradient(to right, #27ae60, #219653);
            box-shadow: 0 6px 12px rgba(39, 174, 96, 0.3);
            transform: translateY(-2px);
        }

        .btn-clear {
            background: linear-gradient(to right, #95a5a6, #7f8c8d);
            color: white;
        }

        .btn-clear:hover {
            background: linear-gradient(to right, #7f8c8d, #6c7a7b);
            box-shadow: 0 6px 12px rgba(127, 140, 141, 0.3);
            transform: translateY(-2px);
        }

        .required {
            color: #e74c3c;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            padding: 20px;
            color: #7f8c8d;
            font-size: 0.9rem;
            border-top: 1px solid #eee;
        }

        .message {
            color: #27ae60;
            font-weight: 500;
            text-align: center;
            margin: 15px 0;
            display: block;
        }

        .error {
            color: #e74c3c;
            font-weight: 500;
            text-align: center;
            margin: 15px 0;
            display: block;
        }

        .validator {
            color: #e74c3c;
            margin-left: 5px;
        }

        @media (max-width: 768px) {
            .label-cell {
                width: 100%;
                text-align: left;
                padding-right: 10px;
            }
            
            .input-cell {
                width: 100%;
            }
            
            .form-table tr {
                display: flex;
                flex-direction: column;
                margin-bottom: 15px;
            }
            
            .zoo-btn {
                padding: 10px 20px;
                font-size: 1rem;
                margin-bottom: 10px;
            }
            
            .zoo-name {
                font-size: 1.8rem;
            }
            
            .page-title {
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1 class="zoo-name">BLUE RIVER ZOO</h1>
                <p class="page-title">Add Feeding Schedule</p>
            </div>
            
            <div class="form-container">
                <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
                <asp:Label ID="lblError" runat="server" CssClass="error" Visible="false"></asp:Label>
                
                <table class="form-table">
                    <tr>
                        <td class="label-cell">
                            <asp:Label ID="Label4" runat="server" Text="Animal:"></asp:Label>
                            <span class="required">*</span>
                        </td>
                        <td class="input-cell">
                            <asp:DropDownList ID="DropDownListAnimals" runat="server" CssClass="zoo-select"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvAnimal" runat="server" 
                                ControlToValidate="DropDownListAnimals" ErrorMessage="Animal is required" 
                                InitialValue="" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">
                            <asp:Label ID="Label5" runat="server" Text="Feeding Time:"></asp:Label>
                            <span class="required">*</span>
                        </td>
                        <td class="input-cell">
                            <asp:DropDownList ID="DropDownListFeedingTimes" runat="server" CssClass="zoo-select">
                                <asp:ListItem Value="">-- Select Time --</asp:ListItem>
                                <asp:ListItem Value="06:00">06:00 AM</asp:ListItem>
                                <asp:ListItem Value="09:00">09:00 AM</asp:ListItem>
                                <asp:ListItem Value="12:00">12:00 PM</asp:ListItem>
                                <asp:ListItem Value="15:00">03:00 PM</asp:ListItem>
                                <asp:ListItem Value="18:00">06:00 PM</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvTime" runat="server" 
                                ControlToValidate="DropDownListFeedingTimes" ErrorMessage="Time is required" 
                                InitialValue="" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">
                            <asp:Label ID="Label6" runat="server" Text="Keeper:"></asp:Label>
                            <span class="required">*</span>
                        </td>
                        <td class="input-cell">
                            <asp:TextBox ID="txtKeeper" runat="server" CssClass="zoo-input" placeholder="Enter keeper's name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvKeeper" runat="server" 
                                ControlToValidate="txtKeeper" ErrorMessage="Keeper is required" 
                                CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">
                            <asp:Label ID="Label7" runat="server" Text="Food Items:"></asp:Label>
                            <span class="required">*</span>
                        </td>
                        <td class="input-cell">
                            <asp:DropDownList ID="DropDownListFoodItems" runat="server" CssClass="zoo-select">
                                <asp:ListItem Value="">-- Select Food --</asp:ListItem>
                                <asp:ListItem Value="Meat">Meat</asp:ListItem>
                                <asp:ListItem Value="Fish">Fish</asp:ListItem>
                                <asp:ListItem Value="Vegetables">Vegetables</asp:ListItem>
                                <asp:ListItem Value="Fruits">Fruits</asp:ListItem>
                                <asp:ListItem Value="Grains">Grains</asp:ListItem>
                                <asp:ListItem Value="Special Diet">Special Diet</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvFood" runat="server" 
                                ControlToValidate="DropDownListFoodItems" ErrorMessage="Food is required" 
                                InitialValue="" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                
                <div class="button-container">
                    <asp:Button ID="Add" runat="server" OnClick="Add_Click" Text="Add Feeding" CssClass="zoo-btn btn-submit" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CssClass="zoo-btn btn-clear" />
                    <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CssClass="zoo-btn btn-clear" />
                </div>
            </div>
            
            <div class="footer">
                <p>© 2023 Blue River Zoo | Animal Management System <br /> Required fields are marked with <span class="required">*</span></p>
            </div>
        </div>
    </form>
</body>
</html>
