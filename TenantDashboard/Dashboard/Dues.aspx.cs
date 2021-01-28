using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Dues : System.Web.UI.Page
{
    AddUsers uc = new AddUsers();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                GetDues(Mobile);
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }

    private void GetDues(string mobile)
    {
        try
        {
            ListView3.DataSource = uc.getDues(mobile);
            ListView3.DataBind();
        }
        catch(Exception ex)
        {
            string errormsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errormsg + "')</script>", false);
        }
    }
}