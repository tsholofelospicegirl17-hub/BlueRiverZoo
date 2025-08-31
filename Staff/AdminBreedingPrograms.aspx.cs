using System;
using System.Data;
using System.Web.UI.WebControls;

namespace BlueRiverZoo
{
    public partial class AdminBreedingPrograms : System.Web.UI.Page
    {
        
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
            string name = ((TextBox)row.Cells[1].Controls[0]).Text;
            string species = ((TextBox)row.Cells[2].Controls[0]).Text;
            string gender = ((TextBox)row.Cells[3].Controls[0]).Text;
            bool hasBred = ((CheckBox)row.Cells[4].Controls[0]).Checked;

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
    }
}
