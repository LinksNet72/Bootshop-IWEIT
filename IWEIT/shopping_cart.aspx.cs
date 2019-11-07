using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace IWEIT
{
    public partial class shopping_cart : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            ShoppingCart sc = new ShoppingCart();
            DataList1.DataSource = sc.PutToTable();
            DataList1.DataBind();
        }
        
    }
}