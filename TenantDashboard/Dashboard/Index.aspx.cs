using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_Index : System.Web.UI.Page
{
    AddUsers addUsers = new AddUsers();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"]!= null)
            {
                string mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                GettenantsDetails(mobile);
                GettenantsDues(mobile);
                //GettenantsAnnouncement(mobile);
            }
            else
            {
               // Response.Cookies["UserDetails"].Expires = DateTime.Now.AddYears(-1);
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }


    }


    private void GettenantsDetails(string mobile)
    {
        try
        {
            SqlDataReader sdr = addUsers.Loadtenants(mobile);
            if (sdr.HasRows)
            {
                if (sdr.Read())
                {
                    lblName.Text = sdr["t_Name"].ToString();
                    lblMobile.Text = sdr["t_MobileNo"].ToString();
                    lblProperty.Text = sdr["t_PropertyName"].ToString();
                    RoomNo.Text = sdr["t_RoomNo"].ToString();
                    lblSecurityDeposit.Text = sdr["t_SecurityMoney"].ToString();
                    lblRoomRentAmount.Text = sdr["t_RentMoney"].ToString();
                    lblBedAllotedType.Text = sdr["t_BedsText"].ToString();
                    lblKYCStatus.Text = sdr["KycStatus"].ToString();
                    lblDateOfJoining.Text = sdr["t_DateOfJoining"].ToString();
                    //select t_id ,t_mobile , t_PropertyName , t_PropertyVale , t_Name , t_MobileNo , t_RoomNo , t_SecurityMoney ,t_BedsText , t_RentMoney , KycStatus , t_BankDetailStatus ,  convert(varchar, t_DateOfJoining, 103) as t_DateOfJoining, t_RentDate, t_Details , convert(varchar, t_crdate, 103) as t_crdate 
                }
            }
            
            sdr.Close();
        }
        catch (Exception ex)
        {
            string errormsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errormsg + "')</script>", false);
        }
    }


    private void GettenantsDues(string mobile)
    {
        try
        {
            SqlDataReader sdr = addUsers.getDues(mobile);
            if (sdr.HasRows)
            {
                if (sdr.Read())
                {
                    lblDueType.Text = sdr["d_DuesTypeText"].ToString();
                    lblDueAmount.Text = sdr["d_DuesAmount"].ToString();
                    //lblDateOfJoining.Text = sdr["t_DateOfJoining"].ToString();
                    //lblDateOfJoining.Text = sdr["t_DateOfJoining"].ToString();
                    //select d_id, d_PayeeText, d_PayeeValue, d_RoomNo, d_t_Mobile, d_DuesTypeText, d_DuesTypeValue, d_DuesAmount, CONVERT(varchar, d_DuesDate, 103 ) as d_DuesDate , CONVERT(varchar, d_DuesMonth, 103) as d_DuesMonth ,  d_Remark ,convert(varchar, d_crdate, 103) as d_crdate ,
                }
                sdr.Close();
            }
            else
            {
                lblDueType.Text = "Not Available";
                lblDueAmount.Text = "Paid";
            }
           
        }
        catch (Exception ex)
        {
            string errormsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errormsg + "')</script>", false);
        }
    }
    //private void GettenantsAnnouncement(string mobile)
    //{
    //    try
    //    {
    //        GridView1.DataSource = addUsers.LoadAnnouncement(mobile);
    //        GridView1.DataBind();
    //    }
    //    catch (Exception ex)
    //    {
    //        string errormsg = ex.Message.ToString();
    //        ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errormsg + "')</script>", false);
    //    }
    //}
}