﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BlueRiverZoo
{
    public partial class VisitorMyReservations : System.Web.UI.Page
    {
        
        string connStr = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Animals.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["VisitorID"] == null)
            {
                Response.Redirect("VisitorLogin.aspx"); //redirect if not logged in
                return;
            }

            if (!IsPostBack)
                LoadReservations();
        }

        private void LoadReservations()
        {
            int visitorID = Convert.ToInt32(Session["VisitorID"]);

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string sql = "SELECT * FROM Reservations WHERE VisitorID=@VisitorID";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                da.SelectCommand.Parameters.AddWithValue("@VisitorID", visitorID);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvReservations.DataSource = dt;
                gvReservations.DataBind();
            }
        }

        protected void gvReservations_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int reservationID = Convert.ToInt32(e.CommandArgument);
            int visitorID = Convert.ToInt32(Session["VisitorID"]);

            if (e.CommandName == "CancelRes")
            {
                using (SqlConnection con = new SqlConnection(connStr))
                {
                    string sql = "UPDATE Reservations SET Status='Cancelled' WHERE ReservationID=@ReservationID AND VisitorID=@VisitorID";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@ReservationID", reservationID);
                    cmd.Parameters.AddWithValue("@VisitorID", visitorID);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Reservation cancelled successfully.";
                LoadReservations();
            }
            else if (e.CommandName == "ViewTicket")
            {
                Response.Redirect("VisitorTicket.aspx?id=" + reservationID);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("VisitorWelcome.aspx");
        }
    }
}
