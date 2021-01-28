using ConnectionString;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class LateCheckIn
{
    GeneralFunctions.GeneralFunctions Gf = new GeneralFunctions.GeneralFunctions();
    public SqlDataReader GetTenant(string mobile)
    {
        string sql = "select t_id ,t_mobile ,t_PropertyName ,t_PropertyVale ,t_Name ,t_RoomNo ,t_BedsText , t_BedsValue ,t_MobileNo , t_SecurityMoney , t_RentMoney , t_DateOfJoining	, t_RentDate ,t_Details , t_crdate, t_mdfydate , KycStatus ,t_BankDetailStatus , t_LockinPeriodValue , t_LockinPeriodText from tenants where t_MobileNo = '" + mobile + "' ";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void ApplyLateCheckin(string t_PropertyName, string t_PropertyVale, string t_Name, string t_RoomNo, string t_BedsText, string t_MobileNo, string t_BedsValue, string LateCheckinDate, string lateCheckinTime, string FatherName, string FatherMobile, string msg)
    {
        string sql = "insert into tbl_LateCheckin(tlc_PropertyName, tlc_PropertyVale, tlc_Name, tlc_RoomNo,  tlc_BedsText, tlc_MobileNo, tlc_BedsValue, tlc_LateCheckinDate, tlc_LateCheckinTime, tlc_FatherName, tlc_FatherMobile, tlc_msg , tlc_cr_date , tlc_crmdfy_date)values('" + t_PropertyName + "', '" + t_PropertyVale + "', '" + t_Name + "', '" + t_RoomNo + "', '" + t_BedsText + "', '" + t_MobileNo + "', '" + t_BedsValue + "', '" + LateCheckinDate + "', '" + lateCheckinTime + "', '" + FatherName + "', '" + FatherMobile + "', '" + msg + "' , getdate(), getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public object GetLateCheckinRecord(string mobile)
    {
        string sql = "select tlc_id , tlc_PropertyName, tlc_PropertyVale, tlc_Name, tlc_RoomNo,  tlc_BedsText, tlc_MobileNo, tlc_BedsValue, tlc_LateCheckinDate, tlc_LateCheckinTime, tlc_FatherName, tlc_FatherMobile, tlc_msg , tlc_cr_date , tlc_crmdfy_date from tbl_LateCheckin where  tlc_MobileNo = '"+ mobile + "' order by tlc_id desc ";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }
}