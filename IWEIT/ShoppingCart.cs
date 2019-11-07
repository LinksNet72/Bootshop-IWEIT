using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace IWEIT
{
    public class ShoppingCart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        string name, img, price, qty, desc;
        HttpContext current = HttpContext.Current;

        public void AddToCart(int id=0)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * From Items Where Id =" + id, con);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                name = dr["Item_Name"].ToString();
                img = dr["Item_Image"].ToString();
                price = dr["Price"].ToString();
                qty = dr["Quantity"].ToString();
                desc = dr["Item_Description"].ToString();
            }

            string items = name + "," + img + "," + price + "," + qty + "," + desc;
            con.Close();
            
            if (current != null)
            {
                if (current.Request.Cookies["cookieItems"] == null)
                {
                    current.Response.Cookies["cookieItems"].Value = name + "," + img + "," + price + "," + qty + "," + desc; ;
                    current.Response.Cookies["cookieItems"].Expires = DateTime.Now.AddDays(1);
                }

                else
                {
                    current.Response.Cookies["cookieItems"].Value = Request.Cookies["cookieItems"].Value + "|" + name + "," + img + "," + price + "," + qty + "," + desc;
                    current.Response.Cookies["cookieItems"].Expires = DateTime.Now.AddDays(1);
                }
                
            }
            
        }

        public DataTable PutToTable()
        {
            string s, t;
            string[] arr = new string[5];
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5]
            {
                new DataColumn("name"),
                new DataColumn("desc"),
                new DataColumn("price"),
                new DataColumn("qty"),
                new DataColumn("img")
            });
            if (current.Request.Cookies["cookieItems"].Value != null)
            {
                s = Convert.ToString(current.Request.Cookies["cookieItems"].Value);
                string[] strArr = s.Split('|');
                for (int i = 0; i < strArr.Length; i++)
                {
                    t = Convert.ToString(strArr[i].ToString());
                    string[] strArr1 = t.Split(',');
                    for (int j = 0; j < strArr1.Length; j++)
                    {
                        arr[j] = strArr1[j].ToString();
                    }
                    dt.Rows.Add(arr[0], arr[1], arr[2], arr[3], arr[4]);
                }
            }
            return dt;
        }
    }
}