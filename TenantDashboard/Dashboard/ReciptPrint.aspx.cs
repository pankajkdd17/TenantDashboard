using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_ReciptPrint : System.Web.UI.Page
{
    DueTransection dueTransection = new DueTransection();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                if (Request.QueryString["d_id"] != null)
                {
                    string d_id = Request.QueryString["d_id"].ToString();
                    GetReportData(d_id);
                }
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }

    private void GetReportData(string d_id)
    {
        try
        {
            SqlDataReader sdr = dueTransection.getReciptoFTenants(d_id);
            if (sdr.HasRows)
            {
                if (sdr.Read())
                {
                    // select d_id, d_prpertyname, d_prpertyvalue, d_PayeeText, d_PayeeValue, d_RoomNo, d_t_Mobile, d_DuesTypeText, d_DuesTypeValue, d_recivedAmount, d_DuesAmount, CONVERT(varchar, d_reciveddate, 103 ) as d_reciveddate , CONVERT(varchar, d_reciveddate, 103) as d_reciveddate ,  CONVERT(varchar, d_DuesMonth, 103) as d_DuesMonth ,  d_Remark ,convert(varchar, d_crdate, 103) as d_crdate ,d_mdfydate from  Dues where  d_prpertyvalue = '" + propertyVale + "' and d_id = '" + d_id + "' and d_status = 'recived' "
                    lblPgName.Text = sdr["d_prpertyname"].ToString();
                    lbldateTime.Text = sdr["d_reciveddate"].ToString();
                    lblReciptNo.Text = sdr["d_id"].ToString();
                    lblpgAddress.Text = sdr["p_address"].ToString();
                    lblTenantsName.Text = sdr["d_PayeeText"].ToString();
                    lblPhone.Text = sdr["d_t_Mobile"].ToString();
                    lblRoomNo.Text = sdr["d_RoomNo"].ToString();
                    lblpgNamee.Text = sdr["d_prpertyname"].ToString();
                    lblSrNo.Text = "1";
                    lblDueType.Text = sdr["d_DuesTypeText"].ToString();
                    lblDueTypee.Text = sdr["d_DuesTypeText"].ToString();
                    lblDueMonth.Text = sdr["d_DuesMonth"].ToString();
                    lblDueAmount.Text = sdr["d_recivedAmount"].ToString();
                    lblDueSubAmount.Text = sdr["d_recivedAmount"].ToString();
                    lblPgName.Text = sdr["d_prpertyname"].ToString();
                    lblDueTypeAmount.Text = sdr["d_recivedAmount"].ToString();
                    //lblTotalDueAmount.Text = sdr["d_recivedAmount"].ToString();
                }
                sdr.Close();
            }

        }
        catch (Exception ex)
        {
            string text = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
        }
    }
}