using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Transaction : System.Web.UI.Page
{
    DueTransection dueTransection = new DueTransection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                GetRecivedDue();
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }

    private void GetRecivedDue()
    {
        try
        {
            if (Session["t_MobileNo"] != null)
            {
                string mobile = Session["t_MobileNo"].ToString();
                ListView3.DataSource = dueTransection.getReciptDataoFTenants(mobile);
                ListView3.DataBind();
            }
        }
        catch (Exception ex)
        {
            string text = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
        }
    }




    protected void ListView3_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        try
        {

            if (e.CommandName == "PrintRecipt")
            {
                string id = (e.CommandArgument).ToString();
                //Response.Redirect("PrintRecipt.aspx?d_id=" + id + "");
                Response.Redirect("ReciptPrint.aspx?d_id=" + id + "");
            }
        }
        catch (Exception ex)
        {
            string text = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
        }
    }
}