using ConnectionString;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
public class UpdateProfile
{
    public SqlDataReader GetTenant(string mobile)
    {
        string sql = "select t_id ,t_mobile ,t_PropertyName ,t_PropertyVale ,t_Name ,t_RoomNo ,t_BedsText , t_BedsValue ,t_MobileNo , t_SecurityMoney , t_RentMoney , t_DateOfJoining	, t_RentDate ,t_Details , t_crdate, t_mdfydate , KycStatus ,t_BankDetailStatus , t_LockinPeriodValue , t_LockinPeriodText , t_PhotoName ,t_PhotoNamePath ,t_email ,t_gender , t_password ,t_termsCondition ,t_existingStatus , t_ParentName , t_ParentPhone ,t_CommunicationAddres from tenants where t_MobileNo = '" + mobile + "' ";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public int UpdatePhoto(string t_MobileNo, string t_PhotoName, string t_PhotoNamePath)
    {
        string sql ="update tenants set t_PhotoName = '" + t_PhotoName + "', t_PhotoNamePath = '" + t_PhotoNamePath + "' WHERE t_MobileNo = '" + t_MobileNo + "'";
        return SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }
   
    public void UpdateProfileRecord(string TenantName, string Gender, string Email, string ParentName, string ParentMobile, string Communicationaddress, string t_Mobile)
    {
        string sql = "update tenants set t_Name ='"+ TenantName + "' , t_gender = '"+ Gender + "' , t_email ='"+ Email + "' , t_ParentName = '"+ ParentName + "' , t_ParentPhone = '"+ ParentMobile + "' , t_CommunicationAddres = '"+ Communicationaddress + "' where t_MobileNo = '"+ t_Mobile + "' ";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void AddKycDocuments(string mobile, string identityProof, string NameOnIdentity, string IdentityNo, string filenamePhotoFront, string pathPhotoFront, string filenamePhotoBack, string pathPhotoBack, string ep_PropertyName, string ep_propertyvalue)
    {
        string sql = "insert into kycDocs(s_mobile ,  k_docsName , k_NameOnDocs , k_docsIdNo ,  k_frontName , k_frontPath , k_BackName ,k_BackPath , ep_PropertyName, ep_propertyvalue , k_cr_date , k_mdfy_date  ) values('" + mobile + "','" + identityProof + "','" + NameOnIdentity + "','" + IdentityNo + "','" + filenamePhotoFront + "', '" + pathPhotoFront + "','" + filenamePhotoBack + "','" + pathPhotoBack + "', '" + ep_PropertyName + "' ,'" + ep_propertyvalue + "',  getdate() , getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }
    public void UpdateTenantsKYC(string mobile)
    {
        string sql = "update Tenants set KycStatus ='Uploaded' where t_MobileNo ='" + mobile + "'";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader GetTenantsKYC(string t_MobileNo)
    {
        string sql = "select k_id , s_mobile ,  k_docsName , k_NameOnDocs , k_docsIdNo ,  k_frontName , k_frontPath , k_BackName ,k_BackPath , ep_PropertyName, ep_propertyvalue  from kycDocs where s_mobile = '" + t_MobileNo + "'";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }
}