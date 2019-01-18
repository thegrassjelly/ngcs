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
    public partial class CreateCollection : System.Web.UI.Page
    {
        private void getCollectionCash()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.collectionCashID, b.Code, c.name, d.Agency,a.Amount from CollectionCash as a, FundSource as b, RevenueCode as c, HomeAgency as d where 
a.FundCodeID = b.FundSourceID and a.RevenueCodeID = c.RevenueCodeID and a.AgencyID = d.HomeAgencyID and
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
        private void getCollectionCheck()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.collectionCheckID, b.Code, c.name, d.Agency,a.Amount,a.CheckNumber from CollectionCheck as a, FundSource as b, RevenueCode as c, HomeAgency as d where 
a.FundCodeID = b.FundSourceID and a.RevenueCodeID = c.RevenueCodeID and a.AgencyID = d.HomeAgencyID and
 a.CreatorID = @CreatorID and a.CollectionID=0";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvCollectionCheck.DataSource = ds;
                lvCollectionCheck.DataBind();
                con.Close();
            }
        }
        private void getCollectionLDDAP()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.collectionLDDAPID, b.Code, c.name, d.Agency,a.Amount from CollectionLDDAP as a, FundSource as b, RevenueCode as c, HomeAgency as d where 
a.FundCodeID = b.FundSourceID and a.RevenueCodeID = c.RevenueCodeID and a.AgencyID = d.HomeAgencyID and
 a.CreatorID = @CreatorID and a.CollectionID=0";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvCollectionLDDAP.DataSource = ds;
                lvCollectionLDDAP.DataBind();
                con.Close();
            }
        }
        private void getCollectionForex()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
       

                cmd.CommandText = @"select a.collectionForexID,a.CollectionDate, b.Code, c.name, d.Agency,a.AmountOrigCurrency,a.Currency,a.Forex,a.PHPAmount from CollectionForex as a, FundSource as b, RevenueCode as c, HomeAgency as d where 
