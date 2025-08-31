using System;
using System.Collections.Generic;

namespace Staff
{
    public partial class AlertsAdmin : System.Web.UI.Page
    {
        // Simple class to hold alert data
        public class Alert
        {
            public string Type { get; set; }
            public string Description { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAlerts();
            }
        }

        protected void btnAddAlert_Click(object sender, EventArgs e)
        {
            string type = ddlAlertType.SelectedValue;
            string description = txtDescription.Text.Trim();

            if (string.IsNullOrEmpty(type) || string.IsNullOrEmpty(description))
            {
                // Optionally display an error message (e.g., use a Label)
                return;
            }

            List<Alert> alerts = Session["Alerts"] as List<Alert> ?? new List<Alert>();
            alerts.Add(new Alert { Type = type, Description = description });
            Session["Alerts"] = alerts;

            // Clear form
            ddlAlertType.SelectedIndex = 0;
            txtDescription.Text = "";

            // Rebind updated alerts list
            BindAlerts();
        }

        private void BindAlerts()
        {
            List<Alert> alerts = Session["Alerts"] as List<Alert> ?? new List<Alert>();
            rptAlerts.DataSource = alerts;
            rptAlerts.DataBind();
        }
    }
}
