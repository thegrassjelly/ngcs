using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.BankManagement
{
    public partial class CreateBank : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select * from Banks where bankname = @bankname";
                cmd.Parameters.AddWithValue("@bankname", txtBankName.Text);
                
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    cmd.CommandText = "Insert into banks values(@bankname,@bankcode,@bankUACS,@remarks,@CreatorID,'For Approval')";
                    cmd.Parameters.AddWithValue("@bankcode", txtBankCode.Text);
                    cmd.Parameters.AddWithValue("@bankUACS", txtBankCode.Text);
                    cmd.Parameters.AddWithValue("@remarks", txtBankCode.Text);
                    cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);


                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Registration successful!');window.location='BankList.aspx';</script>'");

                }
                con.Close();
               
            }
        
        }
    }
}