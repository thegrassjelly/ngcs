using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.RevenueCodeManagement
{
    public partial class RevenueCodeList : System.Web.UI.Page
    {
        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"Select * from RevenueCode where creationstatus = 'Approved'";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvRevCode.DataSource = ds;
                lvRevCode.DataBind();
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
        protected void lvRevCode_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpRevCode.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }

        protected void lvRevCode_DataBound(object sender, EventArgs e)
        {
            dpRevCode.Visible = dpRevCode.PageSize < dpRevCode.TotalRowCount;

        }
    }
}