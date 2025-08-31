using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Xml.Linq;

namespace Staff
{
    public partial class AddStaff : System.Web.UI.Page
    {
        // Replace with your actual connection string
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|EmployeeTable.mdf;Integrated Security=True";

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
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO StaffTable (FullName, Surname, Email, Password, Role) " +
                                   "VALUES (@Name, @Surname, @Email, @Password, @Role)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Surname", txtSurname.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim()); // Ideally hash this
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

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
        }
    }
}
