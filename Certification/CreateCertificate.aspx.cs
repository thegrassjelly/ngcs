using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.Certification
{
    public partial class CreateCertificate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime today = DateTime.Today;
            txtDateCredited.Text = today.ToString("yyyy-MM-dd");
            txtDateCreditedFrom.Text = today.ToString("yyyy-MM-dd");
            txtDateCreditedTo.Text = today.ToString("yyyy-MM-dd");
            txtDepDate.Text = today.ToString("yyyy-MM-dd");
            txtReqDate.Text = today.ToString("yyyy-MM-dd");
        }
        private void getbankBranches(int id)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;

                cmd.CommandText = @"SELECT * from BankBranch where  creationStatus='Approved' and bankID=" + id;
                SqlDataReader dr = cmd.ExecuteReader();
                ddlBranch.DataSource = dr;
                ddlBranch.DataTextField = "BranchName";
                ddlBranch.DataValueField = "BankBranchID";
                ddlBranch.DataBind();
                dr.Close();
                con.Close();
            }
        }
        protected void ddlbanks_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["bank"] = ddlbanks.SelectedValue.ToString();

            getbankBranches(int.Parse(ddlbanks.SelectedValue.ToString()));


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "insert into Certificates values(@RequestNo,@DateRequested,@DateCreatedFrom,@DateCreatedTo,@BankID,@bankBranchID,@AgencyID,@OrganizationCode,@FundCodeID,@DepositDate,@DateCredited,@Amount,@VolumeOfTransaction,@CreatorID,'For Approval')";
                cmd.Parameters.AddWithValue("@RequestNo", txtRequestNo.Text);
                cmd.Parameters.AddWithValue("@DepositDate", txtDepDate.Text);
                cmd.Parameters.AddWithValue("@DateRequested", txtReqDate.Text);
                cmd.Parameters.AddWithValue("@DateCreatedFrom", txtDateCreditedFrom.Text);
                cmd.Parameters.AddWithValue("@DateCreatedTo", txtDateCreditedTo.Text);
                cmd.Parameters.AddWithValue("@BankID", ddlbanks.SelectedValue);
                cmd.Parameters.AddWithValue("@bankBranchID", ddlBranch.SelectedValue);
                cmd.Parameters.AddWithValue("@AgencyID", ddlAgency.SelectedValue);
                cmd.Parameters.AddWithValue("@OrganizationCode", txtOrgCode.Text);
                cmd.Parameters.AddWithValue("@FundCodeID", ddlFundSource.SelectedValue);
                cmd.Parameters.AddWithValue("@DateCredited", txtDateCredited.Text);
                cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
                cmd.Parameters.AddWithValue("@VolumeOfTransaction", ddlVolumeOfTransaction.SelectedValue);
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("CertificateList.aspx");
            }
        }
    }
}