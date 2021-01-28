using ConnectionString;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class ExitProperty
{
    public SqlDataReader GetTenant(string mobile)
    {
        string sql = "select t_id ,t_mobile ,t_PropertyName ,t_PropertyVale ,t_Name ,t_RoomNo ,t_BedsText , t_BedsValue ,t_MobileNo , t_SecurityMoney , t_RentMoney , t_DateOfJoining	, t_RentDate ,t_Details , t_crdate, t_mdfydate , KycStatus ,t_BankDetailStatus , t_LockinPeriodValue , t_LockinPeriodText from tenants where t_MobileNo = '" + mobile + "' ";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void ApplyExit(string t_PropertyName, string t_PropertyVale, string t_Name, string t_RoomNo, string t_BedsText, string t_MobileNo, string t_BedsValue, string CheckoutDate, string msg , string BankNameValue, string BankNameText, string BranchName, string Accountnumber, string IFSCcode, string Accountholdername , string MobileNo , string ackofBankInfo)
    {
        string sql = "insert into tbl_ExitProperty(tep_PropertyName,  tep_PropertyVale, tep_Name, tep_RoomNo, tep_BedsText,  tep_MobileNo, tep_BedsValue, tep_CheckoutDate, tep_msg , tep_BankNameValue, tep_BankNameText, tep_BranchName, tep_Accountnumber, tep_IFSCcode, tep_Accountholdername , tep_AlternateMobileNo ,tep_ackofBankInfo , tep_crdate , tepmdfyDate)values('" + t_PropertyName + "', '" + t_PropertyVale + "', '" + t_Name + "', '" + t_RoomNo + "', '" + t_BedsText + "', '" + t_MobileNo + "', '" + t_BedsValue + "', '" + CheckoutDate + "', '" + msg + "' , '" + BankNameValue + "', '" + BankNameText + "', '" + BranchName + "', '" + Accountnumber + "', '" + IFSCcode + "', '" + Accountholdername + "' , '" + MobileNo + "' ,  '" + ackofBankInfo + "' ,  getdate(), getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public object GetExitPropertyRecord(string mobile)
    {
        string sql = "select tep_id ,tep_PropertyName,  tep_PropertyVale, tep_Name, tep_RoomNo, tep_BedsText,  tep_MobileNo, tep_BedsValue, convert(varchar , tep_CheckoutDate , 103 ) as tep_CheckoutDate , tep_msg , tep_BankNameValue, tep_BankNameText, tep_BranchName, tep_Accountnumber, tep_IFSCcode, tep_Accountholdername , tep_AlternateMobileNo , convert(varchar , tep_crdate , 103 ) as  tep_crdate , tepmdfyDate from  tbl_ExitProperty where tep_MobileNo = '" + mobile + "'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader GetDublicateExitProperty(string mobile)
    {
        string sql = "select tep_id , tep_Name from  tbl_ExitProperty where tep_MobileNo = '" + mobile + "'";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }
}