using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.Collection
{
    public partial class CollectionList : System.Web.UI.Page
    {
        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from Collection";
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
     
        protected void Page_Load(object sender, EventArgs e)
        {
            getUserBanks();
           
        }
        protected void lvFundSource_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            Literal ltCollectionID = (Literal)e.Item.FindControl("ltCollectionID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
            
                if (e.CommandName == "cancelor")
                {
                    
                    cmd.Connection = con;
                    cmd.CommandText = "Update Collection set CreationStatus='Cancelled' where CollectionID=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltCollectionID.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    getUserBanks();

                }
                if (e.CommandName == "viewdetails")
                    Response.Redirect("CollectionDetails.aspx?ID=" + ltCollectionID.Text);
                    con.Close();
            }
        }
        protected void lvFundSource_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpFundSource.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }

        protected void lvFundSource_DataBound(object sender, EventArgs e)
        {
            dpFundSource.Visible = dpFundSource.PageSize < dpFundSource.TotalRowCount;

        }

        protected void btnYes_Click(object sender, EventArgs e)
        {

        }
    }
}