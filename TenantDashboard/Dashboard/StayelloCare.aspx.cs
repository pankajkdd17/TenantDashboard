using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_StayelloCare : System.Web.UI.Page
{
    GeneralFunctions.GeneralFunctions Gf = new GeneralFunctions.GeneralFunctions();
    AddUsers uc = new AddUsers();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                Gf.fillTicket("tc_id", "tc_name", "TicketCategory", ddlTicketOfIssue, "");
                ddlFacingissue.Attributes.Add("disabled", "disabled");
                ddlFacingissueSubcategory.Attributes.Add("disabled", "disabled");
                Showcomplaints();
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }

    private void Showcomplaints()
    {
        try
        {
            string mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            gvComplaint.DataSource = uc.GetNewComplaints(mobile);
            gvComplaint.DataBind();
        }
        catch (Exception ex)
        {
            string text = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
        }

    }
    protected void btnCreateTicket_Click(object sender, EventArgs e)
    {
        try
        {
            if(ddlTicketOfIssue.SelectedItem.Value != "0")
            {

                string t_name = Request.Cookies["UserDetails"]["s_name"];
                string t_MobileNo = Request.Cookies["UserDetails"]["t_MobileNo"];
               // string t_RoomNo = ViewState["t_RoomNo"].ToString();

                SqlDataReader sdr1 = uc.GetProperty(t_MobileNo);
                if (sdr1.HasRows)
                {
                    if (sdr1.Read())
                    {
                        ViewState["t_RoomNo"] = sdr1["t_RoomNo"].ToString();
                        ViewState["t_PropertyName"] = sdr1["t_PropertyName"].ToString();
                        ViewState["t_PropertyVale"] = sdr1["t_PropertyVale"].ToString();
                    }
                }
                string t_property = ViewState["t_PropertyName"].ToString();
                string t_PropertyVale = ViewState["t_PropertyVale"].ToString();
                string t_RoomNo = ViewState["t_RoomNo"].ToString();

                uc.AddComplaints(t_name, t_property, t_PropertyVale, t_MobileNo, t_RoomNo, ddlTicketOfIssue.SelectedItem.Text, ddlTicketOfIssue.SelectedItem.Value, ddlFacingissue.SelectedItem.Text, ddlFacingissue.SelectedItem.Value, ddlFacingissueSubcategory.SelectedItem.Text, ddlFacingissueSubcategory.SelectedItem.Value, txtmsg.Text);
                SqlDataReader sdr = uc.GetToken(t_MobileNo);
                if (sdr.HasRows)
                {
                    if (sdr.Read())
                    {
                        string TokenNo = sdr["tc_id"].ToString();
                        string textmsg = "Your Complaints Ticket Token No [ " + TokenNo + "] Genrated Successfully !";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpopsuccess('" + textmsg + "')</script>", false);
                    }
                }
                Showcomplaints();
                SendMsgToTenantsForTicket();
                SendMsgToPGMangerForTicket();
                ddlFacingissue.Attributes.Add("disabled", "disabled");
                ddlFacingissueSubcategory.Attributes.Add("disabled", "disabled");
                ddlTicketOfIssue.Items.Clear();
                ddlFacingissue.Items.Clear();
                ddlFacingissueSubcategory.Items.Clear();
                txtmsg.Text = string.Empty;

            }
            else
            {

            }
        }
        catch (Exception ex)
        {
            string text = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
        }

    }

    private void SendMsgToPGMangerForTicket()
    {
        try
        {
            string t_name = ViewState["t_name"].ToString();
            //string t_MobileNo = ViewState["t_MobileNo"].ToString();
            string PgManagerMobile = "9889360887";
            string t_RoomNo = ViewState["t_RoomNo"].ToString();
            string t_property = ViewState["t_PropertyName"].ToString();
            string t_PropertyVale = ViewState["t_PropertyVale"].ToString();
            string sendMsgToUser = "Dear sir \n A complaint is registered at " + t_property + " Room No: " + t_RoomNo + " by " + t_name + "  \n " + ddlTicketOfIssue.SelectedItem.Text + " \n -> " + ddlFacingissue.SelectedItem.Text + " \n  -> " + ddlFacingissueSubcategory.SelectedItem.Text + " \n Please have a look!";
            string senders = "STAYLO";
            String url = "http://37.59.76.46/api/mt/SendSMS?user=STAYLO&password=8604@sms&senderid=" + senders + "&channel=TRANS&DCS=0&flashsms=0&number=" + PgManagerMobile + "&text=" + sendMsgToUser + "&route=02";
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

    private void SendMsgToTenantsForTicket()
    {
        try
        {
            string t_name = ViewState["t_name"].ToString();
            string t_MobileNo = ViewState["t_MobileNo"].ToString();
            string t_RoomNo = ViewState["t_RoomNo"].ToString();
            string t_property = ViewState["t_PropertyName"].ToString();
            string t_PropertyVale = ViewState["t_PropertyVale"].ToString();
            string sendMsgToUser = "Dear " + t_name.ToUpper() + "\nYour complaint has been registered and will be attended shortly\nRoom No:" + t_RoomNo + "\n Complaint details :\n-> " + ddlTicketOfIssue.SelectedItem.Text + " \n -> " + ddlFacingissue.SelectedItem.Text + " \n  -> " + ddlFacingissueSubcategory.SelectedItem.Text + " \n Status: unresolved ";
            string senders = "STAYLO";
            String url = "http://37.59.76.46/api/mt/SendSMS?user=STAYLO&password=8604@sms&senderid=" + senders + "&channel=TRANS&DCS=0&flashsms=0&number=" + t_MobileNo + "&text=" + sendMsgToUser + "&route=02";
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

    protected void ddlTicketOfIssue_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((ddlTicketOfIssue.SelectedItem.Text != "Select") && (ddlTicketOfIssue.SelectedItem.Value != null))
        {
            ddlFacingissue.Attributes.Remove("disabled");
            ddlFacingissueSubcategory.Attributes.Add("disabled", "disabled");
            Gf.fillFacingIssue("fi_id", "fi_name", "FacingIssue", ddlFacingissue, "", ddlTicketOfIssue.SelectedItem.Value);
        }
        else
        {
            ddlFacingissue.Attributes.Add("disabled", "disabled");
        }
    }
    protected void ddlFacingissue_SelectedIndexChanged(object sender, EventArgs e)
    {
        if ((ddlFacingissue.SelectedItem.Text != "Select") && (ddlFacingissue.SelectedItem.Value != null))
        {
            ddlFacingissueSubcategory.Attributes.Remove("disabled");
            Gf.fillFacingSubCategoryIssue("fsc_id", "fsc_Name", "FacingSubCategoryIssue", ddlFacingissueSubcategory, "", ddlFacingissue.SelectedItem.Value);
        }
        else
        {
            ddlFacingissueSubcategory.Attributes.Add("disabled", "disabled");
        }
    }



    //private bool checkDublicatUser()
    //{
    //    bool result = false;
    //    try
    //    {

    //        string t_MobileNo = ViewState["t_MobileNo"].ToString();
    //        SqlDataReader sdr = uc.GetTenants(t_MobileNo);
    //        if (sdr.HasRows)
    //        {
    //            if (sdr.Read())
    //            {
    //                ViewState["t_name"] = sdr["t_name"].ToString();
    //                ViewState["t_MobileNo"] = sdr["t_MobileNo"].ToString();
    //                ViewState["t_RoomNo"] = sdr["t_RoomNo"].ToString();
    //                //GenrateTicket.Visible = true;
    //                result = true;
    //                // string text = "Please Upload Your CV";
    //                // ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);

    //            }
    //        }
    //        else
    //        {
    //           // GenrateTicket.Visible = false;
    //            result = false;
    //            string text = "Please Talk To P.G. Manager your " + t_MobileNo + " have not aloted any Room ";
    //            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        string text = ex.Message.ToString();
    //        ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
    //    }
    //    return result;
    //}
    //protected void btnGenrateTicket_Click(object sender, EventArgs e)
    //{
    //    checkDublicatUser();
    //}
}