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
    public partial class CreateCollection1 : System.Web.UI.Page
    {
        private void getCollectionCash()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.CollectionDetailsID,a.Type,a.DateOfCollection,a.Currency,a.Amount,a.AmountInorigCurrency,a.AmountInPHP, b.Code, c.name, d.Agency,a.Amount from CollectionDetails as a, FundSource as b, RevenueCode as c, HomeAgency as d where 
a.FundCodeID = b.FundSourceID and a.RevenueCodeID = c.RevenueCodeID and a.AgencyTobeCreditedID = d.HomeAgencyID and
 a.CreatorID = @CreatorID and a.CollectionID=0";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
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
        private void getTotal()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select sum(Amount) + sum(AmountInPHP) as total from CollectionDetails where collectionID=0 and creatorID = @CreatorID";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    decimal value; decimal a;
                    if (decimal.TryParse(dr["total"].ToString(), out value))
                    {
                        Convert.ToDecimal(string.Format("{0:F2}", dr["total"].ToString()));
                        a = decimal.Parse(dr["total"].ToString());
                    }
                    else
                        a = 0;
                    lbltotal.Text = a.ToString("0.00");
                }
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getCollectionCash();
            getTotal();
        }
        protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlType.SelectedValue == "Cash")
            {
                visDateCol.Visible = false;
                visOrigCur.Visible = false;
                visCurrency.Visible = false;
                visDateCol.Visible = false;
                vischeckNo.Visible = false;
                visLDDAP.Visible = false;
                visAmount.Visible = true;
                visForex.Visible = false;
                btnAdd.Text = "Add Cash";

                getCollectionCash();
         
             

            }
            if (ddlType.SelectedValue == "Forex")
            {
                visDateCol.Visible = true;
                visOrigCur.Visible = true;
                visCurrency.Visible = true;
                visDateCol.Visible = true;
                vischeckNo.Visible = false;
                visLDDAP.Visible = false;
                visForex.Visible = true;
                visAmount.Visible = false;
                btnAdd.Text = "Add Forex";
               

             
            }
            if (ddlType.SelectedValue == "Check")
            {
                visDateCol.Visible = false;
                visOrigCur.Visible = false;
                visCurrency.Visible = false;
                visDateCol.Visible = false;
                vischeckNo.Visible = true;
                visAmount.Visible = true;
                visForex.Visible = false;
                visLDDAP.Visible = false;
                btnAdd.Text = "Add Check";
           
             
            }
            if (ddlType.SelectedValue == "LDDAP-ADA")
            {
                visDateCol.Visible = false;
                visOrigCur.Visible = false;
                visCurrency.Visible = false;
                visDateCol.Visible = false;
                vischeckNo.Visible = false;
                visLDDAP.Visible = true;
                visAmount.Visible = true;
                visForex.Visible = false;
                btnAdd.Text = "Add LDDAP-ADA";
           
         
            }

        }
        protected void lvCollectionCash_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }

        protected void lvCollectionCash_DataBound(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {

                con.Open();
                cmd.Connection = con;
                if (ddlType.SelectedValue == "Cash")
                    cmd.CommandText = "Insert into CollectionDetails (Type,FundCodeID,RevenueCodeID,AgencyTobeCreditedID,Amount,CollectionID,CreatorID) values(@Type,@FundCodeID,@RevenueCodeID,@AgencyID,@Amount,0,@CreatorID)";

                else if (ddlType.SelectedValue == "Check")
                    cmd.CommandText = "Insert into CollectionDetails (Type,FundCodeID,RevenueCodeID,AgencyTobeCreditedID,Amount,CollectionID,CreatorID,CheckNo) values(@Type,@FundCodeID,@RevenueCodeID,@AgencyID,@Amount,0,@CreatorID,@CheckNumber)";
                else if (ddlType.SelectedValue == "Forex")
                    cmd.CommandText = "Insert into CollectionDetails (Type,FundCodeID,RevenueCodeID,AgencyTobeCreditedID,DateOfCollection,AmountInorigCurrency,Currency,AmountInPHP,CollectionID,CreatorID) values(@Type,@FundCodeID,@RevenueCodeID,@AgencyID,@CollectionDate,@AmountOrigCurrency,@Currency,@PHPAmount,0,@CreatorID)";
                else if (ddlType.SelectedValue == "LDDAP-ADA")
                    cmd.CommandText = "Insert into CollectionDetails (Type,FundCodeID,RevenueCodeID,AgencyTobeCreditedID,Amount,CollectionID,CreatorID,@LDDAPNumber) values(@Type,@FundCodeID,@RevenueCodeID,@AgencyID,@Amount,0,@CreatorID,@LDDAPNumber)";

                cmd.Parameters.AddWithValue("@Type", ddlType.SelectedValue);
                cmd.Parameters.AddWithValue("@CollectionDate", txtDateCol.Text);
                cmd.Parameters.AddWithValue("@FundCodeID", ddlFundCode.SelectedValue);
                cmd.Parameters.AddWithValue("@RevenueCodeID", ddlRevenue.SelectedValue);
                cmd.Parameters.AddWithValue("@AgencyID", ddlAgency.SelectedValue);
                cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
                cmd.Parameters.AddWithValue("@Currency", ddlCurrency.SelectedValue);
                cmd.Parameters.AddWithValue("@AmountOrigCurrency", txtAmountOrig.Text);

                cmd.Parameters.AddWithValue("@CheckNumber", txtCheckNo.Text);
            
        
                cmd.Parameters.AddWithValue("@Forex", txtForex.Text);
                cmd.Parameters.AddWithValue("@PHPAmount", txtAmountinPHP.Text);
                cmd.Parameters.AddWithValue("@LDDAPNumber", txtLDDAP.Text);


                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.ExecuteNonQuery();


                con.Close();

               getCollectionCash();
                getTotal();


            }
        }

        protected void lvCollectionCash_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Literal ltCollectionCashID = (Literal)e.Item.FindControl("ltCollectionDetailsID"); ;
      


            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                if (e.CommandName == "deleteua")
                {
                    cmd.CommandText = "DELETE FROM CollectionDetails WHERE CollectionDetailsID = @SODID";

                 
                    cmd.Parameters.AddWithValue("@SODID", ltCollectionCashID.Text);
                    cmd.ExecuteNonQuery();
                     getCollectionCash();
                 
                }
                con.Close();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {

                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "Insert into Collection values(@ORNumber,@TotalAmount,@CreatorID,@DateCreated,'For Approval','LDC NUMBER','For Approval')";
                cmd.Parameters.AddWithValue("@ORNumber", txtORNo.Text);
                cmd.Parameters.AddWithValue("@TotalAmount", txtTotalAmount.Text);
                cmd.Parameters.AddWithValue("@DateCreated", DateTime.Now);
                cmd.Parameters.AddWithValue("@CollectionType", ddlType.SelectedValue);


                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);



                cmd.ExecuteNonQuery();
                cmd.CommandText = "select top 1 CollectionID from Collection where creatorID = @CreatorID and CreationStatus = 'For Approval' Order by CollectionID Desc";
                string CollectionID = cmd.ExecuteScalar().ToString();
                cmd.CommandText = "update CollectionDetails Set CollectionID = @CollectionID where creatorID = @CreatorID and CollectionID=0";
                cmd.Parameters.AddWithValue("@CollectionID", CollectionID);
                cmd.ExecuteNonQuery();
              
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Creation successful!');window.location='CollectionList.aspx';</script>'");

            }
        } 
    }
}