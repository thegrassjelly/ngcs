using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.AgencyManagement
{
    public partial class EditAgency : System.Web.UI.Page
    {
        private void getBankInfo()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from Agency where AgencyID=@UserID ";
                cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    txtAgencyName.Text = dr["AgencyName"].ToString();
                    txtAgencyUACS.Text = dr["AgencyUACS"].ToString();
                    txtDepartmentUACS.Text = dr["Department"].ToString();
                    txtLowerlevelOperatingClass.Text = dr["LowerLevelOperatingClass"].ToString();
                    txtoperatingUnitUACS.Text = dr["OperatingUnit"].ToString();
                    txtRemarks.Text = dr["Remarks"].ToString();

                }
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getBankInfo();

            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
               
                   
                    cmd.CommandText = @"Update Agency set AgencyUACS=@AgencyUACS,AgencyName=@AgencyName,Department=@Department,OperatingUnit=@OperatingUnit,LowerLevelOperatingClass=@LowerLevelOperatingClass,
                       Remarks=@Remarks, creatorID=@creatorID,CreationStatus='For Approval' where AgencyID = @AgencyID";
                    cmd.Parameters.AddWithValue("@AgencyUACS", txtAgencyUACS.Text);
                    cmd.Parameters.AddWithValue("@AgencyName", txtAgencyName.Text);
                    cmd.Parameters.AddWithValue("@Department", txtDepartmentUACS.Text);
                    cmd.Parameters.AddWithValue("@OperatingUnit", txtoperatingUnitUACS.Text);
                    cmd.Parameters.AddWithValue("@LowerLevelOperatingClass", txtLowerlevelOperatingClass.Text);
                    cmd.Parameters.AddWithValue("@Status", 0);
                    cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);

                    cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                    cmd.Parameters.AddWithValue("@AgencyID", Request.QueryString["ID"].ToString());

                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Succesfully updated!');window.location='AgencyList.aspx';</script>'");
                con.Close();
            }
              

            
        }
    }
}