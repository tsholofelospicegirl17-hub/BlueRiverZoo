using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace BlueRiverZoo
{
    public partial class AdminUpdateStaff : System.Web.UI.Page
    {
        // ✔️ Update with correct path to your database file
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

        // Safe list of allowed columns to prevent SQL injection

        protected void Page_Load(object sender, EventArgs e)
        {
            //LoadColumnHeadings();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffAdmin.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtOldValue.Text = "";
            txtNewValue.Text = "";
            ddlColumn.SelectedIndex = 0;
            lblMessage.Text = "";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string selectedColumn = ddlColumn.SelectedValue;

            if (selectedColumn == "-- Select Column --" ||
                string.IsNullOrWhiteSpace(txtOldValue.Text) ||
                string.IsNullOrWhiteSpace(txtNewValue.Text))
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            try
            {
                string newValue = txtNewValue.Text.Trim();
                string oldValue = txtOldValue.Text.Trim();

                // 🔒 Hash values if the column is Password
                if (selectedColumn.Equals("Password", StringComparison.OrdinalIgnoreCase))
                {
                    newValue = HashPassword(newValue);
                    oldValue = HashPassword(oldValue);
                }

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = $"UPDATE EmployeeTable SET {selectedColumn} = @NewValue WHERE {selectedColumn} = @OldValue";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@NewValue", newValue);
                    cmd.Parameters.AddWithValue("@OldValue", oldValue);

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();

                    if (rowsAffected > 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Staff record updated successfully!";
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "No matching record found.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        // ✅ Reuse the same hashing method as AddStaff
        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);
                byte[] hash = sha256.ComputeHash(bytes);
                return Convert.ToBase64String(hash); // Store as Base64
            }
        }
    }
}
