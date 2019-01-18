using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.FundSourceManagement
{
    public partial class EditFundSource : System.Web.UI.Page
    {
        private void getBankInfo()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from FundSource where FundSourceID=@UserID ";
                cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    txtFundSource.Text = dr["Code"].ToString();
                    txtRevenueUACS.Text = dr["RevenueUACS"].ToString();
                  txtShortDesc.Text = dr["Description"].ToString();
                    ddlStatus.SelectedValue = dr["Status"].ToString();
                    txtRemarks.Text = dr["Remarks"].ToString();

                }
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getBankInfo();

            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
               
                   
                    cmd.CommandText = @"Update FundSource set Code=@Code,RevenueUACS=@RevenueUACS,Description=@Description,Status=@Status,Remarks=@Remarks,
                      creatorID=@creatorID,CreationStatus='For Approval' where FundSourceID = @FundSourceID";
                cmd.Parameters.AddWithValue("@Code", txtFundSource.Text);
                cmd.Parameters.AddWithValue("@RevenueUACS", txtRevenueUACS.Text);
                cmd.Parameters.AddWithValue("@Description", txtShortDesc.Text);
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);

             

                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                    cmd.Parameters.AddWithValue("@FundSourceID", Request.QueryString["ID"].ToString());

                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Succesfully updated!');window.location='FundSourceList.aspx';</script>'");
                con.Close();
            }
              

            
        }
    }
}