using System;
using System.Data;
using System.Data.SqlClient;

namespace Staff
{
    public partial class AddFeeding : System.Web.UI.Page
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
                    string query = "SELECT Id, Name FROM AnimalsTable ORDER BY Name";
                    SqlDataAdapter da = new SqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    DropDownListAnimals.DataSource = dt;
                    DropDownListAnimals.DataTextField = "Name";
                    DropDownListAnimals.DataValueField = "Id";
                    DropDownListAnimals.DataBind();
                    DropDownListAnimals.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Animal --", ""));
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error loading animals: " + ex.Message;
                lblError.Visible = true;
            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        string query = "INSERT INTO FeedingSchedule (AnimalId, FeedingTime, Keeper, FoodItem) VALUES (@AnimalId, @FeedingTime, @Keeper, @FoodItem)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@AnimalId", DropDownListAnimals.SelectedValue);
                        cmd.Parameters.AddWithValue("@FeedingTime", DropDownListFeedingTimes.SelectedValue);
                        cmd.Parameters.AddWithValue("@Keeper", txtKeeper.Text.Trim());
                        cmd.Parameters.AddWithValue("@FoodItem", DropDownListFoodItems.SelectedValue);

                        con.Open();
                        cmd.ExecuteNonQuery();

                        lblMessage.Text = "Feeding schedule added successfully!";
                        lblMessage.Visible = true;
                        lblError.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = "Error adding feeding schedule: " + ex.Message;
                    lblError.Visible = true;
                    lblMessage.Visible = false;
                }
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            DropDownListAnimals.SelectedIndex = 0;
            DropDownListFeedingTimes.SelectedIndex = 0;
            DropDownListFoodItems.SelectedIndex = 0;
            txtKeeper.Text = "";
            lblMessage.Visible = false;
            lblError.Visible = false;
        }

        // NEW: Back button redirect
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("MaintainFeeding.aspx");
        }
    }
}
