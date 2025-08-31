using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Staff
{
    public partial class StaffAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStaffData();
            }
        }

        private void LoadStaffData()
        {
            // 🔹 Replace this with your actual connection string
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM EmployeeTable";  // get all rows from StaffTable
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddStaff.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateStaff.aspx");
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemoveStaff.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMain.aspx");
        }
    }
}