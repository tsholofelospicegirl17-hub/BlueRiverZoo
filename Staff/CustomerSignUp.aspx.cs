using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace Staff
{
    public partial class CustomerSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Direct connection string (replace path with your actual MDF file if needed)
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

        // Password hashing
        public string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder sb = new StringBuilder();
                foreach (byte b in bytes)
                    sb.Append(b.ToString("x2")); // hex string
                return sb.ToString();
            }
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string password = txtPassword.Text.Trim();
            string confirm = txtConfirmPassword.Text.Trim();

            if (password != confirm)
            {
                lblMsg.Text = "⚠ Passwords do not match!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string hashedPassword = HashPassword(password);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                try
                {
                    con.Open();
                    string sql = @"INSERT INTO Visitors (Name, Surname, Email, Phone, PasswordHash) 
                                   VALUES (@Name, @Surname, @Email, @Phone, @PasswordHash)";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Surname", txtSurname.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text.Trim());
                    cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);

                    cmd.ExecuteNonQuery();

                    lblMsg.Text = "✅ Account created successfully. Please login.";
                    lblMsg.ForeColor = System.Drawing.Color.Green;

                    // Clear fields
                    txtName.Text = "";
                    txtSurname.Text = "";
                    txtEmail.Text = "";
                    txtPhone.Text = "";
                    txtPassword.Text = "";
                    txtConfirmPassword.Text = "";
                }
                catch (Exception ex)
                {
                    // Usually happens when email already exists (unique constraint)
                    lblMsg.Text = "⚠ Error: " + ex.Message;
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
