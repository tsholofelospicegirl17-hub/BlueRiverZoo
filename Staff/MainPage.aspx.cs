using System;
using System.Web;
using System.Web.UI;

namespace BlueRiverZoo
{
    public partial class MainScreen : Page
    {
        public const string ADMIN = "Admin";
        public const string STAFF = "Staff";
        public const string CUSTOMER = "Customer";

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            HttpCookie user = new HttpCookie("Selection");
            user["Selection"] = ADMIN;
            user.Expires = DateTime.Now.AddMinutes(15);
            Response.Cookies.Add(user);

            Response.Redirect("StaffLogin.aspx");
        }

        protected void btnStaff_Click(object sender, EventArgs e)
        {
            HttpCookie user = new HttpCookie("Selection");
            user["Selection"] = STAFF;
            user.Expires = DateTime.Now.AddMinutes(15);
            Response.Cookies.Add(user);

            Response.Redirect("StaffLogin.aspx");
        }

        protected void btnVisitors_Click(object sender, EventArgs e)
        {
            HttpCookie user = new HttpCookie("Selection");
            user["Selection"] = CUSTOMER;
            user.Expires = DateTime.Now.AddMinutes(15);
            Response.Cookies.Add(user);

            Response.Redirect("VisitorWelcome.aspx");
        }
    }
}
