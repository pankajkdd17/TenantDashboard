using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Notifications : System.Web.UI.Page
{
    Notification notification = new Notification();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                GetNotifiCation();
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }

    private void GetNotifiCation()
    {
        try
        {
            string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            rptNotification.DataSource = notification.GetNotificationAll(Mobile);
            rptNotification.DataBind();
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
        }
    }
}