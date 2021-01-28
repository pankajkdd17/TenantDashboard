using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_UpiPayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
               // GetRecivedDue();
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }
}