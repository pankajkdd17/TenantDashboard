using ConnectionString;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class Leave
{
    public SqlDataReader GetTenant(string mobile)
    {
        string sql = "select t_id ,t_mobile ,t_PropertyName ,t_PropertyVale ,t_Name ,t_RoomNo ,t_BedsText , t_BedsValue ,t_MobileNo , t_SecurityMoney , t_RentMoney , t_DateOfJoining	, t_RentDate ,t_Details , t_crdate, t_mdfydate , KycStatus ,t_BankDetailStatus , t_LockinPeriodValue , t_LockinPeriodText from tenants where t_MobileNo = '" + mobile + "' ";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void ApplyLeave(string t_PropertyName, string t_PropertyVale, string t_Name, string t_RoomNo, string t_BedsText, string t_MobileNo, string t_BedsValue, string LeaveStartDate, string LeaveEndDate, string FatherName, string FatherMobile, string msg)
    {
        string sql = "insert into tbl_Leave (tl_PropertyName, tl_PropertyVale, tl_Name, tl_RoomNo,  tl_BedsText, tl_MobileNo, tl_BedsValue, tl_LeaveStartDate, tl_LeaveEndDate, tl_FatherName, tl_FatherMobile, tl_msg , tl_cr_date , tl_crmdfy_date)values('" + t_PropertyName + "', '" + t_PropertyVale + "', '" + t_Name + "', '" + t_RoomNo + "', '" + t_BedsText + "', '" + t_MobileNo + "', '" + t_BedsValue + "', '" + LeaveStartDate + "', '" + LeaveEndDate + "', '" + FatherName + "', '" + FatherMobile + "', '" + msg + "' , getdate(), getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public object Getleave(string mobile)
    {
        string sql = "select tl_id, tl_PropertyName, tl_PropertyVale, tl_Name, tl_RoomNo,  tl_BedsText, tl_MobileNo, tl_BedsValue, convert(varchar , tl_LeaveStartDate , 103 ) as tl_LeaveStartDate , convert(varchar , tl_LeaveEndDate , 103 ) as tl_LeaveEndDate, tl_FatherName, tl_FatherMobile, tl_msg , tl_cr_date , tl_crmdfy_date from tbl_Leave where tl_MobileNo ='" + mobile + "' order by tl_id desc ";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }
}