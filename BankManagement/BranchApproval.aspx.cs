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
    public partial class BranchApproval : System.Web.UI.Page
    {
        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"Select b.bankbranchID, a.bankname,b.branchname,b.branchcode,b.BranchUACSCode,c.regionname,b.remarks from banks as a,bankbranch as b, region as c where a.bankID = b.bankID and b.BTrRegional=c.regioncode and b.creationstatus = 'For Approval'";
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
        protected void lvBankBranch_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            Literal ltBranchID = (Literal)e.Item.FindControl("ltBranchID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                if (e.CommandName == "Approve")
                {
                    cmd.CommandText = "Update BankBranch set CreationStatus='Approved' where BankBranchID=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltBranchID.Text);
                    cmd.ExecuteNonQuery();
                    getUserBanks();
                }
                if (e.CommandName == "Disapprove")
                {
                    cmd.CommandText = "Update BankBranch set CreationStatus='Disapproved' where BankBranchID=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltBranchID.Text);
                    cmd.ExecuteNonQuery();
                    getUserBanks();
                }
                con.Close();
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