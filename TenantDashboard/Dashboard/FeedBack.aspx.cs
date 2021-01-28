using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_FeedBack : System.Web.UI.Page
{
    Feedback feedback = new Feedback();
    GeneralFunctions.GeneralFunctions geFunction = new GeneralFunctions.GeneralFunctions();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                GetFeedbackData();
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }

    private void GetFeedbackData()
    {
        try
        {
            string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            gvFeedBack.DataSource = feedback.GetFeedBack(Mobile);
            gvFeedBack.DataBind();
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
        }
    }

    protected void btnFeedBack_Click(object sender, EventArgs e)
    {
        try
        {
            string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            SqlDataReader sdr = feedback.GetTenant(Mobile);
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
                    feedback.SubmitFeedback(t_PropertyName, t_PropertyVale, t_Name, t_RoomNo, t_BedsText, t_MobileNo, t_BedsValue, rdbfood.SelectedItem.Text, rdbfood.SelectedItem.Value, rdbHOUSEKEEPING.SelectedItem.Text, rdbHOUSEKEEPING.SelectedItem.Value, rdbATMOSPHERE.SelectedItem.Text, rdbATMOSPHERE.SelectedItem.Value, rdbSTAFFBEHAVIOUR.SelectedItem.Text, rdbSTAFFBEHAVIOUR.SelectedItem.Value, rdbWIFICONNECTIVITY.SelectedItem.Text, rdbWIFICONNECTIVITY.SelectedItem.Value, rdbRECOMMEND.SelectedItem.Text, rdbRECOMMEND.SelectedItem.Value, txtPOINTSOFIMPROVEMENTS.Text, txtWORDSOFAPPRECIATION.Text);
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
                    txtPOINTSOFIMPROVEMENTS.Text = string.Empty;
                    txtWORDSOFAPPRECIATION.Text = string.Empty;
                    rdbfood.SelectedIndex = -1;
                    rdbHOUSEKEEPING.SelectedIndex = -1;
                    rdbATMOSPHERE.SelectedIndex = -1;
                    rdbSTAFFBEHAVIOUR.SelectedIndex = -1;
                    rdbWIFICONNECTIVITY.SelectedIndex = -1;
                    rdbRECOMMEND.SelectedIndex = -1;
                    GetFeedbackData();
                }
            }
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
        }
    }
}