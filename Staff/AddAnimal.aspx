<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAnimal.aspx.cs" Inherits="Staff.AddAnimal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Animal - Blue River Zoo</title>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');
        
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Poppins', sans-serif; }
        body { background-color: #f8fafc; color: #333; line-height: 1.6; padding: 20px; }

        .header {
            background: linear-gradient(135deg, #0e5a2f 0%, #1e8449 100%);
            color: white; padding: 20px 0; text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1); position: relative; overflow: hidden;
            border-radius: 10px 10px 0 0; margin-bottom: 20px;
        }
        .header::before {
            content: ""; position: absolute; top: 0; left: 0;
            width: 100%; height: 100%;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"><path d="M0,0 L100,0 L100,100 Z" fill="rgba(255,255,255,0.1)"/></svg>');
            background-size: cover;
        }
        .zoo-name { font-size: 2.2rem; font-weight: 700; margin-bottom: 5px; color: #e8f4f8; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); }
        .page-title { font-size: 1.5rem; font-weight: 500; letter-spacing: 1px; }

        .container { max-width: 800px; margin: 0 auto; background: white; border-radius: 12px; box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08); overflow: hidden; }
        .form-container { padding: 30px; }
        .form-table { width: 100%; border-collapse: separate; border-spacing: 0 20px; }
        .form-table td { padding: 10px; vertical-align: middle; }
        .label-cell { width: 30%; text-align: right; font-weight: 500; color: #2c3e50; padding-right: 20px; }
        .input-cell { width: 70%; }

        .zoo-input, .zoo-select, .zoo-textarea {
            width: 100%; padding: 12px 15px; border: 2px solid #e0e0e0; border-radius: 8px;
            font-size: 1rem; transition: all 0.3s ease;
        }
        .zoo-input:focus, .zoo-select:focus, .zoo-textarea:focus {
            border-color: #27ae60; box-shadow: 0 0 0 3px rgba(39, 174, 96, 0.2); outline: none;
        }
        .zoo-textarea { resize: vertical; min-height: 100px; }

        .button-container { text-align: center; margin-top: 30px; }
        .zoo-btn {
            padding: 12px 30px; border: none; border-radius: 50px; font-size: 1.1rem; font-weight: 600;
            cursor: pointer; transition: all 0.3s ease; box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            text-transform: uppercase; letter-spacing: 1px; margin: 0 10px;
        }
        .btn-submit { background: linear-gradient(to right, #2ecc71, #27ae60); color: white; }
        .btn-submit:hover { background: linear-gradient(to right, #27ae60, #219653); box-shadow: 0 6px 12px rgba(39, 174, 96, 0.3); transform: translateY(-2px); }
        .btn-cancel { background: linear-gradient(to right, #95a5a6, #7f8c8d); color: white; }
        .btn-cancel:hover { background: linear-gradient(to right, #7f8c8d, #6c7a7b); box-shadow: 0 6px 12px rgba(127, 140, 141, 0.3); transform: translateY(-2px); }

        .required { color: #e74c3c; }
        .footer { text-align: center; margin-top: 30px; padding: 20px; color: #7f8c8d; font-size: 0.9rem; border-top: 1px solid #eee; }
        .field-note { font-size: 0.85rem; color: #7f8c8d; margin-top: 5px; font-style: italic; }

        @media (max-width: 768px) {
            .label-cell { width: 100%; text-align: left; padding-right: 10px; }
            .input-cell { width: 100%; }
            .form-table { border-spacing: 0 15px; }
            .form-table tr { display: flex; flex-direction: column; margin-bottom: 15px; }
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
                <p class="page-title">Add New Animal to Database</p>
            </div>
            
            <div class="form-container">
                <table class="form-table">
                    <tr>
                        <td class="label-cell">Animal Name <span class="required">*</span></td>
                        <td class="input-cell">
                            <asp:TextBox ID="txtAnimalName" runat="server" CssClass="zoo-input" placeholder="Enter animal name"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Species / Breed <span class="required">*</span></td>
                        <td class="input-cell">
                            <asp:TextBox ID="txtSpecies" runat="server" CssClass="zoo-input" placeholder="Enter species or breed"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Age <span class="required">*</span></td>
                        <td class="input-cell">
                            <asp:TextBox ID="txtAge" runat="server" CssClass="zoo-input" placeholder="Enter age in years" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Gender <span class="required">*</span></td>
                        <td class="input-cell">
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="zoo-select">
                                <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Habitat / Enclosure</td>
                        <td class="input-cell">
                            <asp:DropDownList ID="ddlHabitat" runat="server" CssClass="zoo-select">
                                <asp:ListItem Text="Select Habitat" Value=""></asp:ListItem>
                                <asp:ListItem Text="Savannah" Value="Savannah"></asp:ListItem>
                                <asp:ListItem Text="Jungle" Value="Jungle"></asp:ListItem>
                                <asp:ListItem Text="Aquatic" Value="Aquatic"></asp:ListItem>
                                <asp:ListItem Text="Desert" Value="Desert"></asp:ListItem>
                                <asp:ListItem Text="Forest" Value="Forest"></asp:ListItem>
                                <asp:ListItem Text="Arctic" Value="Arctic"></asp:ListItem>
                                <asp:ListItem Text="Aviary" Value="Aviary"></asp:ListItem>
                                <asp:ListItem Text="Reptile House" Value="Reptile House"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Conservation Status</td>
                        <td class="input-cell">
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="zoo-select">
                                <asp:ListItem Text="Select Status" Value=""></asp:ListItem>
                                <asp:ListItem Text="Least Concern" Value="Least Concern"></asp:ListItem>
                                <asp:ListItem Text="Near Threatened" Value="Near Threatened"></asp:ListItem>
                                <asp:ListItem Text="Vulnerable" Value="Vulnerable"></asp:ListItem>
                                <asp:ListItem Text="Endangered" Value="Endangered"></asp:ListItem>
                                <asp:ListItem Text="Critically Endangered" Value="Critically Endangered"></asp:ListItem>
                                <asp:ListItem Text="Extinct in the Wild" Value="Extinct in the Wild"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Date of Arrival <span class="required">*</span></td>
                        <td class="input-cell">
                            <asp:TextBox ID="txtArrivalDate" runat="server" CssClass="zoo-input" TextMode="Date"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Origin</td>
                        <td class="input-cell">
                            <asp:TextBox ID="txtOrigin" runat="server" CssClass="zoo-input" placeholder="e.g., Wild, Other Zoo, Rescue"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Diet Type <span class="required">*</span></td>
                        <td class="input-cell">
                            <asp:DropDownList ID="ddlDiet" runat="server" CssClass="zoo-select">
                                <asp:ListItem Text="Select Diet Type" Value=""></asp:ListItem>
                                <asp:ListItem Text="Carnivore" Value="Carnivore"></asp:ListItem>
                                <asp:ListItem Text="Herbivore" Value="Herbivore"></asp:ListItem>
                                <asp:ListItem Text="Omnivore" Value="Omnivore"></asp:ListItem>
                                <asp:ListItem Text="Insectivore" Value="Insectivore"></asp:ListItem>
                                <asp:ListItem Text="Piscivore" Value="Piscivore"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Veterinary Notes</td>
                        <td class="input-cell">
                            <asp:TextBox ID="txtVetNotes" runat="server" CssClass="zoo-textarea" TextMode="MultiLine" placeholder="Any health concerns or special care requirements"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="label-cell">Animal Description</td>
                        <td class="input-cell">
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="zoo-textarea" TextMode="MultiLine" placeholder="Physical characteristics, behavior, etc."></asp:TextBox>
                            <p class="field-note">This description may be used for public display</p>
                        </td>
                    </tr>
                </table>
                
                <div class="button-container">
    <asp:Button ID="btnSubmit" runat="server" Text="Add Animal" CssClass="zoo-btn btn-submit" OnClick="btnSubmit_Click" />
    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="zoo-btn btn-cancel" OnClick="btnCancel_Click" CausesValidation="false" />
    <asp:Button ID="btnBack" runat="server" Text="⬅ Back to Home" CssClass="zoo-btn btn-cancel" OnClick="btnBack_Click" CausesValidation="false" />
</div>

            </div>
            
            <div class="footer">
                <p>© 2023 Blue River Zoo | Animal Management System <br /> Required fields are marked with <span class="required">*</span></p>
            </div>
        </div>
    </form>
</body>
</html>
