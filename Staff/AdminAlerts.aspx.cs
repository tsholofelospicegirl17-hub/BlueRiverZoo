using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Windows.Controls;
using System.Xml.Linq;

namespace BlueRiverZoo
{
    public partial class AdminAlerts : System.Web.UI.Page
    {
        string filePath = HttpContext.Current.Server.MapPath("~/App_Data/Alerts.xml");

        public class Alert
        {
            public string Type { get; set; }
            public string Description { get; set; }
            public DateTime CreatedDate { get; set; }
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
                return;

            XDocument doc;

            if (File.Exists(filePath))
            {
                doc = XDocument.Load(filePath);
            }
            else
            {
                doc = new XDocument(new XElement("Alerts"));
            }

            XElement newAlert = new XElement("Alert",
                new XElement("Type", type),
                new XElement("Description", description),
                new XElement("CreatedDate", DateTime.Now)
            );

            doc.Root.Add(newAlert);
            doc.Save(filePath);

            ddlAlertType.SelectedIndex = 0;
            txtDescription.Text = "";
            BindAlerts();
        }

        private void BindAlerts()
        {
            List<Alert> alerts = new List<Alert>();

            XDocument doc;

            if (File.Exists(filePath))
            {
                try
                {
                    doc = XDocument.Load(filePath);

                    // If file exists but has no root, fix it
                    if (doc.Root == null)
                    {
                        doc = new XDocument(new XElement("Alerts"));
                        doc.Save(filePath);
                    }
                }
                catch
                {
                    // If file is empty or invalid XML, recreate it
                    doc = new XDocument(new XElement("Alerts"));
                    doc.Save(filePath);
                }
            }
            else
            {
                // If file doesn't exist, create it with root <Alerts>
                doc = new XDocument(new XElement("Alerts"));
                doc.Save(filePath);
            }

            // Now safely read alerts
            foreach (XElement element in doc.Descendants("Alert"))
            {
                alerts.Add(new Alert
                {
                    Type = element.Element("Type")?.Value,
                    Description = element.Element("Description")?.Value,
                    CreatedDate = DateTime.Parse(element.Element("CreatedDate")?.Value)
                });
            }

            rptAlerts.DataSource = alerts;
            rptAlerts.DataBind();
        }
    }
}
