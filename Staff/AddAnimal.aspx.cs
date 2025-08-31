using System;
using System.Data.SqlClient;

namespace YourNamespace
{
    public partial class AddAnimal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            

            string name = txtAnimalName.Text.Trim();
            string species = txtSpecies.Text.Trim();
            int age = int.Parse(txtAge.Text.Trim());
            string gender = ddlGender.SelectedValue;
            string habitat = ddlHabitat.SelectedValue;
            string conservationStatus = ddlStatus.SelectedValue;
            DateTime arrivalDate = DateTime.Parse(txtArrivalDate.Text.Trim());
            string origin = txtOrigin.Text.Trim();
            string diet = ddlDiet.SelectedValue;
            string vetNotes = txtVetNotes.Text.Trim();
            string description = txtDescription.Text.Trim();

            string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                con.Open();

                string query = @"INSERT INTO AnimalsTable
                                 (Name, Species, Age, Gender, Habitat, ConservationStatus, ArrivalDate, Origin, Diet, VetNotes, Description)
                                 VALUES
                                 (@Name, @Species, @Age, @Gender, @Habitat, @ConservationStatus, @ArrivalDate, @Origin, @Diet, @VetNotes, @Description)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Species", species);
                    cmd.Parameters.AddWithValue("@Age", age);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Habitat", habitat);
                    cmd.Parameters.AddWithValue("@ConservationStatus", conservationStatus);
                    cmd.Parameters.AddWithValue("@ArrivalDate", arrivalDate);
                    cmd.Parameters.AddWithValue("@Origin", origin);
                    cmd.Parameters.AddWithValue("@Diet", diet);
                    cmd.Parameters.AddWithValue("@VetNotes", vetNotes);
                    cmd.Parameters.AddWithValue("@Description", description);

                    cmd.ExecuteNonQuery();
                }
            }

            // Redirect after success
            Response.Redirect("MaintainAnimals.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaintainAnimals.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
{
    Response.Redirect("MaintainAnimals.aspx");
}

    }
}