a.FundCodeID = b.FundSourceID and a.RevenueCodeID = c.RevenueCodeID and a.AgencyID = d.HomeAgencyID and
 a.CreatorID = @CreatorID and a.CollectionID=0";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvCollectionForex.DataSource = ds;
                lvCollectionForex.DataBind();
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getCollectionCash();
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
                pnlCash.Visible = true;
                pnlCheck.Visible = false;
                pnlForex.Visible = false;
                pnlLDDAP.Visible = false;

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
                pnlLDDAP.Visible = false;
                pnlCash.Visible = false;
                pnlCheck.Visible = false;
                pnlForex.Visible = true;
               
                getCollectionForex();

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
                pnlCash.Visible = false;
                pnlCheck.Visible = true;
                pnlForex.Visible = false;
                pnlLDDAP.Visible = false;
                getCollectionCheck();
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
                pnlCash.Visible = false;
                pnlCheck.Visible = false;
                pnlForex.Visible = false;
                pnlLDDAP.Visible = true;
                getCollectionLDDAP();
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
                
                if(ddlType.SelectedValue=="Cash")
                     cmd.CommandText = "Insert into CollectionCash values(@FundCodeID,@RevenueCodeID,@AgencyID,@Amount,0,@CreatorID)";
              
                else if (ddlType.SelectedValue == "Check")
                    cmd.CommandText = "Insert into CollectionCheck values(@FundCodeID,@RevenueCodeID,@AgencyID,@Amount,0,@CreatorID,@CheckNumber)";
                else if (ddlType.SelectedValue == "Forex")
                    cmd.CommandText = "Insert into CollectionForex values(@FundCodeID,@RevenueCodeID,@AgencyID,@CollectionDate,@AmountOrigCurrency,@Currency,@Forex,@PHPAmount,0,@CreatorID)";
                else if (ddlType.SelectedValue == "LDDAP-ADA")
                    cmd.CommandText = "Insert into CollectionLDDAP values(@FundCodeID,@RevenueCodeID,@AgencyID,@Amount,0,@CreatorID,@LDDAPNumber)";

                cmd.Parameters.AddWithValue("@FundCodeID", ddlFundCode.SelectedValue);
                    cmd.Parameters.AddWithValue("@RevenueCodeID", ddlRevenue.SelectedValue);
                    cmd.Parameters.AddWithValue("@AgencyID", ddlAgency.SelectedValue);
                    cmd.Parameters.AddWithValue("@Amount", txtAmount.Text);
                cmd.Parameters.AddWithValue("@CheckNumber", txtCheckNo.Text);
                cmd.Parameters.AddWithValue("@CollectionDate", txtDateCol.Text);
                cmd.Parameters.AddWithValue("@AmountOrigCurrency", txtAmountOrig.Text);
                cmd.Parameters.AddWithValue("@Currency", ddlCurrency.SelectedValue);
                cmd.Parameters.AddWithValue("@Forex", txtForex.Text);
                cmd.Parameters.AddWithValue("@PHPAmount", txtAmountinPHP.Text);
                cmd.Parameters.AddWithValue("@LDDAPNumber", txtLDDAP.Text);


                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                    cmd.ExecuteNonQuery();

              
                con.Close();

                if (ddlType.SelectedValue == "Cash")
                    getCollectionCash();
                else if (ddlType.SelectedValue == "Check")
                    getCollectionCheck();
                else if (ddlType.SelectedValue == "Forex")
                    getCollectionForex();
                else if (ddlType.SelectedValue == "LDDAP-ADA")
                    getCollectionLDDAP();


            }
        }

        protected void lvCollectionCash_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Literal ltCollectionCashID = (Literal)e.Item.FindControl("ltCollectionCashID"); ;
            if (ddlType.SelectedValue == "Cash")
                ltCollectionCashID = (Literal)e.Item.FindControl("ltCollectionCashID");
            else if (ddlType.SelectedValue == "Check")
                 ltCollectionCashID = (Literal)e.Item.FindControl("ltCollectionCheckID");
            else if (ddlType.SelectedValue == "Forex")
                ltCollectionCashID = (Literal)e.Item.FindControl("ltCollectionForexID");
            else if (ddlType.SelectedValue == "LDDAP-ADA")
                ltCollectionCashID = (Literal)e.Item.FindControl("ltCollectionLDDAPID");


            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                if (e.CommandName == "deleteua")
                {
                    if (ddlType.SelectedValue == "Cash")
                        cmd.CommandText = "DELETE FROM CollectionCash WHERE CollectionCashID = @SODID";

                    else if (ddlType.SelectedValue == "Check")
                        cmd.CommandText = "DELETE FROM CollectionCheck WHERE CollectionCheckID = @SODID";
                    else if (ddlType.SelectedValue == "Forex")
                        cmd.CommandText = "DELETE FROM CollectionForex WHERE CollectionForexID = @SODID";
                    else 
                    if (ddlType.SelectedValue == "LDDAP-ADA")
                    { 
                        cmd.CommandText = "DELETE FROM CollectionLDDAP WHERE CollectionLDDAPID = @SODID";
                    }

                    cmd.Parameters.AddWithValue("@SODID", ltCollectionCashID.Text);
                    cmd.ExecuteNonQuery();
                     if (ddlType.SelectedValue == "Cash")
                    getCollectionCash();
                else if (ddlType.SelectedValue == "Check")
                    getCollectionCheck();
                else if (ddlType.SelectedValue == "Forex")
                    getCollectionForex();
                else if (ddlType.SelectedValue == "LDDAP-ADA")
                    getCollectionLDDAP();
                }
                con.Close();
            }
        }

        protected void lvCollectionCheck_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }

        protected void lvCollectionCheck_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }

        protected void lvCollectionCheck_DataBound(object sender, EventArgs e)
        {

        }

        protected void lvCollectionForex_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }

        protected void lvCollectionForex_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }

        protected void lvCollectionForex_DataBound(object sender, EventArgs e)
        {

        }

        protected void lvCollectionLDDAP_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }

        protected void lvCollectionLDDAP_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }

        protected void lvCollectionLDDAP_DataBound(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {

                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "Insert into Collection values(@ORNumber,@TotalAmount,@CreatorID,@DateCreated,@CollectionType,'For Approval')";
                cmd.Parameters.AddWithValue("@ORNumber", txtORNo.Text);
                cmd.Parameters.AddWithValue("@TotalAmount", txtTotalAmount.Text);
                cmd.Parameters.AddWithValue("@DateCreated", DateTime.Now);
                cmd.Parameters.AddWithValue("@CollectionType", ddlType.SelectedValue);


                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
             
             
              
                cmd.ExecuteNonQuery();
                cmd.CommandText = "select top 1 CollectionID from Collection where creatorID = @CreatorID and CreationStatus = 'For Approval' Order by CollectionID Desc";
                string CollectionID = cmd.ExecuteScalar().ToString();
                cmd.CommandText = "update CollectionCash Set CollectionID = @CollectionID where creatorID = @CreatorID and CollectionID=0";
                cmd.Parameters.AddWithValue("@CollectionID", CollectionID);
                cmd.ExecuteNonQuery();
                cmd.CommandText = "update CollectionCheck Set CollectionID = @CollectionID where creatorID = @CreatorID and CollectionID=0";
                cmd.ExecuteNonQuery();
                cmd.CommandText = "update CollectionForex Set CollectionID = @CollectionID where creatorID = @CreatorID and CollectionID=0";
                cmd.ExecuteNonQuery();
                cmd.CommandText = "update CollectionLDDAP Set CollectionID = @CollectionID where creatorID = @CreatorID and CollectionID=0";
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Creation successful!');window.location='CollectionList.aspx';</script>'");

            }
        }
    }
}