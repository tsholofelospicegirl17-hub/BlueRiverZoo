using System;

namespace BlueRiverZoo
{
    public partial class StaffMaintainAnimals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddAnimalBtn_Click(object sender, EventArgs e)
        {
            // Navigate to AddAnimal.aspx
            Response.Redirect("StaffAddAnimal.aspx");
        }

        protected void RemoveAnimalBtn_Click(object sender, EventArgs e)
        {
            // Navigate to DeleteAnimal.aspx
            Response.Redirect("StaffDeleteAnimal.aspx");
        }

        protected void btnUpdateAnimalInfo_Click(object sender, EventArgs e)
        {
            // Navigate to Update.aspx
            Response.Redirect("StaffUpdateAnimal.aspx");
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomePage.aspx");
        }

    }
}
