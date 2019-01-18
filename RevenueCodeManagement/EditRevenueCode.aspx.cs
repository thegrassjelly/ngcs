using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.RevenueCodeManagement
{
    public partial class EditRevenueCode : System.Web.UI.Page
    {
        private void getBankInfo()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select * from RevenueCode where RevenueCodeID=@UserID ";
                cmd.Parameters.AddWithValue("@UserID", Request.QueryString["ID"].ToString());
                cmd.Connection = con;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtDesc.Text = dr["Description"].ToString();
                    txtName.Text = dr["Name"].ToString();
                    txtUACSCode.Text = dr["Code"].ToString();
                  
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
              
                    cmd.CommandText = "Update revenueCode set Name=@Name,Code=@Code,Description=@Description,Remarks=@Remarks,creatorID=@creatorID,CreationStatus='For Approval' where RevenueCodeID = @RevenueCodeID";
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Code", txtUACSCode.Text);
                cmd.Parameters.AddWithValue("@Description", txtDesc.Text);
                cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Parameters.AddWithValue("@RevenueCodeID", Request.QueryString["ID"].ToString());


                cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Succesfully updated!');window.location='RevenueCodeList.aspx';</script>'");

                
                con.Close();

            }

        }
    }
}