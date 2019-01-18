using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.UserManagement
{
    public partial class CreateUser : System.Web.UI.Page
    {
        #region Methods
        private void getUserAgency()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.UserAgencyID, b.Agency, c.regionname,d.provincename,e.municipalityname,f.barangayname,g.operatingunitname from UserAgency as 
a,HomeAgency as b,Region as c ,Province as d,Municipality as e,BarangayList as f,OperatingUnit as g where 
c.regionCode = d.regioncode and e.provincialcode = d.provincecode and f.municipalitycode = e.municipalitycode and
c.RegionCode = a.regioncode and a.provinceCode = d.provincecode and a.municipalityCode=e.municipalityCode and a.barangaycode = f.barangaycode
and a.operatingUnitID = g.operatingUnitID and b.HomeAgencyID = a.HomeAgencyID and
 a.CreatorID = @CreatorID and a.UserID=0 ";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserAgency");
                lvUserAgency.DataSource = ds;
                lvUserAgency.DataBind();
                con.Close();
            }
        }
        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.UserbankID, b.BankName,c.BranchName from Userbanks as a, banks as b, bankbranch as c where a.bankID = b.bankid and a.bankbranchid = c.bankbranchID and c.bankID = b.bankID and
 a.CreatorID = @CreatorID and a.UserID=0 ";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvBanks.DataSource = ds;
                lvBanks.DataBind();
                con.Close();
            }
        }
        private void getUserRevenue()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.UserRevenueID, b.Agency, c.Description, d.Code from UserRevenue as a, HomeAgency as b, RevenueCode as c, FundSource as D where 
                                    a.AgencyID=b.HomeAgencyID and a.RevenueCodeID=c.RevenueCodeID and a.FundingSourceID = d.FundSourceID and 
