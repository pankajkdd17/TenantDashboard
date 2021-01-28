using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_LateCheckIn : System.Web.UI.Page
{
    LateCheckIn lateCheckIn = new LateCheckIn();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                GetLateCheckinData();
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }

    private void GetLateCheckinData()
    {
        try
        {
            string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            gvLateCheckin.DataSource = lateCheckIn.GetLateCheckinRecord(Mobile);
            gvLateCheckin.DataBind();
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
        }
    }



    protected void btnLateCheckin_Click(object sender, EventArgs e)
    {
        try
        {
            string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            SqlDataReader sdr = lateCheckIn.GetTenant(Mobile);
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
                    lateCheckIn.ApplyLateCheckin(t_PropertyName, t_PropertyVale, t_Name, t_RoomNo, t_BedsText, t_MobileNo, t_BedsValue, txtLatecheckinDate.Text, txtLatecheckinTime.Text, txtParentName.Text, txtParentPhone.Text, txtmsg.Text);
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                    txtLatecheckinDate.Text = string.Empty;
                    txtLatecheckinTime.Text = string.Empty;
                    txtParentName.Text = string.Empty;
                    txtParentPhone.Text = string.Empty;
                    txtmsg.Text = string.Empty;
                    GetLateCheckinData();
                    SendMsgToFatherForLateCheckin();
                    SendMsgToPGCTForLateCheckin();
                }
            }
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
        }
    }


    private void SendMsgToFatherForLateCheckin()
    {
        try
        {
            string t_PropertyName = ViewState["t_PropertyName"].ToString();
            string t_Name = ViewState["t_Name"].ToString();
            string t_RoomNo = ViewState["t_RoomNo"].ToString();
            string FatherMobile = txtParentPhone.Text;
            string sendMsgToUser = "Dear (" + txtParentName.Text + ") \n Tenant " + t_Name + " stay at " + t_PropertyName + " room no. " + t_RoomNo + " has been applyed for late check-In  at date " + txtLatecheckinDate.Text + " time upto " + txtLatecheckinTime.Text + " \n for " + txtmsg.Text + "";
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

    private void SendMsgToPGCTForLateCheckin()
    {
        try
        {
            string t_PropertyName = ViewState["t_PropertyName"].ToString();
            string t_Name = ViewState["t_Name"].ToString();
            string t_RoomNo = ViewState["t_RoomNo"].ToString();
            string PGCTMoble = "9889360887";
            string sendMsgToUser = "Dear sir \n Tenant " + t_Name + " stay at " + t_PropertyName + " room no. " + t_RoomNo + " has been applyed for late check-In  at date " + txtLatecheckinDate.Text + " time upto " + txtLatecheckinTime.Text + " \n for " + txtmsg.Text + "";
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