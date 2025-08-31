using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace BlueRiverZoo
{
    public partial class Reports : System.Web.UI.Page
    {
        private readonly string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindAnimals();
                BindFeedings();
            }
        }

       
        private void BindAnimals()
        {
            try
            {
                using (var con = new SqlConnection(connStr))
                using (var cmd = new SqlCommand())
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = con;
                    cmd.CommandText = @"SELECT Name, Species, Age, Gender, Habitat, ConservationStatus, ArrivalDate
                                        FROM AnimalsTable WHERE 1=1";

                    if (!string.IsNullOrWhiteSpace(txtSpecies.Text))
                    {
                        cmd.CommandText += " AND Species LIKE @Species";
                        cmd.Parameters.AddWithValue("@Species", "%" + txtSpecies.Text.Trim() + "%");
                    }

                    if (!string.IsNullOrWhiteSpace(txtHabitat.Text))
                    {
                        cmd.CommandText += " AND Habitat = @Habitat";
                        cmd.Parameters.AddWithValue("@Habitat", txtHabitat.Text.Trim());
                    }

                    var dt = new DataTable();
                    da.Fill(dt);

                    // Sorting
                    DataView dv = dt.DefaultView;
                    string sortExpr = ViewState["AnimalSortExpr"] as string;
                    string sortDir = ViewState["AnimalSortDir"] as string;

                    if (!string.IsNullOrEmpty(sortExpr) && !string.IsNullOrEmpty(sortDir))
                        dv.Sort = sortExpr + " " + sortDir;

                    gvAnimals.DataSource = dv;
                    gvAnimals.DataBind();

                    lblAnimalSummary.Text = $"Total animals: {dt.Rows.Count}";
                    ViewState["AnimalsDT"] = dt;
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error loading animals: {ex.Message}");
            }
        }

        protected void btnSearchAnimals_Click(object sender, EventArgs e)
        {
            BindAnimals();
        }

        protected void btnClearAnimals_Click(object sender, EventArgs e)
        {
            txtSpecies.Text = string.Empty;
            txtHabitat.Text = string.Empty;
            ViewState["AnimalSortExpr"] = null;
            ViewState["AnimalSortDir"] = null;
            BindAnimals();
        }

        protected void gvAnimals_Sorting(object sender, GridViewSortEventArgs e)
        {
            ToggleSort("AnimalSortExpr", "AnimalSortDir", e.SortExpression);
            BindAnimals();
        }

        protected void btnExportAnimals_Click(object sender, EventArgs e)
        {
            var dt = ViewState["AnimalsDT"] as DataTable;
            if (dt != null)
                ExportToExcel(dt, "AnimalReport.xls");
        }

        
        private void BindFeedings()
        {
            try
            {
                using (var con = new SqlConnection(connStr))
                using (var cmd = new SqlCommand())
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.Connection = con;
                    cmd.CommandText = @"SELECT Animal, FeedingTime, Keeper, FoodItems FROM FeedingTable WHERE 1=1";

                    // Parse dates safely with culture invariance
                    DateTime fromDate, toDate;
                    if (!string.IsNullOrWhiteSpace(txtFrom.Text) &&
                        DateTime.TryParse(txtFrom.Text, CultureInfo.InvariantCulture,
                        DateTimeStyles.None, out fromDate))
                    {
                        cmd.CommandText += " AND FeedingTime >= @From";
                        cmd.Parameters.AddWithValue("@From", fromDate);
                    }

                    if (!string.IsNullOrWhiteSpace(txtTo.Text) &&
                        DateTime.TryParse(txtTo.Text, CultureInfo.InvariantCulture,
                        DateTimeStyles.None, out toDate))
                    {
                        toDate = toDate.Date.AddDays(1).AddTicks(-1);
                        cmd.CommandText += " AND FeedingTime <= @To";
                        cmd.Parameters.AddWithValue("@To", toDate);
                    }

                    if (!string.IsNullOrWhiteSpace(txtAnimalSearch.Text))
                    {
                        cmd.CommandText += " AND Animal LIKE @Animal";
                        cmd.Parameters.AddWithValue("@Animal", "%" + txtAnimalSearch.Text.Trim() + "%");
                    }

                    var dt = new DataTable();
                    da.Fill(dt);

                    // Sorting
                    DataView dv = dt.DefaultView;
                    string sortExpr = ViewState["FeedSortExpr"] as string;
                    string sortDir = ViewState["FeedSortDir"] as string;

                    if (!string.IsNullOrEmpty(sortExpr) && !string.IsNullOrEmpty(sortDir))
                        dv.Sort = sortExpr + " " + sortDir;

                    gvFeedings.DataSource = dv;
                    gvFeedings.DataBind();

                    lblFeedingSummary.Text = $"Total feedings: {dt.Rows.Count}";
                    ViewState["FeedingsDT"] = dt;
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error loading feedings: {ex.Message}");
            }
        }

        protected void btnFilterFeedings_Click(object sender, EventArgs e)
        {
            ValidateDateInputs();
            BindFeedings();
        }

        protected void btnClearFeedings_Click(object sender, EventArgs e)
        {
            txtFrom.Text = string.Empty;
            txtTo.Text = string.Empty;
            txtAnimalSearch.Text = string.Empty;
            ViewState["FeedSortExpr"] = null;
            ViewState["FeedSortDir"] = null;
            BindFeedings();
        }

        protected void gvFeedings_Sorting(object sender, GridViewSortEventArgs e)
        {
            ToggleSort("FeedSortExpr", "FeedSortDir", e.SortExpression);
            BindFeedings();
        }

        protected void btnExportFeedings_Click(object sender, EventArgs e)
        {
            var dt = ViewState["FeedingsDT"] as DataTable;
            if (dt != null)
                ExportToExcel(dt, "FeedingReport.xls");
        }

        
        private void ToggleSort(string exprKey, string dirKey, string newExpr)
        {
            var currentExpr = ViewState[exprKey] as string;
            var currentDir = ViewState[dirKey] as string ?? "ASC";

            if (string.Equals(currentExpr, newExpr, StringComparison.OrdinalIgnoreCase))
                ViewState[dirKey] = currentDir.Equals("ASC", StringComparison.OrdinalIgnoreCase) ? "DESC" : "ASC";
            else
            {
                ViewState[exprKey] = newExpr;
                ViewState[dirKey] = "ASC";
            }
        }

        private void ExportToExcel(DataTable dt, string fileName)
        {
            try
            {
                var gv = new GridView { DataSource = dt };
                gv.DataBind();

                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", $"attachment;filename={fileName}");
                Response.ContentType = "application/vnd.ms-excel";
                Response.Charset = "";

                using (var sw = new StringWriter())
                using (var htw = new HtmlTextWriter(sw))
                {
                    gv.RenderControl(htw);
                    Response.Output.Write(sw.ToString());
                }
                Response.Flush();
                Response.End();
            }
            catch (Exception ex)
            {
                ShowMessage($"Error exporting to Excel: {ex.Message}");
            }
        }

        protected void ValidateDateInputs()
        {
            if (!string.IsNullOrWhiteSpace(txtFrom.Text) && !IsValidDate(txtFrom.Text))
            {
                ShowMessage("Please enter a valid 'From' date format (MM/DD/YYYY)");
                return;
            }

            if (!string.IsNullOrWhiteSpace(txtTo.Text) && !IsValidDate(txtTo.Text))
            {
                ShowMessage("Please enter a valid 'To' date format (MM/DD/YYYY)");
                return;
            }
        }

        private bool IsValidDate(string dateString)
        {
            DateTime result;
            return DateTime.TryParse(dateString, CultureInfo.InvariantCulture, DateTimeStyles.None, out result);
        }

        private void ShowMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert",
                $"alert('{message.Replace("'", "\\'")}');", true);
        }

        // Required when exporting controls rendered outside a form runat=server
        public override void VerifyRenderingInServerForm(Control control)
        {
            // Intentionally empty
        }
    }
}