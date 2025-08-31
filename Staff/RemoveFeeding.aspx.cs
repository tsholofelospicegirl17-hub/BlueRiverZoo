using System;
using System.Data.SqlClient;

namespace Staff
{
    public partial class RemoveFeeding : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAnimals();
            }
        }

        private void LoadAnimals()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT Animal FROM FeedingTable", conn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    DDLAnimal.DataSource = reader;
                    DDLAnimal.DataTextField = "Animal";
                    DDLAnimal.DataValueField = "Animal";
                    DDLAnimal.DataBind();
                    lblMessage.Visible = false;
                    DDLAnimal.Visible = true;
                    btnDelete.Visible = true;
                }
                else
                {
                    lblMessage.Text = "No feedings found";
                    lblMessage.Visible = true;
                    DDLAnimal.Visible = false;
                    btnDelete.Visible = false;
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM FeedingTable WHERE Name = @Name", conn);
                cmd.Parameters.AddWithValue("@Name", DDLAnimal.SelectedValue);
                cmd.ExecuteNonQuery();
            }

            // reload the list after deletion
            LoadAnimals();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaintainFeeding.aspx");
        }

    }
}
