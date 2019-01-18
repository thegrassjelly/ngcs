using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.Endorsement
{
    public partial class ReportValidation : System.Web.UI.Page
    {
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
        private void generateDecrepancy()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;

                cmd.CommandText = @"SELECT count(*) as ldccount from LDC as a,users as b where a.Status='Endorsed' and a.creatorID = b.UserID and b.HomeAgencyID=@HomeAgencyID and a.CreditedDate=@creditedDate and a.bankID=@bankID and a.bankbranchID=@branchID or a.Status='Approved'";
                cmd.Parameters.AddWithValue("@HomeAgencyID", ddlAgency.SelectedValue);
                cmd.Parameters.AddWithValue("@creditedDate", txtDateCredited.Text);

                cmd.Parameters.AddWithValue("@bankID", ddlbanks.SelectedValue);

                cmd.Parameters.AddWithValue("@branchID", ddlBranch.SelectedValue);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    lbldiscrepancy.Text = dr["ldccount"].ToString();
                    btnViewdiscrepancy.Visible = true;
                }
                else
                    btnViewdiscrepancy.Visible = false;
                dr.Close();
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ddlbanks_DataBound(object sender, EventArgs e)
        {
            getbankBranches(int.Parse(ddlbanks.SelectedValue.ToString()));

        }

        protected void ddlbanks_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["bank"] = ddlbanks.SelectedValue.ToString();

            getbankBranches(int.Parse(ddlbanks.SelectedValue.ToString()));


            generateDecrepancy();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            generateDecrepancy();
        }

        protected void ddlAgency_SelectedIndexChanged(object sender, EventArgs e)
        {

            generateDecrepancy();
        }

        protected void txtDateCredited_TextChanged(object sender, EventArgs e)
        {

            generateDecrepancy();
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {

            generateDecrepancy();
        }

        protected void btnViewdiscrepancy_Click(object sender, EventArgs e)
        {
            Session["agency"] = ddlAgency.SelectedItem.Text;
            Session["bank"] = ddlbanks.SelectedItem.Text;
            Session["date"] = txtDateCredited.Text;
            Session["branchid"] = ddlBranch.SelectedValue;
            Session["agencyid"] = ddlAgency.SelectedValue;
            Session["bankid"] = ddlbanks.SelectedValue;

            Session["branch"] = ddlBranch.SelectedItem.Text;
            Response.Redirect("DiscrepancyList.aspx");

        }
    }
}