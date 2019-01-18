using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.FundSourceManagement
{
    public partial class CreateFundSource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select * from FundSource where Description = @name";
                cmd.Parameters.AddWithValue("@name", txtShortDesc.Text);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    cmd.CommandText = "Insert into FundSource(Code,RevenueUACS,Description,Remarks,Status,CreatorID,CreationStatus) values(@Code,@RevenueUACS,@Description,@Remarks,@Status,@CreatorID,'For Approval')";
                    cmd.Parameters.AddWithValue("@Code", txtFundSource.Text);
                    cmd.Parameters.AddWithValue("@RevenueUACS", txtRevenueUACS.Text);
                    cmd.Parameters.AddWithValue("@Description", txtShortDesc.Text);
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
         
                    cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);


                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Registration successful!');window.location='FundSourceList.aspx';</script>'");

                }
                con.Close();

            }
        }
    }
}