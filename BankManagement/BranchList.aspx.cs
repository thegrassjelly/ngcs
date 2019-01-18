using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.BankManagement
{
    public partial class BranchList : System.Web.UI.Page
    {
        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"Select b.bankbranchID, a.bankname,b.branchname,b.branchcode,b.BranchUACSCode,c.regionname,b.remarks from banks as a,bankbranch as b, region as c where a.bankID = b.bankID and b.BTrRegional=c.regioncode and b.creationstatus = 'Approved'";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvBankBranch.DataSource = ds;
                lvBankBranch.DataBind();
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
        protected void lvBankBranch_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpBranch.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }

        protected void lvBankBranch_DataBound(object sender, EventArgs e)
        {
            dpBranch.Visible = dpBranch.PageSize < dpBranch.TotalRowCount;

        }
    }
}