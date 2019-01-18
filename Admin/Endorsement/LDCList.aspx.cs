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
    public partial class LDCList : System.Web.UI.Page
    {
        private void getData()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                lvFundSource.DataSource = null;
                con.Open();
                cmd.CommandText = @"select a.LDCID,a.CreationDate,a.Status,b.UserName,a.remarks,a.creationStatus from LDC as a,Users as b where b.UserID = a.CreatorID";
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
        private void getDataForApproval(string status)
        {
            lvFundSource.DataSource = null;
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.LDCID,a.CreationDate,a.Status,b.UserName,a.remarks,a.status from LDC as a,Users as b where b.UserID = a.CreatorID and a.status=@Status";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Parameters.AddWithValue("@Status", status);
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

        //protected void getRemarks(string ldcid)
        //{
        //    lvFundSource.DataSource = null;
        //    using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        //    using (SqlCommand cmd = new SqlCommand())
        //    {
        //        con.Open();
        //        cmd.CommandText = @"select a.Remarks, b.username, a.remarksDate from EndorsementRemarks as a, Users as b where a.userid = b.userid and LDCID=@LDCID";
        //        cmd.Parameters.AddWithValue("@LDCID", ldcid);
        //        cmd.Connection = con;
        //        SqlDataAdapter da = new SqlDataAdapter();
        //        da.SelectCommand = cmd;
        //        DataSet ds = new DataSet();
        //        da.Fill(ds, "UserBank");
        //        lvRemarks.DataSource = ds;
        //        lvRemarks.DataBind();
        //        con.Close();
        //    }
        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["status"] != null && Request.QueryString["status"]== "EndorsementApproval")
            {
                getDataForApproval("EndorsementApproval");
            }
           else if (Request.QueryString["status"] != null && Request.QueryString["status"] == "Endorsed")
            {
                getDataForApproval("Endorsed");
            }
            else if (Request.QueryString["status"] != null && Request.QueryString["status"] == "EndorsedToRO")
            {
                getDataForApproval("EndorsedToRO");
            }
            else if (Request.QueryString["status"] != null && Request.QueryString["status"] == "EndorsedToDOPO")
            {
                getDataForApproval("EndorsedToDOPO");
            }
            else if (Request.QueryString["status"] != null && Request.QueryString["status"] == "EndorsedToAgency")
            {
                getDataForApproval("EndorsedToAgency");
            }
            else if (Request.QueryString["status"] != null && Request.QueryString["status"] == "AdjustmentConfirmation")
            {
                getDataForApproval("AdjustmentConfirmation");
            }
            else if (Request.QueryString["status"] != null && Request.QueryString["status"] == "Confirmation")
            {
                getDataForApproval("For Confirmation");
            }
            else
            getData();
        }

        protected void lvFundSource_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Literal ltLDCID = (Literal)e.Item.FindControl("ltLDCID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;

                if (e.CommandName == "endorse")
                {

                    cmd.Connection = con;
                    cmd.CommandText = "Update LDC set Status='EndorsedToRO' where LDCID=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltLDCID.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                   

                }
                if (e.CommandName == "view")
                {

                    Response.Redirect("ViewLDC.aspx?ID=" + ltLDCID.Text);


                }
                if (e.CommandName == "reject")
                {
                    //   cmd.Connection = con;
                    //   cmd.CommandText = "Update LDC set Status='Approved' and remarks = @remarks where LDCID=@SODID";
                    //   cmd.Parameters.AddWithValue("@remarks", ltLDCID.Text);
                    //   cmd.Parameters.AddWithValue("@SODID", ltLDCID.Text);
                    ////   cmd.ExecuteNonQuery();
                    //   con.Close();
                 // getRemarks(ltLDCID.Text);
                  // this.ModalPopupExtender1.Show();
               
                }

                con.Close();
            }
        }
        protected void lvRemarks_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }
        protected void lvFundSource_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }

        protected void lvFundSource_DataBound(object sender, EventArgs e)
        {

        }
        protected void lvRemarks_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }

        protected void lvRemarks_DataBound(object sender, EventArgs e)
        {

        }
        protected void btnYes_Click(object sender, EventArgs e)
        {

        }
    }
}