using System;
using System.Web.UI;

namespace BlueRiverZoo
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("MaintainAnimals.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("MaintainFeeding.aspx");
        }

        protected void btnviewReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reports.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("AdminHomePage.aspx");
        }

        protected void btnVisitors_Click(object sender, EventArgs e)
        {
            
        }
    }
}
