using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Staff
{
    public partial class UpdateStaff : System.Web.UI.Page
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

          private void LoadColumnHeadings()
           {
               using (SqlConnection conn = new SqlConnection(connectionString))
               {
                   conn.Open();

                   // We only need schema info, so just select top 1 row
                   SqlCommand cmd = new SqlCommand("SELECT TOP 1 * FROM StaffTable", conn);

                   using (SqlDataReader reader = cmd.ExecuteReader())
                   {
                       // Get schema table (column headings)
                       var schemaTable = reader.GetSchemaTable();

                       ddlColumn.Items.Clear(); // Clear old items

                       foreach (System.Data.DataRow row in schemaTable.Rows)
                       {
                           string columnName = row["ColumnName"].ToString();
                           ddlColumn.Items.Add(columnName); // Add column name as dropdown item
                       }
                   }
               }
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
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = $"UPDATE StaffTable SET {selectedColumn} = @NewValue WHERE {selectedColumn} = @OldValue";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@NewValue", txtNewValue.Text.Trim());
                    cmd.Parameters.AddWithValue("@OldValue", txtOldValue.Text.Trim());

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
    }
}
