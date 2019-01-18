using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.ATAP
{

   

public class Collection1
    {
        public string acountability { get; set; }
        public object description { get; set; }
        public string amount { get; set; }
        public string bond { get; set; }
        public string premium { get; set; }
    }

    public partial class CreateATAP : System.Web.UI.Page, IPostBackEventHandler
    {
        protected string creationID;

        public void getOfficers()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select atapofficerID, officerName,position,riskNumber,totalBondPremium,dateEffectivity, DATEADD(year, 1, dateEffectivity) AS CancellationDate
 from atapOfficer where ATAPID = 0 and creatorID=@CreatorID";

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
        public string generateNumber(string id)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = @"select top 1 atapID from ATAP order by atapID desc";
                SqlDataReader dr = cmd.ExecuteReader();
                string result = "";
                if (dr.Read())
                {
                    int count = 10;
                  
                    int length = dr["atapID"].ToString().Length;
                    string zeroes = ("0000000000").Substring(0, count - 1);
                    result = id + "-" + zeroes + (int.Parse(dr["atapID"].ToString()) + 1).ToString();
                }
                dr.Close();
                con.Close();
                return result;
            }

        }
        public void generateAmountOfBond()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = @"select sum(TotalBondPremium) as AmountOfBond,sum(RemainingBondPremium) as TotalAmountPayable from from ATAPOfficer where creatorID=@CreatorID and ATAPID = 0";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);

                SqlDataReader dr = cmd.ExecuteReader();
                string result = "";
                if (dr.Read())
                {
                    totalAmountPayable.Value = dr["TotalAmountPayable"].ToString();
                    amountOfBond.Value = dr["AmountOfBond"].ToString();

                   
                }
                dr.Close();
                con.Close();
            
            }

        }
        public static void uploadFile()
        {
            
        }
        public void RaisePostBackEvent(string eventArgument)
        {
          
            getOfficers();
        }
        [WebMethod]
        public static void SubmitATAP(string atapNo, string address,
 string to, string agency, string agencyCode, string amountOfBond, string datePrepared, string totalAmountPayable, string approvedBy,string attachment)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "insert into ATAP values (@address,@ATAPTo,@AgencyID,@agencyCode,@AmountOfBond,@datePrepared,@totalAmountPayable,@approvedBy,@Attachment,@CreatorID,'For Approval',@ATAPNo,'')";
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@ATAPTo", to);
                cmd.Parameters.AddWithValue("@AgencyID", agency);
                cmd.Parameters.AddWithValue("@agencyCode", agencyCode);
                cmd.Parameters.AddWithValue("@amountOfBond", amountOfBond);
                cmd.Parameters.AddWithValue("@datePrepared", datePrepared);
                cmd.Parameters.AddWithValue("@totalAmountPayable", totalAmountPayable);
                cmd.Parameters.AddWithValue("@approvedBy", approvedBy);
                cmd.Parameters.AddWithValue("@atapNo", atapNo);

                cmd.Parameters.AddWithValue("@attachment", attachment);
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);

                cmd.ExecuteNonQuery();
                cmd.CommandText = "select top 1 ATAPID from ATAP order by ATAPID desc";
                int id = int.Parse(cmd.ExecuteScalar().ToString());

                cmd.Connection = con;
                cmd.CommandText = "update ATAPOfficer set ATAPID = @ATAPID";
                cmd.Parameters.AddWithValue("@ATAPID", id);
                cmd.ExecuteNonQuery();
                con.Close();
          
            }

        }
        [WebMethod]
        public static string SubmitOfficerData(string date_effectivity, string application_type,
          string risk_number, string officer_name, string sex, string position, string tin, string existing_bond, string remaining_days, string remaining_bond_premium,
         string total_bond_premium, List<Collection1> data)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "insert into ATAPOfficer values (@date_effectivity,@application_type,@risk_number,@officer_name,@sex,@position,@tin,@existing_bond,@remaining_days,@remaining_bond_premium,@total_bond_premium,'0',@userID)";
                cmd.Parameters.AddWithValue("@date_effectivity", date_effectivity);
                cmd.Parameters.AddWithValue("@application_type", application_type);
                cmd.Parameters.AddWithValue("@risk_number", risk_number);
                cmd.Parameters.AddWithValue("@officer_name", officer_name);
                cmd.Parameters.AddWithValue("@sex", sex);
                cmd.Parameters.AddWithValue("@position", position);
                cmd.Parameters.AddWithValue("@tin", tin);
                cmd.Parameters.AddWithValue("@existing_bond", existing_bond);
                cmd.Parameters.AddWithValue("@remaining_days", remaining_days);
                cmd.Parameters.AddWithValue("@total_bond_premium", total_bond_premium);
                cmd.Parameters.AddWithValue("@remaining_bond_premium", remaining_bond_premium);


                cmd.Parameters.AddWithValue("@userID", Helper.userID);
                cmd.ExecuteNonQuery();
                cmd.CommandText = "select top 1 atapOfficerID from ATAPOfficer order by atapofficerID desc";
                int id = int.Parse(cmd.ExecuteScalar().ToString());
                con.Close();

                foreach (var a in data)
                {
                    cmd.Parameters.Clear();
                    con.Open();
                    cmd.Connection = con;
                    cmd.CommandText = "insert into ATAPOffDetails values (@a,@b,@c,@d,@e,@f)";
                    cmd.Parameters.AddWithValue("@a", a.acountability);
                    cmd.Parameters.AddWithValue("@b", a.description);
                    cmd.Parameters.AddWithValue("@c", a.amount);
                    cmd.Parameters.AddWithValue("@d", a.bond);
                    cmd.Parameters.AddWithValue("@e", a.premium);
                    cmd.Parameters.AddWithValue("@f", id);

                    cmd.ExecuteNonQuery();
                    con.Close();
                   
                }
            }

            return "CreateATAP.aspx";
          

        }
       static string filename;
        [WebMethod]
        public static string GetRolesListFilteredByStaff_NotIn(string GivenStaffID)
        {
            return "SelectRoleForStaff.aspx?staffID=" + GivenStaffID;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
         getOfficers();
                generateAmountOfBond();
            }
            if (!IsPostBack)
            {
                getOfficers();
                creationID = generateNumber("0304");
                generateAmountOfBond();
                lblID.Text = creationID;
            }
        }
      
        protected void lvFundSource_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }

        protected void lvFundSource_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {

        }

        protected void lvFundSource_DataBound(object sender, EventArgs e)
        {

        }

        protected void btnSubmitBond_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            FileUpload1.SaveAs(Server.MapPath("~/uploads/ATAP/" + FileUpload1.FileName));

        }
    }
}