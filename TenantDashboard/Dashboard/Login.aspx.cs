using ConnectionString;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Login : System.Web.UI.Page
{
    AddUsers us = new AddUsers();
    GeneralFunctions.GeneralFunctions Gf = new GeneralFunctions.GeneralFunctions();
    UpdateProfile updateProfile = new UpdateProfile();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                txtMobile.Text = Request.Cookies["UserDetails"]["t_MobileNo"];
                Response.Redirect("~/Dashboard/index.aspx");
            }
            else
            {
                Response.Cookies["UserDetails"].Expires = DateTime.Now.AddYears(-1);
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            if ((txtMobile.Text.Length > 0) && (txtOtp.Text.Length > 0))
            {
                if ((ViewState["Result"].ToString() == "Successful") && (ViewState["OTP"] != null))
                {
                    if (ViewState["Mobile"] != null)
                    {
                        string mobile = ViewState["Mobile"].ToString();
                        if (mobile == txtMobile.Text.Trim())
                        {
                            if (ViewState["OTP"].ToString() == txtOtp.Text)
                            {

                                SqlDataReader sdr = updateProfile.GetTenant(mobile);
                                if (sdr.HasRows)
                                {
                                    if (sdr.Read())
                                    {
                                        HttpCookie cookie = new HttpCookie("UserDetails");
                                        cookie.Values.Add("t_MobileNo", sdr["t_MobileNo"].ToString());
                                        cookie.Values.Add("t_PropertyName", sdr["t_PropertyName"].ToString());
                                        cookie.Values.Add("t_PropertyVale", sdr["t_PropertyVale"].ToString());
                                        cookie.Values.Add("t_RoomNo", sdr["t_RoomNo"].ToString());
                                        cookie.Values.Add("t_BedsText", sdr["t_BedsText"].ToString());
                                        cookie.Values.Add("t_BedsValue", sdr["t_BedsValue"].ToString());
                                        cookie.Values.Add("t_SecurityMoney", sdr["t_SecurityMoney"].ToString());
                                        cookie.Values.Add("t_RentMoney", sdr["t_RentMoney"].ToString());
                                        cookie.Values.Add("t_DateOfJoining", sdr["t_DateOfJoining"].ToString());
                                        cookie.Values.Add("t_RentDate", sdr["t_RentDate"].ToString());
                                        cookie.Values.Add("t_Details", sdr["t_Details"].ToString());
                                        cookie.Values.Add("t_BankDetailStatus", sdr["t_BankDetailStatus"].ToString());
                                        cookie.Values.Add("t_LockinPeriodValue", sdr["t_LockinPeriodValue"].ToString());
                                        cookie.Values.Add("t_LockinPeriodText", sdr["t_LockinPeriodText"].ToString());
                                        cookie.Values.Add("t_termsCondition", sdr["t_termsCondition"].ToString());

                                        
                                        Application["KycStatus"] = sdr["KycStatus"].ToString();
                                        Application["t_ParentName"] = sdr["t_ParentName"].ToString();
                                        Application["t_ParentPhone"] = sdr["t_ParentPhone"].ToString();
                                        Application["t_CommunicationAddres"] = sdr["t_CommunicationAddres"].ToString();
                                        Application["t_Name"] = sdr["t_Name"].ToString();
                                        Application["t_email"] = sdr["t_email"].ToString();
                                        Application["t_gender"] = sdr["t_gender"].ToString();
                                        Application["t_PhotoName"] = sdr["t_PhotoName"].ToString();
                                        Application["t_PhotoNamePath"] = sdr["t_PhotoNamePath"].ToString();

                                        //cookie.Values.Add("KycStatus", sdr["KycStatus"].ToString());
                                        //cookie.Values.Add("t_ParentName", sdr["t_ParentName"].ToString());
                                        //cookie.Values.Add("t_ParentPhone", sdr["t_ParentPhone"].ToString());
                                        //cookie.Values.Add("t_CommunicationAddres", sdr["t_CommunicationAddres"].ToString());
                                        //cookie.Values.Add("t_Name", sdr["t_Name"].ToString());
                                        //cookie.Values.Add("t_email", sdr["t_email"].ToString());
                                        //cookie.Values.Add("t_gender", sdr["t_gender"].ToString());
                                        //cookie.Values.Add("t_PhotoName", sdr["t_PhotoName"].ToString());
                                        //cookie.Values.Add("t_PhotoNamePath", sdr["t_PhotoNamePath"].ToString());
                                        cookie.Expires = DateTime.Now.AddYears(1);
                                        Response.Cookies.Add(cookie);

                                        //get the values out
                                        string t_MobileNono = Request.Cookies["UserDetails"]["t_MobileNo"];
                                        string t_Name = Request.Cookies["UserDetails"]["t_Name"];
                                        string t_email = Request.Cookies["UserDetails"]["t_email"];
                                        string t_gender = Request.Cookies["UserDetails"]["t_gender"];
                                        string t_PhotoName = Request.Cookies["UserDetails"]["t_PhotoName"];
                                        string t_PhotoNamePath = Request.Cookies["UserDetails"]["t_PhotoNamePath"];
                                        string t_PropertyName = Request.Cookies["UserDetails"]["t_PropertyName"];
                                        string t_PropertyVale = Request.Cookies["UserDetails"]["t_PropertyVale"];
                                        string t_RoomNo = Request.Cookies["UserDetails"]["t_RoomNo"];
                                        string t_ParentName = Request.Cookies["UserDetails"]["t_ParentName"];
                                        string t_ParentPhone = Request.Cookies["UserDetails"]["t_gender"];
                                        

                                        ViewState.Remove("OTP");
                                        Response.Redirect("~/Dashboard/Index.aspx");
                                    }
                                    sdr.Close();
                                }
                            }
                            else
                            {
                                lblmessage.Text = "Your number not OTP Verify";
                                lblmessage.ForeColor = System.Drawing.Color.Red;
                            }
                        }
                        else
                        {
                            lblmessage.Text = "OTP / Mobile  does not matches";
                            lblmessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblError.Text = "Enter your mobile";
                        lblmessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            else
            {
                lblError.Text = "Please enter valid mobile / OTP !";

            }

        }
        catch (Exception ex)
        {
            lblError.Text = ex.Message.ToString();
        }
    }

    protected void lbtnSendeOtp_Click(object sender, EventArgs e)
    {
        try
        {

            if (txtMobile.Text.Length > 0)
            {
                string numbers = txtMobile.Text;
                SqlDataReader sdr = updateProfile.GetTenant(numbers);
                if (sdr.HasRows)
                {
                    if (sdr.Read())
                    {
                        string Mobile = sdr["t_MobileNo"].ToString();
                        ViewState["Mobile"] = sdr["t_MobileNo"].ToString();
                        SendOtp(Mobile);
                    }
                }
                else
                {
                    lblmessage.Text = "You are not added as Tenants!";
                    lblmessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblmessage.Text = "Enter valid mobile!";
                lblmessage.ForeColor = System.Drawing.Color.Red;

            }
        }
        catch (Exception ex)
        {
            lblmessage.Text = ex.Message.ToString();
            lblmessage.ForeColor = System.Drawing.Color.Red;
        }
    }
    public void SendOtp(string Mobile)
    {
        Random rand = new Random();
        string sentOtp = (rand.Next(100000, 999999)).ToString();
        string sentOtpText = "" + sentOtp + " is your OTP to login to your stayello platform. It is valid for next 10 minutes";
        string senders = "STAYLO";
        String url = "http://37.59.76.46/api/mt/SendSMS?user=STAYLO&password=8604@sms&senderid=" + senders + "&channel=TRANS&DCS=0&flashsms=0&number=" + Mobile + "&text=" + sentOtpText + "&route=02";
        ViewState["OTP"] = sentOtp;
        try
        {
            HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(url);
            HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
            System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
            string responseString = respStreamReader.ReadToEnd();
            respStreamReader.Close();
            myResp.Close();
            lblmessage.Text = "OTP Sent Successfully";
            lblmessage.ForeColor = System.Drawing.Color.Green;
            lblmessage.Visible = true;
            lbtnSendeOtp.Text = "Resend OTP";
            txtOtp.Text = string.Empty;
            // lbtnSendeOtp.BackColor = Color.Green;
            // txtMobile.ReadOnly = true;
            ViewState["Result"] = "Successful";
        }
        catch (Exception ex)
        {
            lblmessage.Text = ex.Message.ToString();
            lblmessage.ForeColor = System.Drawing.Color.Blue;
            txtOtp.Text = string.Empty;
            lblmessage.Visible = true;
            lbtnSendeOtp.Text = "Resend Otp";
            lbtnSendeOtp.BackColor = Color.Green;
            ViewState["Result"] = "Unuccessful";
        }
    }

}