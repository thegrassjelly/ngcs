using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NCGDSasp.Admin.UserManagement
{
    public partial class UserApproval : System.Web.UI.Page
    {

        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.userid,a.username,a.firstname,a.middlename,a.lastname,b.roledescription,c.agency from users as a,roles as b, homeagency as c where a.roleid = b.roleid and a.homeagencyid=c.homeagencyid and a.CreationStatus='For Approval'";
                cmd.Parameters.AddWithValue("@CreatorID", Helper.userID);
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds, "UserBank");
                lvUsers.DataSource = ds;
                lvUsers.DataBind();
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getUserBanks();
               
            }
        }

        protected void lvUsers_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

            Literal ltUserID = (Literal)e.Item.FindControl("ltUserID");
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                if (e.CommandName == "Approve")
                {
                    cmd.CommandText = "Update Users set CreationStatus='Approved' where UserID=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltUserID.Text);
                    cmd.ExecuteNonQuery();
                    getUserBanks();
                }
                if (e.CommandName == "Disapprove")
                {
                    cmd.CommandText = "Update Users set CreationStatus='Disapproved' where UserID=@SODID";

                    cmd.Parameters.AddWithValue("@SODID", ltUserID.Text);
                    cmd.ExecuteNonQuery();
                    getUserBanks();
                }
                con.Close();
            }
        }

        protected void lvUsers_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            dpUsers.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }

        protected void lvUsers_DataBound(object sender, EventArgs e)
        {
            dpUsers.Visible = dpUsers.PageSize < dpUsers.TotalRowCount;

        }
    }
}