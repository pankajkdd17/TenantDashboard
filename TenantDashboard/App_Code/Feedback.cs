using ConnectionString;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class Feedback
{
    public SqlDataReader GetTenant(string mobile)
    {
        string sql = "select t_id ,t_mobile ,t_PropertyName ,t_PropertyVale ,t_Name ,t_RoomNo ,t_BedsText , t_BedsValue ,t_MobileNo , t_SecurityMoney , t_RentMoney , t_DateOfJoining	, t_RentDate ,t_Details , t_crdate, t_mdfydate , KycStatus ,t_BankDetailStatus , t_LockinPeriodValue , t_LockinPeriodText from tenants where t_MobileNo = '" + mobile + "' ";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void SubmitFeedback(string tfb_PropertyName, string tfb_PropertyVale, string tfb_Name, string tfb_RoomNo, string tfb_BedsText, string tfb_MobileNo, string tfb_BedsValue, string tfb_rdbfoodText, string tfb_rdbfoodValue, string tfb_rdbHOUSEKEEPINGText, string tfb_rdbHOUSEKEEPINGValue, string tfb_rdbATMOSPHEREText, string tfb_rdbATMOSPHEREValue, string tfb_rdbSTAFFBEHAVIOURText, string tfb_rdbSTAFFBEHAVIOURValue, string tfb_rdbWIFICONNECTIVITYText, string tfb_rdbWIFICONNECTIVITYValue, string tfb_rdbRECOMMENDText, string tfb_rdbRECOMMENDValue, string tfb_POINTSOFIMPROVEMENTS, string tfb_WORDSOFAPPRECIATION)
    {
        string sql = "insert into tbl_feedback(tfb_PropertyName,  tfb_PropertyVale,  tfb_Name,  tfb_RoomNo,  tfb_BedsText,  tfb_MobileNo,  tfb_BedsValue,  tfb_rdbfoodText,  tfb_rdbfoodValue,  tfb_rdbHOUSEKEEPINGText,  tfb_rdbHOUSEKEEPINGValue,  tfb_rdbATMOSPHEREText,  tfb_rdbATMOSPHEREValue,  tfb_rdbSTAFFBEHAVIOURText,  tfb_rdbSTAFFBEHAVIOURValue,  tfb_rdbWIFICONNECTIVITYText,  tfb_rdbWIFICONNECTIVITYValue,  tfb_rdbRECOMMENDText,  tfb_rdbRECOMMENDValue,  tfb_POINTSOFIMPROVEMENTS,  tfb_WORDSOFAPPRECIATION , tfb_crdate ,tfb_mdfydate)values('"+ tfb_PropertyName +"' , '"+  tfb_PropertyVale+"', '"+  tfb_Name+"', '"+  tfb_RoomNo+"', '"+  tfb_BedsText+"', '"+  tfb_MobileNo+"', '"+  tfb_BedsValue+"', '"+  tfb_rdbfoodText+"', '"+  tfb_rdbfoodValue+"', '"+  tfb_rdbHOUSEKEEPINGText+"', '"+  tfb_rdbHOUSEKEEPINGValue+"', '"+  tfb_rdbATMOSPHEREText+"', '"+  tfb_rdbATMOSPHEREValue+"', '"+  tfb_rdbSTAFFBEHAVIOURText+"', '"+  tfb_rdbSTAFFBEHAVIOURValue+"', '"+  tfb_rdbWIFICONNECTIVITYText+"', '"+  tfb_rdbWIFICONNECTIVITYValue+"', '"+  tfb_rdbRECOMMENDText+"', '"+  tfb_rdbRECOMMENDValue + "', '"+  tfb_POINTSOFIMPROVEMENTS + "', '" + tfb_WORDSOFAPPRECIATION + "' , getdate() , getdate() )";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public object GetFeedBack(string mobile)
    {
        string sql = "select tfb_id , tfb_rdbfoodText,  tfb_rdbfoodValue,  tfb_rdbHOUSEKEEPINGText,  tfb_rdbHOUSEKEEPINGValue,  tfb_rdbATMOSPHEREText,  tfb_rdbATMOSPHEREValue,  tfb_rdbSTAFFBEHAVIOURText,  tfb_rdbSTAFFBEHAVIOURValue,  tfb_rdbWIFICONNECTIVITYText,  tfb_rdbWIFICONNECTIVITYValue,  tfb_rdbRECOMMENDText,  tfb_rdbRECOMMENDValue,  tfb_POINTSOFIMPROVEMENTS,  tfb_WORDSOFAPPRECIATION , convert(varchar , tfb_crdate , 103) as tfb_crdate , tfb_mdfydate from tbl_feedback where tfb_MobileNo ='" + mobile + "' order by tfb_id desc ";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }
}