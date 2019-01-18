using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.ATAP
{
    public partial class ATAPConfirmation : System.Web.UI.Page
    {
        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.ATAPID,a.ATAPNo,a.AmountOfBond,a.TotalAmountPayable,b.Agency,a.agencyCode from ATAP as a, HomeAgency as b where a.agencyID = b.HomeAgencyID and a.CreationStatus='For Approval'";
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
        protected void Page_Load(object sender, EventArgs e)
        {
            getUserBanks();
        }

        protected void lvFundSource_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Literal ltATAPID = (Literal)e.Item.FindControl("ltATAPID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;

                if (e.CommandName == "SendBack")
                {

                    cmd.Connection = con;
                    cmd.CommandText = "Update ATAP set CreationStatus='Send Back' where ATAPID=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltATAPID.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();


                }
                if (e.CommandName == "view")
                {

                    Response.Redirect("ViewATAP.aspx?ID=" + ltATAPID.Text);


                }
                if (e.CommandName == "Confirm")
                {
                    cmd.Connection = con;
                    cmd.CommandText = "Update ATAP set CreationStatus='Confirmed' where ATAPID=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltATAPID.Text);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //   cmd.Connection = con;
                    //   cmd.CommandText = "Update LDC set Status='Approved' and remarks = @remarks where LDCID=@SODID";
                    //   cmd.Parameters.AddWithValue("@remarks", ltLDCID.Text);
                    //   cmd.Parameters.AddWithValue("@SODID", ltLDCID.Text);
                    ////   cmd.ExecuteNonQuery();
                    //   con.Close();
                    // getRemarks(ltLDCID.Text);
                    // this.ModalPopupExtender1.Show();

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
    }
}