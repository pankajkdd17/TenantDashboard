using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_ExitProperty : System.Web.UI.Page
{
    ExitProperty exitProperty = new ExitProperty();
    GeneralFunctions.GeneralFunctions geFunction = new GeneralFunctions.GeneralFunctions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                GetExitPropertyDetails();
                geFunction.FillBankName("b_id", "b_name", "tbl_IndianBanksList", ddlBankName, "");
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }

    private void GetExitPropertyDetails()
    {
        try
        {
            string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            gvExitProperty.DataSource = exitProperty.GetExitPropertyRecord(Mobile);
            gvExitProperty.DataBind();
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
        }
    }

    protected void btnApplyforExit_Click(object sender, EventArgs e)
    {
        try
        {
            System.Threading.Thread.Sleep(300);
            string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            if (CheckDublicateCheckOut() == false)
            {
                SqlDataReader sdr = exitProperty.GetTenant(Mobile);
                if (sdr.HasRows)
                {
                    if (sdr.Read())
                    {

                        string ackofBankInfo = chbcorrectInfo.Checked ? "1" : "0";
                        string t_PropertyName = sdr["t_PropertyName"].ToString();
                        ViewState["t_PropertyName"] = t_PropertyName;
                        string t_PropertyVale = sdr["t_PropertyVale"].ToString();
                        string t_Name = sdr["t_Name"].ToString();
                        ViewState["t_Name"] = t_Name;
                        string t_RoomNo = sdr["t_RoomNo"].ToString();
                        ViewState["t_RoomNo"] = t_RoomNo;
                        string t_BedsText = sdr["t_BedsText"].ToString();
                        string t_MobileNo = sdr["t_MobileNo"].ToString();
                        string t_BedsValue = sdr["t_BedsValue"].ToString();
                        exitProperty.ApplyExit(t_PropertyName, t_PropertyVale, t_Name, t_RoomNo, t_BedsText, t_MobileNo, t_BedsValue, txtCheckoutDate.Text, txtmsg.Text, ddlBankName.SelectedItem.Value, ddlBankName.SelectedItem.Text, txtBranchName.Text, txtAccountnumber.Text, txtIFSCcode.Text, txtAccountholdername.Text, txtMobileNo.Text, ackofBankInfo);
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                        txtCheckoutDate.Text = string.Empty;
                        txtmsg.Text = string.Empty;
                        ddlBankName.SelectedIndex = 0;
                        txtBranchName.Text = string.Empty;
                        txtAccountnumber.Text = string.Empty;
                        txtConfirmAccountNo.Text = string.Empty;
                        txtIFSCcode.Text = string.Empty;
                        txtAccountholdername.Text = string.Empty;
                        txtMobileNo.Text = string.Empty;
                        GetExitPropertyDetails();
                        SendMsgToPGCTForExitProperty();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
        }
    }

    private bool CheckDublicateCheckOut()
    {
        bool result = false;
        string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
        SqlDataReader sdr = exitProperty.GetDublicateExitProperty(Mobile);
        if (sdr.HasRows)
        {
            if (sdr.Read())
            {
                string ExitBy = sdr["tep_Name"].ToString();
                string errormsg = "You [" + ExitBy + "] have already applied for exit property";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errormsg + "')</script>", false);
                result = true;
            }
            sdr.Close();
        }
        else
        {
            result = false;
        }
        return result;
    }

    private void SendMsgToPGCTForExitProperty()
    {
        try
        {
            string t_PropertyName = ViewState["t_PropertyName"].ToString();
            string t_Name = ViewState["t_Name"].ToString();
            string t_RoomNo = ViewState["t_RoomNo"].ToString();
            string PGCTMoble = "9889360887";
            string sendMsgToUser = "Dear sir \n Tenant " + t_Name + " stay at " + t_PropertyName + " room no. " + t_RoomNo + " has been applyed for exit property  at date " + txtCheckoutDate.Text + "";
            string senders = "STAYLO";
            String url = "http://37.59.76.46/api/mt/SendSMS?user=STAYLO&password=8604@sms&senderid=" + senders + "&channel=TRANS&DCS=0&flashsms=0&number=" + PGCTMoble + "&text=" + sendMsgToUser + "&route=02";
            HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
            System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
            string responseString = respStreamReader.ReadToEnd();
            respStreamReader.Close();
            myResp.Close();

        }
        catch (Exception ex)
        {
            string text = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);

        }
    }

}