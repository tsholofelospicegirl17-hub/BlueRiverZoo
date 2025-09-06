using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace BlueRiverZoo
{
    public partial class AdminRemoveStaff : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStaff();
            }
        }

        // Load all staff into GridView
        private void LoadStaff()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Email, Name, Surname, Password, Role FROM EmployeeTable";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }
        }

        // Delete staff by Email
        protected void btnDeleteByEmail_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please enter a valid Email.";
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM EmployeeTable WHERE Email=@Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = $"Employee with Email '{email}' deleted successfully.";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = $"No employee found with Email '{email}'.";
                }
            }

            // Refresh GridView
            LoadStaff();
            txtEmail.Text = "";
        }
    }
}
