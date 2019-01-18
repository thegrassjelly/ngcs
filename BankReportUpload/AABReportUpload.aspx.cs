using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.BankReportUpload
{
    public partial class AABReportUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getUserBanks();
        }
        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from [draftAABBankUpload]";
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
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            FileUpload1.SaveAs(Server.MapPath("~/uploads/bankUpload/" + FileUpload1.FileName));
            string filename = Server.MapPath("~/uploads/bankUpload/" + FileUpload1.FileName);
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = @"BULK INSERT[draftAABBankUpload] FROM '" + filename + "' WITH ( FIRSTROW = 2, FIELDTERMINATOR = ',', ROWTERMINATOR = '\n')";
                cmd.ExecuteNonQuery();
                con.Close();
            }
            getUserBanks();

        }

        protected void lvFundSource_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Literal ltORID = (Literal)e.Item.FindControl("ltORID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                if (e.CommandName == "deleteRecord")
                {
                    cmd.CommandText = "delete from draftAABBankUpload where ORNumber=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltORID.Text);
                    cmd.ExecuteNonQuery();
                    getUserBanks();
                }
               
                con.Close();
            }
        }

        protected void lvFundSource_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }

        protected void lvFundSource_DataBound(object sender, EventArgs e)
        {

        }
    }
}