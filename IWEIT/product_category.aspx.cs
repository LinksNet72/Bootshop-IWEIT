using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace IWEIT
{
    public partial class product_category : System.Web.UI.Page
    {
        int id;
        static string constring = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;
        string name, img, price, qty, desc;
        int total;

        SqlConnection con = new SqlConnection(constring);
        protected void Page_Load(object sender, EventArgs e)
        {
            id = int.Parse(Request.QueryString["id"]);
            GetTheProducts();
        }
        public void GetTheProducts()
        {
            try 
	        {	        
		        string selectAll = "SELECT * FROM Items INNER JOIN Categories ON Items.Category_Id = Categories.Id  WHERE Categories.Id =" + id;
                string selectName = "SELECT Category_Name FROM Categories WHERE Id =" + id;

                using(SqlConnection con = new SqlConnection(constring))
	            {
		            con.Open();
                
                    SqlCommand cmd = new SqlCommand(selectAll, con);
                    cmd.ExecuteNonQuery();
                    DataTable dt = new DataTable();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();

                    SqlCommand cmd2 = new SqlCommand(selectName, con);
                    Label1.Text = cmd2.ExecuteScalar().ToString();

                    con.Close();
	            }
	        }
	        catch (SqlException)
	        {
                
	        }
            
        }

        public void AddToCart()
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
            con.Close();

            
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            AddToCart();
        }
    }
}