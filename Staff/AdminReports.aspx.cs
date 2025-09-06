using System;
using System.Data;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Web.UI;

namespace BlueRiverZoo
{
    public partial class AdminReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Always load reports whenever the page opens or refreshes
            LoadReports();
        }

        private void LoadReports()
        {
            HttpCookie animalsCookie = Request.Cookies["AnimalsReport"];
            HttpCookie feedingsCookie = Request.Cookies["FeedingsReport"];

            if (animalsCookie != null)
            {
                var animalsDT = JsonToDataTable(animalsCookie.Value);
                gvZooReport.DataSource = animalsDT;
                gvZooReport.DataBind();
            }

            if (feedingsCookie != null)
            {
                var feedingsDT = JsonToDataTable(feedingsCookie.Value);
                gvStaffReport.DataSource = feedingsDT;
                gvStaffReport.DataBind();
            }
        }

        private DataTable JsonToDataTable(string json)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            var rows = serializer.Deserialize<List<Dictionary<string, object>>>(json);

            DataTable dt = new DataTable();

            if (rows != null && rows.Count > 0)
            {
                foreach (var col in rows[0].Keys)
                {
                    dt.Columns.Add(col);
                }

                foreach (var row in rows)
                {
                    DataRow dr = dt.NewRow();
                    foreach (var col in row.Keys)
                    {
                        dr[col] = row[col];
                    }
                    dt.Rows.Add(dr);
                }
            }

            return dt;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMain.aspx");
        }
    }
}
