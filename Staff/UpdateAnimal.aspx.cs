using System;
using System.Data.SqlClient;

namespace Staff
{
    public partial class UpdateAnimal : System.Web.UI.Page
    {
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAnimalList();
            }
        }

        private void LoadAnimalList()
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT Name FROM AnimalsTable", con);
                SqlDataReader reader = cmd.ExecuteReader();
                ddlAnimals.DataSource = reader;
                ddlAnimals.DataTextField = "Name";
                ddlAnimals.DataValueField = "Name";
                ddlAnimals.DataBind();
            }
        }

        protected void ddlAnimals_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM AnimalsTable WHERE Name=@Name", con);
                cmd.Parameters.AddWithValue("@Name", ddlAnimals.SelectedValue);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    txtAnimalName.Text = reader["Name"].ToString();
                    txtSpecies.Text = reader["Species"].ToString();
                    txtAge.Text = reader["Age"].ToString();
                    ddlGender.SelectedValue = reader["Gender"].ToString();
                    ddlHabitat.SelectedValue = reader["Habitat"].ToString();
                    ddlStatus.SelectedValue = reader["ConservationStatus"].ToString();
                    txtArrivalDate.Text = Convert.ToDateTime(reader["ArrivalDate"]).ToString("yyyy-MM-dd");
                    txtOrigin.Text = reader["Origin"].ToString();
                    ddlDiet.SelectedValue = reader["Diet"].ToString();
                    txtVetNotes.Text = reader["VetNotes"].ToString();
                    txtDescription.Text = reader["Description"].ToString();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();
                string query = @"UPDATE AnimalsTable 
                                 SET Name=@Name, Species=@Species, Age=@Age, Gender=@Gender,
                                     Habitat=@Habitat, ConservationStatus=@ConservationStatus,
                                     ArrivalDate=@ArrivalDate, Origin=@Origin, Diet=@Diet,
                                     VetNotes=@VetNotes, Description=@Description
                                 WHERE Name=@OldName";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtAnimalName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Species", txtSpecies.Text.Trim());
                    cmd.Parameters.AddWithValue("@Age", int.Parse(txtAge.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Habitat", ddlHabitat.SelectedValue);
                    cmd.Parameters.AddWithValue("@ConservationStatus", ddlStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@ArrivalDate", DateTime.Parse(txtArrivalDate.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Origin", txtOrigin.Text.Trim());
                    cmd.Parameters.AddWithValue("@Diet", ddlDiet.SelectedValue);
                    cmd.Parameters.AddWithValue("@VetNotes", txtVetNotes.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@OldName", ddlAnimals.SelectedValue);

                    int rows = cmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        lblMessage.Text = "Animal updated successfully!";
                    }
                    else
                    {
                        lblMessage.Text = "Update failed!";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaintainAnimals.aspx");
        }
    }
}
