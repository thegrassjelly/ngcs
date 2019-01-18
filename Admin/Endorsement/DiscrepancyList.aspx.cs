using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.Endorsement
{
    public partial class DescrepancyList : System.Web.UI.Page
    {
        private void getList()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.LDCNumber,a.totalamount,Status from Collection as a,LDC as b where b.Status='EndorsementApproval' and CONVERT(varchar(10), b.LDCID) = a.LDCNumber and b.CreditedDate=@creditedDate and b.bankID=@bankID and b.bankbranchID=@branchID or b.Status='Approved'";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Parameters.AddWithValue("@HomeAgencyID", Session["agencyid"].ToString());
                cmd.Parameters.AddWithValue("@creditedDate", Session["date"].ToString());

                cmd.Parameters.AddWithValue("@bankID", Session["bankid"].ToString());

                cmd.Parameters.AddWithValue("@branchID", Session["branchid"].ToString());
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvform.DataSource = ds;
                lvform.DataBind();
                con.Close();
            }
        }
        private void getAmount()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"SELECT sum(c.totalamount) as amount from LDC as a,users as b,collection as c where a.creatorID = b.UserID and  a.Status='EndorsementApproval' and CONVERT(varchar(10), a.LDCID) = c.LDCNumber and b.HomeAgencyID=@HomeAgencyID and a.CreditedDate=@creditedDate and a.bankID=@bankID and a.bankbranchID=@branchID or a.Status='Approved'";
                cmd.Parameters.AddWithValue("@HomeAgencyID", Session["agencyid"].ToString());
                cmd.Parameters.AddWithValue("@creditedDate", Session["date"].ToString());

                cmd.Parameters.AddWithValue("@bankID", Session["bankid"].ToString());

                cmd.Parameters.AddWithValue("@branchID", Session["branchid"].ToString());
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblAmount.Text = dr["amount"].ToString();
                }
                dr.Close();
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            lblBank.Text = Session["bank"].ToString();
            lblBranch.Text = Session["branch"].ToString();
            lblDate.Text = Session["date"].ToString();
            getAmount();
            getList();
        }

        protected void lvform_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Literal ltID = (Literal)e.Item.FindControl("ltID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                if (e.CommandName == "endorse")
                {
                    cmd.CommandText = "update LDC set status='EndorsementApproval'  WHERE LDCID = @SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltID.Text);
                    cmd.ExecuteNonQuery();
                    getList();
                }
                if (e.CommandName == "view")
                {
                    Response.Redirect("../LDC/ViewLDC.aspx?ID=" + ltID.Text);
                }

                con.Close();
            }
        }

        protected void lvform_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }

        protected void lvform_DataBound(object sender, EventArgs e)
        {

        }
    }
}