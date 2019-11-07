using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace IWEIT
{
    public partial class product_description : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("index.aspx");
            }
            else
            {
                id = Convert.ToInt32(Request.QueryString["id"]);
                GetTheProducts();
            }
        }

        public void GetTheProducts()
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM Items where Id ="+ id ;
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            con.Close();

           
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            ShoppingCart sc = new ShoppingCart();
            sc.AddToCart(id);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write(Repeater1.Items[0]);
        }
    }
}