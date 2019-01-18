using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.AgencyManagement
{
    public partial class AgencyList : System.Web.UI.Page
    {
        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"Select * from Agency where creationstatus = 'Approved'";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvAgency.DataSource = ds;
                lvAgency.DataBind();
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getUserBanks();

            }
        }
        protected void lvAgency_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpAgency.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }

        protected void lvAgency_DataBound(object sender, EventArgs e)
        {
            dpAgency.Visible = dpAgency.PageSize < dpAgency.TotalRowCount;

        }
    }
}