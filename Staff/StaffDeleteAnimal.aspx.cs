using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace BlueRiverZoo
{
    public partial class StaffDeleteAnimal : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAnimals();
            }
        }

        private void LoadAnimals()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT Id, Name, Species FROM AnimalsTable ORDER BY Name";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    GridViewAnimals.DataSource = dt;
                    GridViewAnimals.DataBind();
                }
            }
            catch (Exception ex)
            {
                ShowStatus("Error loading animals: " + ex.Message, "error");
            }
        }

        protected void GridViewAnimals_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewAnimals.DataKeys[e.RowIndex].Value);

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM AnimalsTable WHERE Id=@Id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Id", id);
                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                        ShowStatus("✅ Animal record deleted successfully.", "success");
                    else
                        ShowStatus("⚠ No animal record found with the specified ID.", "error");
                }

                LoadAnimals(); //Refresh after deletion
            }
            catch (Exception ex)
            {
                ShowStatus("Error deleting animal: " + ex.Message, "error");
            }
        }

        protected void GridViewAnimals_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button deleteButton = (Button)e.Row.FindControl("btnDelete");
                if (deleteButton != null)
                {
                    deleteButton.OnClientClick = "return confirm('Are you sure you want to delete this animal record? This action cannot be undone.');";
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaintainAnimals.aspx");
        }

        private void ShowStatus(string message, string type)
        {
            pnlStatus.Visible = true;
            litStatus.Text = message;
            pnlStatus.CssClass = "status-message " + type;
        }
    }
}
