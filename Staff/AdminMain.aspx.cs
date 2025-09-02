using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlueRiverZoo
{
    public partial class AdminMain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnStaff_Click(object sender, EventArgs e)
        {
           // Response.Redirect("AdminStaff.aspx");
        }

        protected void btnAlerts_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAlerts.aspx");
        }

        protected void btnReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminReports.aspx");
        }

        protected void btnAnimals_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAnimals.aspx");
        }
    }
}