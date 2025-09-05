using System;
using System.Data;
using System.Web.UI.WebControls;

namespace BlueRiverZoo
{
    public partial class AdminBreedingPrograms : System.Web.UI.Page
    {
        // Temporary in-memory data (in a real project, bind from a database)
        private static DataTable breedingTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                BindGrid();
            }
        }

        private void LoadData()
        {
            if (breedingTable == null)
            {
                breedingTable = new DataTable();
                breedingTable.Columns.Add("AnimalID", typeof(int));
                breedingTable.Columns.Add("Name", typeof(string));
                breedingTable.Columns.Add("Species", typeof(string));
                breedingTable.Columns.Add("Gender", typeof(string));
                breedingTable.Columns.Add("HasBred", typeof(bool));

                // Dummy data
                breedingTable.Rows.Add(1, "Leo", "Lion", "Male", true);
                breedingTable.Rows.Add(2, "Maya", "Elephant", "Female", false);
                breedingTable.Rows.Add(3, "Kiki", "Giraffe", "Female", true);
                breedingTable.Rows.Add(4, "Max", "Zebra", "Male", false);
            }
        }

        private void BindGrid()
        {
            gvBreeding.DataSource = breedingTable;
            gvBreeding.DataBind();
        }

        protected void gvBreeding_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvBreeding.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvBreeding_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvBreeding.EditIndex = -1;
            BindGrid();
        }

        protected void gvBreeding_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int animalId = Convert.ToInt32(gvBreeding.DataKeys[e.RowIndex].Value);

            GridViewRow row = gvBreeding.Rows[e.RowIndex];

            string name = ((TextBox)row.FindControl("txtName")).Text;
            string species = ((TextBox)row.FindControl("txtSpecies")).Text;
            string gender = ((TextBox)row.FindControl("txtGender")).Text;
            bool hasBred = ((CheckBox)row.FindControl("chkHasBred")).Checked;

            // Update the DataTable
            foreach (DataRow dr in breedingTable.Rows)
            {
                if ((int)dr["AnimalID"] == animalId)
                {
                    dr["Name"] = name;
                    dr["Species"] = species;
                    dr["Gender"] = gender;
                    dr["HasBred"] = hasBred;
                    break;
                }
            }

            gvBreeding.EditIndex = -1;
            BindGrid();
        }

        protected void gvBreeding_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBreeding.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void gvBreeding_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataView dv = breedingTable.DefaultView;
            string sortDirection = "ASC";

            if (ViewState["SortExpression"] != null && ViewState["SortDirection"] != null)
            {
                if (ViewState["SortExpression"].ToString() == e.SortExpression &&
                    ViewState["SortDirection"].ToString() == "ASC")
                {
                    sortDirection = "DESC";
                }
            }

            dv.Sort = e.SortExpression + " " + sortDirection;
            gvBreeding.DataSource = dv;
            gvBreeding.DataBind();

            ViewState["SortExpression"] = e.SortExpression;
            ViewState["SortDirection"] = sortDirection;
        }

        protected void gvBreeding_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
