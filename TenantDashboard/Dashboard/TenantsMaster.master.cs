using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_TenantsMaster : System.Web.UI.MasterPage
{
    Notification notification = new Notification();
    UpdateProfile updateProfile = new UpdateProfile();


   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
        {
            GetNotifiCation();
            string mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            getTenentsProfile(mobile);
        }
        else
        {
            Response.Redirect("~/Dashboard/login.aspx");
        }
    }

    private void getTenentsProfile(string mobile)
    {
        SqlDataReader sdr = updateProfile.GetTenant(mobile);
        if (sdr.HasRows)
        {
            if (sdr.Read())
            {
                lblmobile.Text = Request.Cookies["UserDetails"]["t_MobileNo"];
                string Email = sdr["t_email"].ToString();
                lblName.Text = sdr["t_Name"].ToString();
                //string t_PhotoNamePath = sdr["t_PhotoNamePath"].ToString();
                if ((sdr["t_PhotoNamePath"].ToString() != string.Empty) && (sdr["t_PhotoNamePath"] != null))
                {
                    Image1.ImageUrl = sdr["t_PhotoNamePath"].ToString();
                    Image2.ImageUrl = sdr["t_PhotoNamePath"].ToString();
                }
                else
                {
                    Image1.ImageUrl = "~/Dashboard/images/defaulticon.png";
                    Image2.ImageUrl = "~/Dashboard/images/defaulticon.png";
                }
            }
        }
    }

    private void GetNotifiCation()
    {
        try
        {

            string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            rptNotification.DataSource = notification.GetNotification(Mobile);
            rptNotification.DataBind();
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
        }
    }

    protected void lbtnLogout_Click(object sender, EventArgs e)
    {
        Response.Cookies["UserDetails"].Expires = DateTime.Now.AddYears(-1);
        Response.Redirect("~/Dashboard/login.aspx");
    }


}
