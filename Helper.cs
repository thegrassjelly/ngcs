using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;

namespace NCGDSasp
{
    public class Helper
    {
        #region WebConfig helpers
        public static string server = ConfigurationManager.AppSettings["server"].ToString();

        public static string database = ConfigurationManager.AppSettings["database"].ToString();

        public static string username = ConfigurationManager.AppSettings["username"].ToString();

        public static string password = ConfigurationManager.AppSettings["password"].ToString();

        public static string secured = ConfigurationManager.AppSettings["Secured"].ToString();

        public static string userID = "1";



        public static string empty = "";
        #endregion

        #region Helper methods
        public Helper()
        {

        }

        public static string GetCon()
        {
            return ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
        }

        public static string CreateSHAHash(string Phrase)
        {
            SHA512Managed HashTool = new SHA512Managed();
            Byte[] PhraseAsByte = System.Text.Encoding.UTF8.GetBytes(string.Concat(Phrase));
            Byte[] EncryptedBytes = HashTool.ComputeHash(PhraseAsByte);
            HashTool.Clear();
            return Convert.ToBase64String(EncryptedBytes);
        }

        public static void AddLog(string userID, string logType, string desc)
        {
            SqlConnection con = new SqlConnection(GetCon());
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "INSERT INTO Logs Values (@UserID, @LogType, " +
                "@Description, @TimeStamp)";
            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Parameters.AddWithValue("@LogType", logType);
            cmd.Parameters.AddWithValue("@Description", desc);
            cmd.Parameters.AddWithValue("@TimeStamp", DateTime.Now);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public static void ValidateAdmin()
        {
            //user not logged in
            if (HttpContext.Current.Session["userid"] == null)
            {
                HttpContext.Current.Response.Redirect("~/Admin/Login.aspx");
            }
        }

        public static void ValidateAccounting()
        {
            //user not logged in
            if (HttpContext.Current.Session["userid"] == null)
            {
                HttpContext.Current.Response.Redirect("~/Accounting/Login.aspx");
            }
        }

        public static string GetFirstWord(string str)
        {
            string output = "";

            for (int x = 0; x < str.Length; x++)
            {
                if (Char.IsUpper(str[x]) && output.Length > 0)
                {
                    // if Next is available
                    if (x + 1 < str.Length)
                    {
                        // if Next is upper
                        if (Char.IsUpper(str[x + 1]))
                        {
                            output += str[x];
                        }
                        else
                        {
                            break;
                        }
                    }
                    else
                    {
                        output += str[x];
                    }
                }
                else
                {
                    if (output.Length == 0)
                    {
                        output += str[x];
                    }
                    else
                    {
                        // if Next is available
                        if (x + 1 < str.Length)
                        {
                            // if Next is lower
                            if (Char.IsLower(str[x + 1]))
                            {
                                output += str[x];
                            }
                            else
                            {
                                output += str[x];
                                break;
                            }
                        }
                        else
                        {
                            output += str[x];
                        }
                    }
                }
            }

            return output;
        }

        public static string SplitStringByUppercase(string str)
        {
            string output = "";

            for (int x = 0; x < str.Length; x++)
            {
                if (Char.IsUpper(str[x]))
                {
                    output += str[x];
                }
                else
                {
                    if (output.Length == 0)
                    {
                        output += str[x];
                    }
                    else
                    {
                        // if Next is available
                        if (x + 1 < str.Length)
                        {
                            // if Next is lower
                            if (Char.IsLower(str[x + 1]))
                            {
                                output += str[x];
                            }
                            else
                            {
                                output += str[x] + " ";
                            }
                        }
                        else
                        {
                            output += str[x];
                        }
                    }
                }
            }

            return output;
        }

        public static bool GetSetting(System.Web.SessionState.HttpSessionState session, string settingName)
        {
            if (session["Settings_" + settingName] == null)
                return false;

            return Convert.ToBoolean(session["Settings_" + settingName].ToString());
        }

        public static void ResetDiscounts(System.Web.UI.Page page)
        {
            SqlConnection con = new SqlConnection(GetCon());
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandText = @"
                SELECT (FinishedProducts.FPName + '_' + CONVERT(NVARCHAR, SalesOrderDetails.SODID)) AS SessionKey 
                FROM FinishedProducts INNER JOIN SalesOrderDetails ON SalesOrderDetails.FPID = FinishedProducts.FPID";
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                page.Session[sdr["SessionKey"].ToString()] = null;
            }

            con.Close();
        }

