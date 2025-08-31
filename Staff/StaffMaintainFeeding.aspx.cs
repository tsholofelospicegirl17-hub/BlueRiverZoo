using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlueRiverZoo
{
    public partial class StaffMaintainFeeding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddFeedingSchedule_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffAddFeeding.aspx");
        }

        protected void RemoveFeeding_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffRemoveFeeding.aspx");
        }

        protected void UpdateFeedingBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffUpdateFeeding.aspx");
        }

        protected void BackBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminHomePage.aspx");
        }
    }
}