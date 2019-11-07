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
    public partial class index : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        string name, img, price, qty, desc;
        int id = 0;
        string idd = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            GetTheProducts();
            
        }

        public void GetTheProducts()
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM Items";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            //id = Convert.ToInt32(Eval("Id"));
            con.Close();
        }


        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            ShoppingCart sc = new ShoppingCart();

            
        }

        
    }
}