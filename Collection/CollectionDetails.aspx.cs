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
    public partial class CollectionDetails : System.Web.UI.Page
    {
        private void getCollectionCash()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.CollectionDetailsID,a.Type,a.DateOfCollection,a.Currency,a.Amount,a.AmountInorigCurrency,a.AmountInPHP, b.Code, c.name, d.Agency,a.Amount from CollectionDetails as a, FundSource as b, RevenueCode as c, HomeAgency as d where 
a.FundCodeID = b.FundSourceID and a.RevenueCodeID = c.RevenueCodeID and a.AgencyTobeCreditedID = d.HomeAgencyID and
 a.CreatorID = @CreatorID and a.CollectionID=@CollectionID";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Parameters.AddWithValue("@CollectionID",Request.QueryString["ID"].ToString());
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvCollectionCash.DataSource = ds;
                lvCollectionCash.DataBind();
                con.Close();
            }

        }
       
        private void getCollection()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from Collection where collectionID=@CollectionID";
                cmd.Parameters.AddWithValue("@CollectionID", Request.QueryString["ID"].ToString());
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblDate.Text = dr["DateCreated"].ToString();
                    lblORNumber.Text = dr["ORNumber"].ToString();
                    lblRemarks.Text = dr["Remarks"].ToString();
                    lblStatus.Text = dr["CreationStatus"].ToString();
                    lblTotal.Text = dr["TotalAmount"].ToString();
             
                }
                dr.Close();
           
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getCollectionCash();
            getCollection();
           
        }
    }
}