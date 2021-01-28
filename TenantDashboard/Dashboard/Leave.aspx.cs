using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Leave : System.Web.UI.Page
{
    Leave leave = new Leave();
    GeneralFunctions.GeneralFunctions generalFn = new GeneralFunctions.GeneralFunctions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                GetLeaveData();
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }

    private void GetLeaveData()
    {
        try
        {
            string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            gvLeave.DataSource = leave.Getleave(Mobile);
            gvLeave.DataBind();
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
        }
    }

    protected void btnApplyLeave_Click(object sender, EventArgs e)
    {
        try
        {
            string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            SqlDataReader sdr = leave.GetTenant(Mobile);
            if (sdr.HasRows)
            {
                if (sdr.Read())
                {
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
                    leave.ApplyLeave(t_PropertyName, t_PropertyVale, t_Name, t_RoomNo, t_BedsText, t_MobileNo, t_BedsValue, txtLeaveStartDate.Text, txtLeaveEndDate.Text, txtParentName.Text, txtParentPhone.Text, txtmsg.Text);
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                    txtLeaveStartDate.Text = string.Empty;
                    txtLeaveEndDate.Text = string.Empty;
                    txtParentName.Text = string.Empty;
                    txtParentPhone.Text = string.Empty;
                    txtmsg.Text = string.Empty;
                    GetLeaveData();
                    SendMsgToFatherForLeave();
                    SendMsgToPGCTForLeave();
                }
            }
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
        }
    }

    private void SendMsgToFatherForLeave()
    {
        try
        {
            string t_PropertyName = ViewState["t_PropertyName"].ToString();
            string t_Name = ViewState["t_Name"].ToString();
            string t_RoomNo = ViewState["t_RoomNo"].ToString();
            string FatherMobile = txtParentPhone.Text;
            string sendMsgToUser = "Dear (" + txtParentName.Text + ") \n Tenant " + t_Name + " stay at " + t_PropertyName + " room no. " + t_RoomNo + " has been applyed for leave  from " + txtLeaveStartDate.Text + "to " + txtLeaveEndDate.Text + " \n for " + txtmsg.Text + "";
            string senders = "STAYLO";
            String url = "http://37.59.76.46/api/mt/SendSMS?user=STAYLO&password=8604@sms&senderid=" + senders + "&channel=TRANS&DCS=0&flashsms=0&number=" + FatherMobile + "&text=" + sendMsgToUser + "&route=02";
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

    private void SendMsgToPGCTForLeave()
    {
        try
        {
            string t_PropertyName = ViewState["t_PropertyName"].ToString();
            string t_Name = ViewState["t_Name"].ToString();
            string t_RoomNo = ViewState["t_RoomNo"].ToString();
            string FatherMobile = "9889360887";
            string sendMsgToUser = "Dear sir \n Tenant " + t_Name + " stay at " + t_PropertyName + " room no. " + t_RoomNo + " has been applyed for leave  from " + txtLeaveStartDate.Text + "to " + txtLeaveEndDate.Text + " \n for " + txtmsg.Text + "";
            string senders = "STAYLO";
            String url = "http://37.59.76.46/api/mt/SendSMS?user=STAYLO&password=8604@sms&senderid=" + senders + "&channel=TRANS&DCS=0&flashsms=0&number=" + FatherMobile + "&text=" + sendMsgToUser + "&route=02";
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