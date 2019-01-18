using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.BankManagement
{
    public partial class CreateBranch : System.Web.UI.Page
    {
        private void getbankBranches(string id)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;

                cmd.CommandText = @"SELECT * from brgyuacs where RegionID='" + id + "'";
                SqlDataReader dr = cmd.ExecuteReader();
                ddlUACS.DataSource = dr;
                ddlUACS.DataTextField = "UACS";
                ddlUACS.DataValueField = "UACS";

                ddlUACS.DataBind();
                dr.Close();
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlUACS_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlRegionalOffice_SelectedIndexChanged(object sender, EventArgs e)
        {
            getbankBranches(ddlRegionalOffice.SelectedValue);
        }

        protected void ddlbanks_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlRegionalOffice_DataBound(object sender, EventArgs e)
        {
            getbankBranches(ddlRegionalOffice.SelectedValue);

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select * from BankBranch where Branchname = @bankname";
                cmd.Parameters.AddWithValue("@bankname", txtBranchname.Text);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    cmd.CommandText = "Insert into bankBranch values(@BranchName,@BranchCode,@BranchUACSCode,@BTrRegional,@Address,@BankID,@CreatorID,'For Approval',@Remarks)";
                    cmd.Parameters.AddWithValue("@BranchName", txtBranchname.Text);
                    cmd.Parameters.AddWithValue("@BranchCode", txtBranchCode.Text);
                    cmd.Parameters.AddWithValue("@BranchUACSCode", ddlUACS.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@BTrRegional", ddlRegionalOffice.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@BankID", ddlbanks.SelectedValue);
                    cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                    cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);

                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Registration successful!');window.location='BranchList.aspx';</script>'");

                }
                con.Close();

            }
        }
    }
}