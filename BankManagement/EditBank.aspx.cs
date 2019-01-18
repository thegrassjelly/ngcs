using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.BankManagement
{
    public partial class EditBank : System.Web.UI.Page
    {
        private void getBankInfo()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from Banks where BankID=@UserID ";
                cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                   
                   txtBankCode.Text = dr["BankCode"].ToString();
                    txtBankName.Text = dr["BankName"].ToString();
                    txtBankUACS.Text = dr["BankUACS"].ToString();
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                
                    cmd.CommandText = "Update banks set bankname=@bankname,bankcode=@bankcode,bankuacs=@bankUACS,remarks=@remarks,creatorID=@creatorID,CreationStatus='For Approval' where bankID = @bankID";
                    cmd.Parameters.AddWithValue("@bankcode", txtBankCode.Text);
                    cmd.Parameters.AddWithValue("@bankUACS", txtBankCode.Text);
                    cmd.Parameters.AddWithValue("@remarks", txtBankCode.Text);
                    cmd.Parameters.AddWithValue("@BankID", Request.QueryString["ID"].ToString());
                    cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Parameters.AddWithValue("@bankname", txtBankName.Text);

                cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Succesfully updated!');window.location='BankList.aspx';</script>'");

                
                con.Close();

            }

        }
    }
}