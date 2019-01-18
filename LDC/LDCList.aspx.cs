using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.LDC
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
                cmd.CommandText = @"select a.LDCID,a.CreationDate,a.Status,b.UserName,a.remarks,a.creationStatus from LDC as a,Users as b where b.UserID = a.CreatorID ";
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
                cmd.CommandText = @"select a.LDCID,a.CreationDate,a.Status,b.UserName,a.remarks,a.creationStatus from LDC as a,Users as b where b.UserID = a.CreatorID and a.CreationStatus=@Status";
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["status"] != null && Request.QueryString["status"]== "Approval")
            {
                getDataForApproval("For Approval");
            }
           else if (Request.QueryString["status"] != null && Request.QueryString["status"] == "Rejected")
            {
                getDataForApproval("Rejected");
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

                if (e.CommandName == "cancelor")
                {

                    cmd.Connection = con;
                    cmd.CommandText = "Update Collection set CreationStatus='Cancelled' where CollectionID=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltLDCID.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                   

                }
                if (e.CommandName == "edit")
                    Response.Redirect("EditLDC.aspx?ID=" + ltLDCID.Text);
                con.Close();
            }
        }

        protected void lvFundSource_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }

        protected void lvFundSource_DataBound(object sender, EventArgs e)
        {

        }
        protected void btnYes_Click(object sender, EventArgs e)
        {

        }
    }
}