a.CreatorID =@CreatorID and a.UserID=0 ";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserRevenue");
                lvRevenue.DataSource = ds;
                lvRevenue.DataBind();
                con.Close();
            }
        }
        private void getProvince(string id)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;

                cmd.CommandText = @"SELECT * from Province where RegionCode=" + id;
                SqlDataReader dr = cmd.ExecuteReader();
                ddlProvince.DataSource = dr;
                ddlProvince.DataTextField = "Code";
                ddlProvince.DataValueField = "provinceCode";
                ddlProvince.DataBind();
                dr.Close();
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
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getUserAgency();
                getUserBanks();
                getUserRevenue();
            }
        }

        protected void lvUserAgency_DataBound(object sender, EventArgs e)
        {
            dpUserAgency.Visible = dpUserAgency.PageSize < dpUserAgency.TotalRowCount;
        }
        protected void lvUserAgency_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpUserAgency.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

          
        }

        protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProvince.DataSource = null;
            //  getProvince(ddlRegion.SelectedValue.ToString());

            ddlProvince.DataSource = SqlDataSource3;
            ddlProvince.DataTextField = "Code";
            ddlProvince.DataValueField = "ProvinceCode";
            ddlProvince.DataBind();
        }

        protected void ddlRegion_DataBinding(object sender, EventArgs e)
        {
           
        }

        protected void ddlRegion_Init(object sender, EventArgs e)
        {
        }

        protected void ddlRegion_DataBound(object sender, EventArgs e)
        {
            ddlProvince.DataSource = SqlDataSource3;
            ddlProvince.DataTextField = "Code";
            ddlProvince.DataValueField = "ProvinceCode";
            ddlProvince.DataBind();
        }

        protected void ddlProvince_DataBound(object sender, EventArgs e)
        {
            ddlMunicipality.DataSource = null;
            string a = ddlProvince.SelectedValue;
            ddlMunicipality.DataSource = SqlDataSource4;
            ddlMunicipality.DataTextField = "Code";
            ddlMunicipality.DataValueField = "MunicipalityCode";
            ddlMunicipality.DataBind();
        }

        protected void ddlProvince_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlMunicipality.DataSource = null;
            string a = ddlProvince.SelectedValue;
            ddlMunicipality.DataSource = SqlDataSource4;
            ddlMunicipality.DataTextField = "Code";
            ddlMunicipality.DataValueField = "MunicipalityCode";
            ddlMunicipality.DataBind();
        }

        protected void ddlBarangay_DataBound(object sender, EventArgs e)
        {
          
        }

        protected void ddlBarangay_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlMunicipality_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlBarangay.DataSource = null;
            string a = ddlProvince.SelectedValue;
            ddlBarangay.DataSource = barangayDS;
            ddlBarangay.DataTextField = "Code";
            ddlBarangay.DataValueField = "BarangayCode";
            ddlBarangay.DataBind();
        }

        protected void ddlMunicipality_DataBound(object sender, EventArgs e)
        {
            
            ddlBarangay.DataSource = null;
            string a = ddlProvince.SelectedValue;
            ddlBarangay.DataSource = barangayDS;
            ddlBarangay.DataTextField = "Code";
            ddlBarangay.DataValueField = "BarangayCode";
            ddlBarangay.DataBind();
        }

        protected void ddlbanks_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["bank"] = ddlbanks.SelectedValue.ToString();

            getbankBranches(int.Parse(ddlbanks.SelectedValue.ToString()));

        }

        protected void ddlbanks_DataBound(object sender, EventArgs e)
        {
            getbankBranches(int.Parse(ddlbanks.SelectedValue.ToString()));
            
        }

        protected void lvUserAgency_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Literal ltUserAgencyID = (Literal)e.Item.FindControl("ltUserAgencyID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                if (e.CommandName == "deleteua")
                {
                    cmd.CommandText = "DELETE FROM userAgency WHERE UserAgencyID = @SODID";
                 
                    cmd.Parameters.AddWithValue("@SODID", ltUserAgencyID.Text);
                    cmd.ExecuteNonQuery();
                    getUserAgency();
                }
                con.Close();
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
          
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
          
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select * from UserAgency where CreatorID = @CreatorID and UserID=0 and HomeAgencyID=@HAID";
                cmd.Parameters.AddWithValue("@HAID", ddlAgency.SelectedValue);
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    cmd.CommandText = "Insert into UserAgency values(@HAID,@regionCode,@ProvCode,@MunCode,@BrgyCode,@OpUnitID,0,@CreatorID)";
                    cmd.Parameters.AddWithValue("@regionCode", ddlRegion.SelectedValue);
                    cmd.Parameters.AddWithValue("@ProvCode", ddlProvince.SelectedValue);
                    cmd.Parameters.AddWithValue("@MunCode", ddlMunicipality.SelectedValue);
                    cmd.Parameters.AddWithValue("@BrgyCode", ddlBarangay.SelectedValue);
                    cmd.Parameters.AddWithValue("@OpUnitID", ddlOperatingUnit.SelectedValue);
                    cmd.ExecuteNonQuery();

                }
                con.Close();
                getUserAgency();
            }
        }

        protected void lvBanks_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Literal ltUserBankID = (Literal)e.Item.FindControl("ltUserBankID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                if (e.CommandName == "deleteua")
                {
                    cmd.CommandText = "DELETE FROM userBanks WHERE UserBankID = @SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltUserBankID.Text);
                    cmd.ExecuteNonQuery();
                    getUserBanks();
                }
                con.Close();
            }
        }

        protected void lvBanks_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
           
            dpBanks.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }

        protected void lvBanks_DataBound(object sender, EventArgs e)
        {
            dpBanks.Visible = dpBanks.PageSize < dpBanks.TotalRowCount;
        }

        protected void btnAddBank_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select * from UserBanks where CreatorID = @CreatorID and UserID=0 and BankBranchID=@BranchID";
                cmd.Parameters.AddWithValue("@BranchID", ddlBranch.SelectedValue);
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    cmd.CommandText = "Insert into UserBanks values(@BankID,@BranchID,@CreatorID,0)";
                    cmd.Parameters.AddWithValue("@BankID", ddlbanks.SelectedValue);
                
          
                    cmd.ExecuteNonQuery();

                }
                con.Close();
                getUserBanks();
            }
        }

        protected void btnUserRevenueAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select * from UserRevenue where CreatorID = @CreatorID and UserID=0 and AgencyID=@AgencyID";
               
                cmd.Parameters.AddWithValue("@AgencyID", ddlAgencytobeCredited.SelectedValue);
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    cmd.CommandText = "Insert into UserRevenue values(@AgencyID,@RevenueCodeID,@FundingSourceID,@CreatorID,0)";
                    cmd.Parameters.AddWithValue("@RevenueCodeID", ddlRevenueCode.SelectedValue);
                    cmd.Parameters.AddWithValue("@FundingSourceID", ddlFundSource.SelectedValue);


                    cmd.ExecuteNonQuery();

                }
                con.Close();
                getUserRevenue();
            }
        }

        protected void lvRevenue_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Literal ltUserRevenueID = (Literal)e.Item.FindControl("ltUserRevenueID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                if (e.CommandName == "deleteua")
                {
                    cmd.CommandText = "DELETE FROM UserRevenue WHERE UserRevenueID = @SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltUserRevenueID.Text);
                    cmd.ExecuteNonQuery();
                    getUserRevenue();
                }
                con.Close();
            }
        }

        protected void lvRevenue_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpUserRevenue.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }

        protected void lvRevenue_DataBound(object sender, EventArgs e)
        {
            dpUserRevenue.Visible = dpUserRevenue.PageSize < dpUserRevenue.TotalRowCount;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string password = Membership.GeneratePassword(6, 1);
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "Insert into Users values(@UN,@PW,@FN,@LN,@MN,@HAID,@roleID,@SuperID,@eSig,0,@CreatorID,@LU,'For Approval',@email)";
                cmd.Parameters.AddWithValue("@UN", txtUserName.Text);
                cmd.Parameters.AddWithValue("@PW", password);
                cmd.Parameters.AddWithValue("@FN", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LN", txtLastName.Text);
                cmd.Parameters.AddWithValue("@MN", txtMiddleName.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@HAID", ddlAgency.SelectedValue);
                cmd.Parameters.AddWithValue("@roleID", ddlRoles.SelectedValue);
                //cmd.Parameters.AddWithValue("@SuperID", ddlSupervisor.SelectedValue);
                cmd.Parameters.AddWithValue("@SuperID", 1);

                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Parameters.AddWithValue("@LU", DateTime.Now);
                if (fuImage.HasFile)
                {
                    string fileExt = Path.GetExtension(fuImage.FileName);
                    string id = Guid.NewGuid().ToString();

                    cmd.Parameters.AddWithValue("@eSig", id + fileExt);
                    fuImage.SaveAs(Server.MapPath("~/uploads/eSignatures/" + id + fileExt));
                }
                else
                {
                    Session["fpimage"] = "nophoto.jpg";
                    cmd.Parameters.AddWithValue("@eSig", Session["fpimage"].ToString());
                }
                cmd.ExecuteNonQuery();
                cmd.CommandText = "select top 1 userID from users where creatorID = @CreatorID and CreationStatus = 'For Approval' Order by UserID Desc";
                string userID = cmd.ExecuteScalar().ToString();
                cmd.CommandText = "update userAgency Set UserID = @UserID where creatorID = @CreatorID and UserID=0";
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.ExecuteNonQuery();
                cmd.CommandText = "update UserBanks Set UserID = @UserID where creatorID = @CreatorID and UserID=0";
                cmd.ExecuteNonQuery();
                cmd.CommandText = "update userRevenue Set UserID = @UserID where creatorID = @CreatorID and UserID=0";
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Registration successful!');window.location='UserList.aspx';</script>'");

            }
         
        }
        }
}