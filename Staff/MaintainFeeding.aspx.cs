using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Staff
{
    public partial class MaintainFeeding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddFeedingSchedule_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddFeeding.aspx");
        }

        protected void RemoveFeeding_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemoveFeeding.aspx");
        }

        protected void UpdateFeedingBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateFeeding.aspx");
        }

        protected void BackBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }
    }
}