        public static string GetItemDiscount(System.Web.UI.Page page, Literal literal, string productName,
            string sodid, string discountType, string discountValue)
        {
            decimal currentPrice = 0;
            SqlConnection con = new SqlConnection(GetCon());
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@SODID", sodid);
            if (page.Session[productName + "_" + sodid] == null)
            {
                con.Open();
                cmd.Connection = con;

                cmd.CommandText = @"
                SELECT SODAmount 
                FROM SalesOrderDetails 
                WHERE SODID = @SODID";
                currentPrice = (decimal)cmd.ExecuteScalar();
                con.Close();
            }
            else
            {
                currentPrice = decimal.Parse(page.Session[productName + "_" + sodid].ToString());
            }

            decimal totalDiscount = 0;

            if (discountType.Equals("Percent"))
                totalDiscount = (currentPrice * (decimal.Parse(discountValue) * 0.01m));
            else
                totalDiscount = decimal.Parse(discountValue);

            currentPrice -= totalDiscount;

            decimal dSubTotal = decimal.Parse(literal.Text);
            literal.Text = (dSubTotal - totalDiscount).ToString();


            page.Session[productName + "_" + sodid] = currentPrice;

            con.Open();
            cmd.Connection = con;

            cmd.CommandText = @"UPDATE ProductDiscounts SET PDPrice = @PDPrice WHERE SODID = @SODID AND PDID = (SELECT MAX(PDID) FROM ProductDiscounts)";
            cmd.Parameters.AddWithValue("@PDPrice", currentPrice);
            cmd.ExecuteNonQuery();
            con.Close();

            string itemPrice = String.Format("{0:0.00}", currentPrice);

            return itemPrice;
        }

        public static string getSIItemDisc(System.Web.UI.Page page, Literal literal, string productName,
            string sodid, string discountType, string discountValue)
        {
            decimal currentPrice = 0;
            SqlConnection con = new SqlConnection(GetCon());
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@SODID", sodid);
            if (page.Session[productName + "_" + sodid] == null)
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = @"
                SELECT SODAmount 
                FROM SalesOrderDetails 
                WHERE SODID = @SODID";
                currentPrice = (decimal)cmd.ExecuteScalar();
                con.Close();
            }
            else
            {
                currentPrice = decimal.Parse(page.Session[productName + "_" + sodid].ToString());
            }

            decimal totalDiscount = 0;

            if (discountType.Equals("Percent"))
                totalDiscount = (currentPrice * (decimal.Parse(discountValue) * 0.01m));
            else
                totalDiscount = decimal.Parse(discountValue);

            currentPrice -= totalDiscount;

            decimal dSubTotal = decimal.Parse(literal.Text);
            literal.Text = (dSubTotal - totalDiscount).ToString();


            page.Session[productName + "_" + sodid] = currentPrice;

            con.Open();
            cmd.Connection = con;

            cmd.CommandText = @"UPDATE ProductDiscounts SET PDPrice = @PDPrice WHERE SODID = @SODID AND PDID = (SELECT MAX(PDID) FROM ProductDiscounts)";
            cmd.Parameters.AddWithValue("@PDPrice", currentPrice);
            cmd.ExecuteNonQuery();
            con.Close();

            string itemPrice = String.Format("{0:0.00}", currentPrice);

