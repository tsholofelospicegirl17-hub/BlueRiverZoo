using System;
using System.Data.SqlClient;

namespace Staff
{
    public partial class UpdateFeeding : System.Web.UI.Page
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
                }
                else
                {
                    lblMessage.Text = "No feedings found";
                }
            }
        }

        protected void DDLAnimal_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT FeedingTime, Keeper, FoodItems FROM FeedingTable WHERE Animal=@Animal", conn);
                cmd.Parameters.AddWithValue("@Animal", DDLAnimal.SelectedValue);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    ddlFeedingTime.Text = reader["FeedingTime"].ToString();
                    txtKeeper.Text = reader["Keeper"].ToString();
                    ddlFoodItems.Text = reader["FoodItems"].ToString();
                }
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaintainFeeding.aspx");
        }


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(
                    "UPDATE FeedingTable SET FeedingTime=@Time, Keeper=@Keeper, FoodItems=@Food WHERE Animal=@Animal", conn);

                cmd.Parameters.AddWithValue("@Time", ddlFeedingTime.Text);
                cmd.Parameters.AddWithValue("@Keeper", txtKeeper.Text);
                cmd.Parameters.AddWithValue("@Food", ddlFoodItems.Text);
                cmd.Parameters.AddWithValue("@Animal", DDLAnimal.SelectedValue);

                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    lblMessage.Text = "Feeding updated successfully!";
                }
                else
                {
                    lblMessage.Text = "Update failed.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
