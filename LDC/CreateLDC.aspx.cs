using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace NCGDSasp.Admin.LDC
{
    public partial class CreateLDC : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(Helper.GetCon());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //  "2017-11-14"
                DateTime today = DateTime.Today;
                txtCollectionDate.Text = today.ToString("yyyy-MM-dd"); 
                txtCreationDate.Text= today.ToString("yyyy-MM-dd");
                txtDepositDate.Text = today.ToString("yyyy-MM-dd");
                txtCreditedDate.Text = today.ToString("yyyy-MM-dd");
                getCollectionList();
                getCollectionListCash();
                getCollectionListCheck();
                getCollectionListForex();
                getCollectionListLDDAP();
                getUserInfo();

            }
        }
        private void getUserInfo()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select h.Lastname + ',' + h.firstname as fullname, a.UserAgencyID, b.Agency, c.regionname,d.provincename,e.municipalityname,f.barangayname,g.operatingunitname from UserAgency as 
a,HomeAgency as b,Region as c ,Province as d,Municipality as e,BarangayList as f,OperatingUnit as g,Users as h where 
c.regionCode = d.regioncode and e.provincialcode = d.provincecode and f.municipalitycode = e.municipalitycode and h.userID = a.UserID and
c.RegionCode = a.regioncode and a.provinceCode = d.provincecode and a.municipalityCode=e.municipalityCode and a.barangaycode = f.barangaycode
and a.operatingUnitID = g.operatingUnitID and b.HomeAgencyID = a.HomeAgencyID and a.UserID=@UserID";
                cmd.Parameters.AddWithValue("@UserID", Helper.userID);
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblAgency.Text = dr["Agency"].ToString();
                    lblBrgy.Text = dr["barangayname"].ToString();
                    lblDepartment.Text = dr["operatingunitname"].ToString();
                    lblMunicipality.Text = dr["municipalityname"].ToString();
                    lblName.Text = dr["fullname"].ToString();
                    lblProvince.Text = dr["provincename"].ToString();
                    lblRegion.Text =  dr["regionname"].ToString();
                }
                con.Close();
            }
        }
        private void getCollectionList()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from Collection where LDCNumber='LDC NUMBER' or LDCNUmber='0'";
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
        private void getCollectionListCash()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from Collection as a,CollectionDetails as b where a.collectionID = b.collectionID and b.type='Cash' and a.LDCNUmber='0' and a.CreatorID=@CreatorID";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvCash.DataSource = ds;
                lvCash.DataBind();
                con.Close();
                getTotalCash();
            }
        }
        private void getTotalCash()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select ISNULL(SUM(b.Amount), 0)    as total from Collection as a,CollectionDetails as b where a.CollectionID = b.CollectionID and b.type='Cash' and a.LDCNUmber='0' and a.CreatorID=@CreatorID";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr["total"].ToString() != "NULL")
                    {
                        Convert.ToDecimal(string.Format("{0:F2}", dr["total"].ToString()));
                        decimal a = decimal.Parse(dr["total"].ToString());
                        lbltotal.Text = a.ToString("0.00");
                    }
                }
                con.Close();
            }
        }

        private void getCollectionListCheck()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from Collection as a,CollectionDetails as b where a.collectionID = b.collectionID and b.type='Check' and a.LDCNUmber='0' and a.CreatorID=@CreatorID";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvCheck.DataSource = ds;
                lvCheck.DataBind();
                con.Close();
                getTotalCheck();
            }
        }
        private void getTotalCheck()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select ISNULL(SUM(b.Amount), 0)    as total from Collection as a,CollectionDetails as b where a.CollectionID = b.CollectionID and b.type='Check' and a.LDCNUmber='0' and a.CreatorID=@CreatorID";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr["total"].ToString() != "NULL")
                    {
                        Convert.ToDecimal(string.Format("{0:F2}", dr["total"].ToString()));
                        decimal a = decimal.Parse(dr["total"].ToString());
                        lbTotalCheck.Text = a.ToString("0.00");
                    }
                }
                con.Close();
            }
        }
        private void getCollectionListForex()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from Collection as a,CollectionDetails as b where a.collectionID = b.collectionID and b.type='Forex' and a.LDCNUmber='0' and a.CreatorID=@CreatorID";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvForex.DataSource = ds;
                lvForex.DataBind();
                con.Close();
                getTotalForex();
            }
        }
        private void getTotalForex()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select ISNULL(SUM(b.AmountInPHP), 0)    as total from Collection as a,CollectionDetails as b where a.CollectionID = b.CollectionID and b.type='Forex' and a.LDCNUmber='0' and a.CreatorID=@CreatorID";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr["total"].ToString() != "NULL")
                    {
                        Convert.ToDecimal(string.Format("{0:F2}", dr["total"].ToString()));
                        decimal a = decimal.Parse(dr["total"].ToString());
                        lbTotalForex.Text = a.ToString("0.00");
                    }
                }
                con.Close();
            }
        }
        private void getCollectionListLDDAP()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from Collection as a,CollectionDetails as b where a.collectionID = b.collectionID and b.type='LDDAP-ADA' and a.LDCNUmber='0' and a.CreatorID=@CreatorID";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvLLDAP.DataSource = ds;
                lvLLDAP.DataBind();
                con.Close();
                getTotalLDDAP();
            }
        }
        private void getTotalLDDAP()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select ISNULL(SUM(b.AmountInPHP), 0)    as total from Collection as a,CollectionDetails as b where a.CollectionID = b.CollectionID and b.type='LDDAP-ADA' and a.LDCNUmber='0' and a.CreatorID=@CreatorID";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr["total"].ToString() != "NULL")
                    {
                        Convert.ToDecimal(string.Format("{0:F2}", dr["total"].ToString()));
                        decimal a = decimal.Parse(dr["total"].ToString());
                        lbTotalLDDAP.Text = a.ToString("0.00");
                    }
                }
                con.Close();
            }
        }
        private void getbanks()
        {
            ddlbanks.Items.Clear();
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;

                cmd.CommandText = @"SELECT * from Banks";
                SqlDataReader dr = cmd.ExecuteReader();
                ddlbanks.DataSource = dr;
                ddlbanks.DataTextField = "BankName";
                ddlbanks.DataValueField = "BankID";
                ddlbanks.DataBind();
                dr.Close();
                con.Close();
            }
        }
        private void getbankBranches(int id)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;

                cmd.CommandText = @"SELECT * from BankBranch where bankID=" + id;
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

        protected void btnApproval_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "insert into LDC values(@LDCType,@CollectionDate,@CreditedDate,@ClearingAccountNo,@CreationDate,@bankBranchID,@depositDate,@Attachment,@Remarks,'For Approval',@CreatorID,'For Approval',@bankID)";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Parameters.AddWithValue("@LDCType", ddlType.SelectedValue);
                cmd.Parameters.AddWithValue("@CollectionDate", txtCollectionDate.Text);
                cmd.Parameters.AddWithValue("@CreditedDate", txtCreditedDate.Text);
                cmd.Parameters.AddWithValue("@ClearingAccountNo", txtClearing.Text);
                cmd.Parameters.AddWithValue("@CreationDate", txtCreationDate.Text);
                cmd.Parameters.AddWithValue("@bankBranchID", ddlBranch.SelectedValue);
                cmd.Parameters.AddWithValue("@depositDate", txtDepositDate.Text);
                cmd.Parameters.AddWithValue("@Remarks", txtRemark.Text);
                cmd.Parameters.AddWithValue("@bankID", ddlbanks.SelectedValue);

                if (fileUpload.HasFile)
                {
                    string fileExt = Path.GetExtension(fileUpload.FileName);
                    string id = Guid.NewGuid().ToString();

                    cmd.Parameters.AddWithValue("@Attachment", id + fileExt);
                    fileUpload.SaveAs(Server.MapPath("~/uploads/LDC/" + id + fileExt));
                }
                else
                {
                    Session["fpimage"] = "nophoto.jpg";
                    cmd.Parameters.AddWithValue("@Attachment", Session["fpimage"].ToString());
                }
                cmd.ExecuteNonQuery();
                cmd.CommandText = "select top 1 LDCID from LDC where creatorID = @CreatorID and CreationStatus = 'For Approval' Order by LDCID Desc";
                string LDCNumber = cmd.ExecuteScalar().ToString();
                cmd.CommandText = "update Collection Set LDCNumber = @LDCNumber where creatorID = @CreatorID and LDCNumber='0'";
                cmd.Parameters.AddWithValue("@LDCNumber", LDCNumber.ToString());
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Redirect("LDCList.aspx");
        }

        protected void btndraft_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "insert into LDC values(@LDCType,@CollectionDate,@CreditedDate,@ClearingAccountNo,@CreationDate,@bankBranchID,@depositDate,@Attachment,@Remarks,'Draft',@CreatorID,'Draft',@bankID)";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Parameters.AddWithValue("@LDCType", ddlType.SelectedValue);
                cmd.Parameters.AddWithValue("@CollectionDate", txtCollectionDate.Text);
                cmd.Parameters.AddWithValue("@CreditedDate", txtCreditedDate.Text);
                cmd.Parameters.AddWithValue("@ClearingAccountNo", txtClearing.Text);
                cmd.Parameters.AddWithValue("@CreationDate", txtCreationDate.Text);
                cmd.Parameters.AddWithValue("@bankBranchID", ddlBranch.SelectedValue);
                cmd.Parameters.AddWithValue("@depositDate", txtDepositDate.Text);
                cmd.Parameters.AddWithValue("@Remarks", txtRemark.Text);
                cmd.Parameters.AddWithValue("@bankID", ddlbanks.SelectedValue);

                if (fileUpload.HasFile)
                {
                    string fileExt = Path.GetExtension(fileUpload.FileName);
                    string id = Guid.NewGuid().ToString();

                    cmd.Parameters.AddWithValue("@Attachment", id + fileExt);
                    fileUpload.SaveAs(Server.MapPath("~/uploads/LDC/" + id + fileExt));
                }
                else
                {
                    Session["fpimage"] = "nophoto.jpg";
                    cmd.Parameters.AddWithValue("@Attachment", Session["fpimage"].ToString());
                }
                cmd.ExecuteNonQuery();
                cmd.CommandText = "select top 1 LDCID from LDC where creatorID = @CreatorID and CreationStatus = 'Draft' Order by LDCID Desc";
                string LDCNumber = cmd.ExecuteScalar().ToString();
                cmd.CommandText = "update Collection Set LDCNumber = @LDCNumber where creatorID = @CreatorID and LDCNumber='0'";
                cmd.Parameters.AddWithValue("@LDCNumber", LDCNumber.ToString());
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Redirect("LDCList.aspx");
        }

        protected void lvFundSource_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Literal ltCollectionID = (Literal)e.Item.FindControl("ltCollectionID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;

                if (e.CommandName == "TagOR")
                {

                    cmd.Connection = con;
                    cmd.CommandText = "Update Collection set LDCNumber='0', CreatorID = @UserID where CollectionID=@SODID";
                    cmd.Parameters.AddWithValue("@UserID", Helper.userID);
                    cmd.Parameters.AddWithValue("@SODID", ltCollectionID.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    getCollectionList();
                    getCollectionListCash();
                    getCollectionListCheck();
                    getCollectionListForex();
                    getCollectionListLDDAP();

                }

                if (e.CommandName == "RemoveTag")
                {

                    cmd.Connection = con;
                    cmd.CommandText = "Update Collection set LDCNumber='LDC NUMBER', CreatorID = @UserID where CollectionID=@SODID";
                    cmd.Parameters.AddWithValue("@UserID", Helper.userID);
                    cmd.Parameters.AddWithValue("@SODID", ltCollectionID.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    getCollectionList();
                    getCollectionListCash();
                    getCollectionListCheck();
                    getCollectionListForex();
                    getCollectionListLDDAP();

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

        protected void ddlType1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

 
}