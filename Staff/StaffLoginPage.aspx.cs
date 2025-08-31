using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Configuration;

namespace BlueRiverZoo
{
    public partial class StaffLoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            string email = EmailTxtbx.Text.Trim();      
            string password = PasswordTxtbx.Text.Trim(); 

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                Error.Text = "Please enter both email and password.";
                Error.ForeColor = System.Drawing.Color.Red;
                Error.Visible = true;
                return;
            }

           string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM EmployeeTable WHERE Email = @Email AND Password = @Password";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password); 

                    int result = (int)cmd.ExecuteScalar();

                    if (result > 0)
                    {
                        
                        Session["UserEmail"] = email; 
                        Response.Redirect("AdminHomePage.aspx");
                    }
                    else
                    {
                        Error.Text = "Invalid email or password.";
                        Error.ForeColor = System.Drawing.Color.Red;
                        Error.Visible = true;
                    }
                }
            }
        }

        protected void btnForgetPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffForgotPassword.aspx"); 
        }
    }
}
