using ConnectionString;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

public class AllProperty
{
    public DataSet GetAllProperty()
    {
        string sql = "select p_id , p_name , p_gender, p_address, p_maplink , p_StartPrice , p_discountprice , p_DicountPercent, p_image1Path , p_image2Path , p_image3Path from Property where  p_id > 0";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }


    public DataSet GetFemaleProperty()
    {
        string sql = "select p_id , p_name , p_gender, p_address, p_maplink , p_StartPrice , p_discountprice , p_DicountPercent, p_image1Path , p_image2Path , p_image3Path  from Property where  p_id > 0 and p_gender= 'Female'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public DataSet GetMaleProperty()
    {
        string sql = "select p_id , p_name , p_gender, p_address, p_maplink , p_StartPrice , p_discountprice , p_DicountPercent, p_image1Path , p_image2Path , p_image3Path from Property where  p_id > 0 and p_gender= 'Male'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public DataSet GetColivingProperty()
    {
        string sql = "select p_id , p_name , p_gender, p_address, p_maplink , p_StartPrice , p_discountprice , p_DicountPercent, p_image1Path , p_image2Path , p_image3Path from Property where  p_id > 0 and p_gender= 'Coliving'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }
    public SqlDataReader GetAllPropertyImageById(string id)
    {

        string sql = "select p_id ,  p_image1Path , p_image2Path , p_image3Path  from Property where  p_id > 0 and p_id = '" + id + "'";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }
    public SqlDataReader GetAllPropertyById(string id)
    {

        string sql = "select p_id , p_name , p_gender, p_address, p_maplink , p_mgName , p_pgMobile , p_StartPrice , p_discountprice , p_DicountPercent, p_image1Path , p_image2Path , p_image3Path  from Property where  p_id > 0 and p_id = '" + id + "'";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public DataSet GetAllNonACRoomTypeById(string p_id)
    {
        string sql = "SELECT sp_id , sp_RoomStartingRoomType  FROM tbl_PropertyStartingPrice where sp_AcNonAC = 'NON-AC' and  sp_PropertyValue ='" + p_id + "'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }
    public DataSet GetAllACRoomTypeById(string p_id)
    {
        string sql = "SELECT sp_id , sp_RoomStartingRoomType  FROM tbl_PropertyStartingPrice where sp_AcNonAC = 'AC' and  sp_PropertyValue ='" + p_id + "'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }
    public DataSet GetACStartingPrice(string p_id)
    {
        string sql = "SELECT sp_id , sp_AcNonAC , sp_PropertyName, sp_PropertyValue , sp_RoomStartingRoomType, sp_RoomStartingPrice  FROM tbl_PropertyStartingPrice where sp_AcNonAC = 'AC' and  sp_PropertyValue ='" + p_id + "'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public object GetNonACACStartingPrice(string p_id)
    {
        string sql = "SELECT sp_id , sp_AcNonAC , sp_PropertyName, sp_PropertyValue , sp_RoomStartingRoomType, sp_RoomStartingPrice  FROM tbl_PropertyStartingPrice where sp_AcNonAC = 'NON-AC' and  sp_PropertyValue ='" + p_id + "'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }
}