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
    public partial class BankApproval : System.Web.UI.Page
    {
        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"Select * from banks where creationstatus = 'For Approval'";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvBank.DataSource = ds;
                lvBank.DataBind();
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
        protected void lvBank_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            Literal ltUserID = (Literal)e.Item.FindControl("ltBankID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                if (e.CommandName == "Approve")
                {
                    cmd.CommandText = "Update Banks set CreationStatus='Approved' where BankID=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltUserID.Text);
                    cmd.ExecuteNonQuery();
                    getUserBanks();
                }
                if (e.CommandName == "Disapprove")
                {
                    cmd.CommandText = "Update Banks set CreationStatus='Disapproved' where BankID=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltUserID.Text);
                    cmd.ExecuteNonQuery();
                    getUserBanks();
                }
                con.Close();
            }
        }

        protected void lvBank_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpBank.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }

        protected void lvBank_DataBound(object sender, EventArgs e)
        {
            dpBank.Visible = dpBank.PageSize < dpBank.TotalRowCount;

        }
    }
}