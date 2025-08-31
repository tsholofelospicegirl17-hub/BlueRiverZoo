using System;
using System.Web;
using System.Web.UI;

namespace Staff
{
    public partial class WillemHomePage : Page
    {
        

        public const string ADMIN = "Admin";
        public const string STAFF = "Staff";
        public const string CUSTOMER = "Customer";

        HttpCookie user = new HttpCookie("Selection");

        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            user["Selection"] = ADMIN;
            Response.Cookies.Add(user);
            user.Expires = DateTime.Now.AddMinutes(15);
            Response.Redirect("AdminMain.aspx");
        }

        protected void btnStaff_Click(object sender, EventArgs e)
        {
            user["Selection"] = STAFF;
            Response.Cookies.Add(user);
            user.Expires = DateTime.Now.AddMinutes(15);
            Response.Redirect("LoginPage.aspx");
        }

        protected void btnVisitors_Click(object sender, EventArgs e)
        {
            user["Selection"] = CUSTOMER;
            Response.Cookies.Add(user);
            user.Expires = DateTime.Now.AddMinutes(15);
            Response.Redirect("TshidiHomePage.aspx");
        }
    }
}
