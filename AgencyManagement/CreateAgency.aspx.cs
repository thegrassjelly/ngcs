using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.AgencyManagement
{
    public partial class CreateAgency : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select * from Agency where AgencyName = @name";
                cmd.Parameters.AddWithValue("@name", txtAgencyName.Text);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    cmd.CommandText = "Insert into Agency values(@AgencyUACS,@AgencyName,@Department,@OperatingUnit,@LowerLevelOperatingClass,0,@Remarks,@CreatorID,'For Approval')";
                    cmd.Parameters.AddWithValue("@AgencyUACS", txtAgencyUACS.Text);
                    cmd.Parameters.AddWithValue("@AgencyName", txtAgencyName.Text);
                    cmd.Parameters.AddWithValue("@Department", txtDepartmentUACS.Text);
                    cmd.Parameters.AddWithValue("@OperatingUnit", txtoperatingUnitUACS.Text);
                    cmd.Parameters.AddWithValue("@LowerLevelOperatingClass", txtLowerlevelOperatingClass.Text);
                    cmd.Parameters.AddWithValue("@Status", 0);
                    cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
         
                    cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);


                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Registration successful!');window.location='AgencyList.aspx';</script>'");

                }
                con.Close();

            }
        }
    }
}