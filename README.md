# 🐾 Blue River Zoo Management System
This Systems Design and Analysis project is a web-based system for the *Blue River Zoo*, it is built with **ASP.NET Web Application (C#)** and **SQL Server**.

It supports **three user roles** with different functionalities: **Visitors, Staff, and Admin**.  

---

## 👥 Team Roles
- **Visitors Module** → Registration, Login, Profile, Reservations. *(Developed by [tshidijasmine-hue])*
- **Staff Module** → Manage animals, view reservations. *(Developed by [])*
- **Admin Module** → Manage staff, generate reports, oversee full system. *(Developed by [])*

---

## 📂 Project Structure
Although the project is contained in a single Visual Studio solution,  
the files are **renamed to clearly show** which part belongs to which user role.

- **Visitors**
  - `VisitorLogin.aspx / VisitorsLogin.aspx.cs`
  - `VisitorSignUp.aspx / VisitorSignUp.aspx.cs`
  - `VisitorProfile.aspx / VisitorProfile.aspx.cs`
  - `VisitorsReservations.aspx / VisitorReservations.aspx.cs`
  - `VisitorMyReservations.aspx / VisitorMyReservations.aspx.cs`
  - `VisitorResetPassword.aspx / VisitorResetPassword.aspx.cs`
  
- **Staff**
  - 
  - 
  - 
  
- **Admin**
  - `AdminAddStaff.aspx / AdmimAddStaff.aspx.cs`
  - `AdminAlerts.aspx / AdminAlerts.aspx.cs`
  - `AdminAnimals.aspx / AdminAnimals.aspx.cs`
  - `AdminBreedingPrograms.aspx / AdminBreedingPrograms.aspx.cs`
  - `AdminHomePage.aspx / AdminHomePage.aspx.cs`
  - `AdminMain.aspx / AdminMain.aspx.cs`
  - `AdminRemoveStaff.aspx / AdminRemoveStaff.aspx.cs`
  - `AdminReports.aspx / AdminReports.aspx.cs`
  - `AdminStaff.aspx / AdminStaff.aspx.cs`
  - `AdminUpdateStaff.aspx / AdminUpdateStaff.aspx.cs`

---

## 🗄 Database
- SQL Server LocalDB used (`BlueRiverZooDB.mdf`).  
- **Tables:**
  - `Visitors` (VisitorID, Name, Surname, Email, Phone, PasswordHash)
  - `Reservations` (ReservationID, VisitorID, TicketType, VisitDate, NumTickets, TotalCost, PaymentMethod, Status)

The `Reservations` table is a **child entity** linked to `Visitors`.

---

## 🔐 Security
- Passwords are stored securely using **SHA256 hashing**.  
- Shared method `HashPassword(string password)` ensures **efficient reuse of code** in both Login and Reset Password modules.

---

## ✨ Features
- **Visitors:**
  - Register, Login, Reset Password
  - Make Reservations (with status: Pending / Cancelled)
  - View & Cancel Reservations
  - Profile page with option to update details
- **Staff:**
  - Manage animal records
  - View all visitor bookings
  - Generate reports
- **Admin:**
  - Add / Remove staff
  - View reports
  - Oversee system operations
 
---

## 🚀 How to Run
1. Clone this repository.  
2. Open solution in **Visual Studio**.  
3. Update the connection string in `Web.config` to your SQL Server path:
   ```xml
   <connectionStrings>
       <add name="BlueRiverZooDB" connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\BlueRiverZooDB.mdf;Integrated Security=True" providerName="System.Data.SqlClient"/>
   </connectionStrings>