            return itemPrice;
        }
        static decimal dAmount;
        static decimal dSubTotal;
        public static string GetSalesOrderDiscount(Literal subTotal, string SOID, string userID)
        {
            decimal decSub = 0;
            decimal percentOut;

            if (subTotal.Text == "")
                decSub = 0;
            else
                decSub = decimal.Parse(subTotal.Text);

            dSubTotal = decSub;

            using (SqlConnection con = new SqlConnection(Helper.GetCon()))
            using (SqlCommand cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = "select discountpercent from discounts where DiscountSOID=@SOID";
                cmd.Parameters.AddWithValue("@SOID", SOID);
                SqlDataAdapter adp = new SqlDataAdapter();
                adp.SelectCommand = cmd;
                DataTable dt = new DataTable();
                adp.Fill(dt);

                foreach (DataRow r in dt.Rows)
                {
                    decimal dPercent = decimal.Parse(r["discountpercent"].ToString()) * Convert.ToDecimal(0.01);

                    dAmount = dSubTotal * dPercent;
                    dSubTotal = dSubTotal - dAmount;

                }
            }

            decimal dSub = decSub - dSubTotal;
            subTotal.Text = string.Format("{0:0.00}", dSubTotal);

            string soPrice = string.Format("{0:0.00}", dSub);
            return soPrice;
        }

        public static decimal VAT()
        {
            decimal result = 0;
            result = decimal.Parse(ConfigurationManager.AppSettings["VATValue"].ToString());
            result = result / 100;
            return result;
        }

        public static decimal maxCBM()
        {
            decimal result = 0;
            result = decimal.Parse(ConfigurationManager.AppSettings["MaxCBM"].ToString());
            return result;
        }

        public static decimal dollarValue()
        {
            decimal result = 0;
            result = decimal.Parse(ConfigurationManager.AppSettings["DollarValue"].ToString());
            return result;
        }

        public static int maxFileSize()
        {
            int result = 0;
            result = int.Parse(ConfigurationManager.AppSettings["MaxFileSize"].ToString());
            return result;
        }

        public static string GetFolderURL()
        {
            string folderUrl = ConfigurationManager.AppSettings["FolderUrl"].ToString();
            return folderUrl;
        }

        public static void UpdateOTVisibility(bool value)
        {
            Configuration configure = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            configure.AppSettings.Settings.Remove("OT");
            configure.AppSettings.Settings.Add("OT", value.ToString());
            configure.Save();
        }

        public static void UpdatePictureVisibility(bool value)
        {
            Configuration configure = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            configure.AppSettings.Settings.Remove("ProductPic");
            configure.AppSettings.Settings.Add("ProductPic", value.ToString());
            configure.Save();
        }

        public static void UpdateShopVisibility(bool value)
        {
            Configuration configure = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            configure.AppSettings.Settings.Remove("ShowShop");
            configure.AppSettings.Settings.Add("ShowShop", value.ToString());
            configure.Save();
        }

        public static void UpdateReportSecurity(bool value)
        {
            Configuration configure = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            configure.AppSettings.Settings.Remove("Secured");
            configure.AppSettings.Settings.Add("Secured", value.ToString());
            configure.Save();
        }

        public static void UpdateVATValue(string value)
        {
            Configuration configure = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            configure.AppSettings.Settings.Remove("VATValue");
            configure.AppSettings.Settings.Add("VATValue", value);
            configure.Save();
        }

        public static void UpdateMaxCBM(string value)
        {
            Configuration configure = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            configure.AppSettings.Settings.Remove("MaxCBM");
            configure.AppSettings.Settings.Add("MaxCBM", value);
            configure.Save();
        }

        public static void UpdateMaxFileSize(string value)
        {
            Configuration configure = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
            configure.AppSettings.Settings.Remove("MaxFileSize");
            configure.AppSettings.Settings.Add("MaxFileSize", value);
            configure.Save();
        }
        #endregion
    }
}