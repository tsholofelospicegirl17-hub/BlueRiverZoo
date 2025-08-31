﻿using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace BlueRiverZoo
{
    public partial class VisitorResetPassword : System.Web.UI.Page
    {
        
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ResetEmail"] == null)
                Response.Redirect("VisitorForgotPassword.aspx");

            lnkLogin.Visible = false;
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            string newPassword = txtNewPass.Text.Trim();
            string confirmPassword = txtConfirmPass.Text.Trim();

            if (newPassword != confirmPassword)
            {
                lblMsg.Text = "⚠ Passwords do not match!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string hashedPassword = HashPassword(newPassword);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                string sql = "UPDATE Visitors SET PasswordHash=@PasswordHash WHERE Email=@Email";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);
                cmd.Parameters.AddWithValue("@Email", Session["ResetEmail"].ToString());

                cmd.ExecuteNonQuery();
            }

            lblMsg.Text = "✅ Password reset successful! You can now login.";
            lblMsg.ForeColor = System.Drawing.Color.Green;

            lnkLogin.Visible = true;
            Session["ResetEmail"] = null;
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder sb = new StringBuilder();
                foreach (byte b in bytes)
                    sb.Append(b.ToString("x2"));
                return sb.ToString();
            }
        }
    }
}
