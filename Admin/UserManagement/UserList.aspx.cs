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
    public partial class UserList : System.Web.UI.Page
    {
        private void getUserBanks()
        {
            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.CommandText = @"select a.userid,a.username,a.firstname,a.middlename,a.lastname,b.roledescription,c.agency from users as a,roles as b, homeagency as c where a.roleid = b.roleid and a.homeagencyid=c.homeagencyid and a.CreationStatus='Approved'";
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
            if (!IsPostBack)
            {
                getUserBanks();

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