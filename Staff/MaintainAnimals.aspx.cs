using System;

namespace YourNamespace
{
    public partial class MaintainAnimals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void AddAnimalBtn_Click(object sender, EventArgs e)
        {
            // Navigate to AddAnimal.aspx
            Response.Redirect("AddAnimal.aspx");
        }

        protected void RemoveAnimalBtn_Click(object sender, EventArgs e)
        {
            // Navigate to DeleteAnimal.aspx
            Response.Redirect("DeleteAnimal.aspx");
        }

        protected void btnUpdateAnimalInfo_Click(object sender, EventArgs e)
        {
            // Navigate to Update.aspx
            Response.Redirect("UpdateAnimal.aspx");
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

    }
}
