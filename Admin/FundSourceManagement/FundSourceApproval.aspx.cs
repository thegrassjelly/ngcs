using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.FundSourceManagement
{
    public partial class FundSourceApproval : System.Web.UI.Page
    {
        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"Select * from FundSource where creationstatus = 'For Approval'";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvFundSource.DataSource = ds;
                lvFundSource.DataBind();
                con.Close();
            }
        }
        protected void lvFundSource_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            Literal ltUserID = (Literal)e.Item.FindControl("ltFundSourceID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                if (e.CommandName == "Approve")
                {
                    lblID.Text = ltUserID.Text;
                    this.Panel1_ModalPopupExtender.Show();
                      
                  
                }
                if (e.CommandName == "Disapprove")
                {
                    lblID1.Text = ltUserID.Text;
                    this.ModalPopupExtender1.Show();
                  
                }
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
        protected void lvFundSource_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpFundSource.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }

        protected void lvFundSource_DataBound(object sender, EventArgs e)
        {
            dpFundSource.Visible = dpFundSource.PageSize < dpFundSource.TotalRowCount;

        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "Update FundSource set CreationStatus='Approved' where FundSourceID=@SODID";

                cmd.Parameters.AddWithValue("@SODID", lblID.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                getUserBanks();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "Update FundSource set CreationStatus='Disapproved', Remarks=@Remarks where FundSourceID=@SODID";

                cmd.Parameters.AddWithValue("@SODID", lblID1.Text);
                cmd.Parameters.AddWithValue("@Remarks", txtReason.Text);
                cmd.ExecuteNonQuery();
                getUserBanks();
            }
           
        }
    }
}