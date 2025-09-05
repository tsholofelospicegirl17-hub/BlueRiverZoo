using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
using System.Xml.Linq;

namespace BlueRiverZoo
{
    public partial class AdminAddStaff : System.Web.UI.Page
    {
        // Replace with your actual connection string
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|Animals.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtName.Text = "";
            txtSurname.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            ddlRole.SelectedIndex = 0;
            lblMessage.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffAdmin.aspx");
        }

        protected void btnAddStaff_Click(object sender, EventArgs e)
        {
            // Validation
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtSurname.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                string.IsNullOrWhiteSpace(ddlRole.SelectedValue))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            try
            {
                // Hash the password before storing it
                string hashedPassword = HashPassword(txtPassword.Text.Trim());

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO EmployeeTable (Name, Surname, Email, Password, Role) " +
                                   "VALUES (@Name, @Surname, @Email, @Password, @Role)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Surname", txtSurname.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", hashedPassword); // hashed password
                    cmd.Parameters.AddWithValue("@Role", ddlRole.SelectedValue);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "New staff member added successfully!";

                // Clear fields after successful submission
                txtName.Text = "";
                txtSurname.Text = "";
                txtEmail.Text = "";
                txtPassword.Text = "";
                ddlRole.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error adding staff: " + ex.Message;
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);
                byte[] hash = sha256.ComputeHash(bytes);
                return Convert.ToBase64String(hash); // Store hashed password as Base64
            }
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
        }
    }
}
