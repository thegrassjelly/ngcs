using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.RevenueCodeManagement
{
    public partial class CreateRevenueCode : System.Web.UI.Page
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
                cmd.CommandText = "select * from RevenueCode where Name = @bankname";
                cmd.Parameters.AddWithValue("@bankname", txtName.Text);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    cmd.CommandText = "Insert into revenuecode values(@Name,@Code,@Description,@Remarks,0,@CreatorID,'For Approval')";
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Code", txtUACSCode.Text);
                    cmd.Parameters.AddWithValue("@Description", txtDesc.Text);
                    cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
                    cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);


                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "Success", "<script type='text/javascript'>alert('Registration successful!');window.location='RevenueCodeList.aspx';</script>'");

                }
                con.Close();

            }
        }
    }
}