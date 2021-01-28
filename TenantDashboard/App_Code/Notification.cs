using ConnectionString;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class Notification
{
    public DataSet GetNotification(string mobile)
    {
        string sql = "select TOP 3 a_id ,a_PropertyName ,a_propertyVal ,a_Text ,a_value ,a_mobile , a_Details , convert(varchar , a_crdate , 103) as a_crdate, st_mobile from  Announcement where st_mobile ='" + mobile + "' or a_Text ='all'  order by a_id DESC ";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public DataSet GetNotificationAll(string mobile)
    {
        string sql = "select a_id ,a_PropertyName ,a_propertyVal ,a_Text ,a_value ,a_mobile , a_Details , convert(varchar , a_crdate , 103) as a_crdate, st_mobile from  Announcement where st_mobile ='" + mobile + "' or a_Text ='all'  order by a_id DESC ";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }
}