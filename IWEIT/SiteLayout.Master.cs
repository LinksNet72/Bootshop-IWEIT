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
    public partial class SiteLayout : System.Web.UI.MasterPage
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Default"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            GetTheCategories();
        }

        public void GetTheCategories()
        {
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM Categories";
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            con.Close();
        }
    }
}