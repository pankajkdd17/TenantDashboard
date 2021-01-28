using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Food : System.Web.UI.Page
{
    AddUsers uc = new AddUsers();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                foodMenu();
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }

    private void foodMenu()
    {
        try
        {
            repeater0.DataSource = uc.GetfoodmenuSunday();
            repeater0.DataBind();

            repeater1.DataSource = uc.GetfoodmenuMonday();
            repeater1.DataBind();
            repeater2.DataSource = uc.GetfoodmenuTuesday();
            repeater2.DataBind();

            repeater3.DataSource = uc.GetfoodmenuWednesday();
            repeater3.DataBind();

            repeater4.DataSource = uc.GetfoodmenuThursday();
            repeater4.DataBind();

            repeater5.DataSource = uc.GetfoodmenuFriday();
            repeater5.DataBind();

            repeater6.DataSource = uc.GetfoodmenuSaturday();
            repeater6.DataBind();
        }
        catch (Exception ex)
        {
            string text = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
        }
    }
}