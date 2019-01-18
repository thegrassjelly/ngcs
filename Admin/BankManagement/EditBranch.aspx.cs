using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.BankManagement
{
    public partial class EditBranch : System.Web.UI.Page
    {
        private void getBankInfo()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from bankbranch where bankbranchID=@UserID ";
                cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    txtAddress.Text = dr["Address"].ToString();
                    txtBranchCode.Text = dr["BranchCode"].ToString();
                    txtBranchname.Text = dr["BranchName"].ToString();
                    txtRemarks.Text = dr["Remarks"].ToString();
                    ddlbanks.SelectedValue = dr["bankid"].ToString();
                    ddlRegionalOffice.SelectedValue  = dr["BTrRegional"].ToString();
                    ddlUACS.SelectedValue = dr["BranchUACSCode"].ToString();
                }
                con.Close();
            }
        }
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
            if (!IsPostBack)
            {
                getBankInfo();

            }
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
          
                    cmd.CommandText = "update bankBranch set BranchName=@BranchName,BranchCode=@BranchCode,BranchUACSCode=@BranchUACSCode,BTrRegional=@BTrRegional,Address=@Address,BankID=@BankID,CreatorID=@CreatorID,remarks=@Remarks,CreationStatus='For Approval' where bankbranchID=@ID";
                    cmd.Parameters.AddWithValue("@BranchName", txtBranchname.Text);
                    cmd.Parameters.AddWithValue("@BranchCode", txtBranchCode.Text);
                    cmd.Parameters.AddWithValue("@BranchUACSCode", ddlUACS.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@BTrRegional", ddlRegionalOffice.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    cmd.Parameters.AddWithValue("@BankID", ddlbanks.SelectedValue);
                    cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                    cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
                    cmd.Parameters.AddWithValue("@ID",Request.QueryString["ID"].ToString());

                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Successfully Updated!');window.location='BranchList.aspx';</script>'");
                con.Close();
     
               

            }
        }
    }
}