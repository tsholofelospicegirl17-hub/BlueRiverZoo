using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Staff
{
    public partial class StaffForgotPassword : System.Web.UI.Page
    {
        protected void btnGoToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            string email = TextBoxEmail.Text.Trim();
            string password = NewPassTxtBx.Text.Trim();
            string confirmedPassword = ConfirmPassTxtBx.Text.Trim();

            if (password != confirmedPassword)
            {
                LblMessage.Text = "⚠ Passwords do not match.";
                LblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Check if email exists
                string checkEmailQuery = "SELECT COUNT(*) FROM EmployeeTable WHERE Email = @Email";
                using (SqlCommand checkCmd = new SqlCommand(checkEmailQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@Email", email);
                    int count = (int)checkCmd.ExecuteScalar();

                    if (count == 0)
                    {
                        LblMessage.Text = "⚠ Email not found.";
                        LblMessage.ForeColor = System.Drawing.Color.Red;
                        return;
                    }
                }

                // Update password (store as plain text)
                string updateQuery = "UPDATE EmployeeTable SET Password = @Password WHERE Email = @Email";
                using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                {
                    updateCmd.Parameters.AddWithValue("@Password", password);
                    updateCmd.Parameters.AddWithValue("@Email", email);
                    updateCmd.ExecuteNonQuery();
                }
            }

            LblMessage.Text = "✅ Password reset successful!";
            LblMessage.ForeColor = System.Drawing.Color.Green;
        }
    }
}
