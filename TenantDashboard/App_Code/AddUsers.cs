using ConnectionString;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AddUsers
/// </summary>
public class AddUsers
{
    public AddUsers()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    GeneralFunctions.GeneralFunctions Gf = new GeneralFunctions.GeneralFunctions();
    public void AddUser(string FullName, string Email, string Mobile, string gender, string Pssword, string chbvalue)
    {
        string sql = "insert into signup(s_fullname , s_email, s_mobile, s_gender , s_password ,  s_check, s_cr_date, s_mdfy_date , s_usertype , s_isActive ) values('" + FullName + "','" + Email + "','" + Mobile + "','" + gender + "','" + Pssword + "','" + chbvalue + "',getdate() ,getdate() ,'user' , 0)";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public int UpdateUser(string FullName, string Email, string gender, string Pssword, string chbvalue, string mobile)
    {
        string sql = @"UPDATE [signup] SET [s_fullname] = '" + FullName + "', [s_email] = '" + Email + "',[s_gender]='" + gender + "',[s_password]='" + Pssword + "',[s_check]='" + chbvalue + "'  WHERE s_mobile ''" + mobile + "";
        return SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader GetSignupDetails(string mobile)
    {
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, "select s_id, s_photo , s_photoPath , s_fullname, s_email , s_gender , s_mobile  from signup  where s_mobile='" + mobile + "'");
    }

    public DataSet GetUserDetails(string mobile)
    {
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, "select * from signup  where s_mobile='" + mobile + "'");
    }

    public DataSet getpgManager()
    {
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, " select pg.pgm_name , pg.pgm_mobile , p.p_name ,p.p_address from pg_manager pg inner join PropertyDetails p on pg.pgm_id=p.p_id");
    }

    public void addvisitedUser(string s_name, string s_mobile, string s_gender, string p_name, string p_address, string pgmName, string pgmMobile, string roomtype, string v_date, string v_time)
    {
        string sql = "insert into ScheduleVisit(s_name , s_mobile,  s_gender ,  p_name , p_address , pgm_name ,  pgm_mobile , p_roomtype ,v_date , v_timeslot , v_crdate , v_mdfydate) values ('" + s_name + "','" + s_mobile + "','" + s_gender + "','" + p_name + "', '" + p_address + "','" + pgmName + "','" + pgmMobile + "','" + roomtype + "','" + Gf.dmytomdy(v_date) + "','" + v_time + "', getdate() ,getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void addSchedulevisitedUser(string property_id , string s_name, string s_mobile, string s_gender, string p_name, string p_address, string MapLink, string pgmName, string pgmMobile, string roomtype, string v_date, string v_time)
    {
        string sql = "insert into ScheduleVisit(property_id , s_name , s_mobile,  s_gender ,  p_name , p_address , p_MapLink , pgm_name ,  pgm_mobile , p_roomtype ,v_date , v_timeslot , v_crdate , v_mdfydate) values ('" + property_id + "','" + s_name + "','" + s_mobile + "','" + s_gender + "','" + p_name + "', '" + p_address + "', '" + MapLink + "','" + pgmName + "','" + pgmMobile + "','" + roomtype + "','" + Gf.dmytomdy(v_date) + "','" + v_time + "', getdate() ,getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void addBookingUser(string s_name, string s_mobile, string s_gender, string bookingAmount, string p_name, string p_address, string pgmName, string pgmMobile, string roomtype, string b_date, string b_time)
    {
        string sql = "insert into BookNow(s_name , s_mobile,  s_gender , b_amount , p_name , p_address , pgm_name ,  pgm_mobile , p_roomtype , b_date , b_timeslot , b_status , b_crdate , b_mdfydate ) values ('" + s_name + "','" + s_mobile + "','" + s_gender + "','" + bookingAmount + "','" + p_name + "', '" + p_address + "','" + pgmName + "','" + pgmMobile + "','" + roomtype + "','" + Gf.dmytomdy(b_date) + "','" + b_time + "', 'Booked' , getdate() , getdate() )";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void addBookingUseracc(string property_id , string trascId, string s_name, string s_mobile, string s_gender, string bookingAmount, string p_name, string p_address, string pgmName, string pgmMobile, string roomtype)
    {
        string sql = "insert into BookNow( property_id , trascId , s_name , s_mobile,  s_gender , b_amount , p_name , p_address , pgm_name ,  pgm_mobile , p_roomtype , b_status ,b_date , b_crdate , b_mdfydate ) values ('" + property_id + "', '" + trascId + "','" + s_name + "','" + s_mobile + "','" + s_gender + "','" + bookingAmount + "','" + p_name + "', '" + p_address + "','" + pgmName + "','" + pgmMobile + "','" + roomtype + "', 'pending' , getdate() ,  getdate() , getdate() )";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void UpdateTenantsKYC(string mobile)
    {
        string sql = "update Tenants set KycStatus ='Uploaded' where t_MobileNo ='" + mobile + "'";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void UpdateTenantsBankData(string mobile)
    {
        string sql = "update Tenants set t_BankDetailStatus ='Uploaded' where t_MobileNo ='" + mobile + "'";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }
    public DataSet ViewVisitings(string s_mobile)
    {
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, "select p_name , p_address, pgm_name , pgm_mobile , CONVERT(VARCHAR, v_date, 103) as v_date , v_timeslot,  s_name , s_mobile  from ScheduleVisit where s_mobile='" + s_mobile + "' ");
    }


    public DataSet ViewBookings(string s_mobile)
    {
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, "select b_id , p_name , p_address, pgm_name ,  pgm_mobile ,b_amount, CONVERT(VARCHAR, b_date, 103) as b_date , b_timeslot,  s_name , s_mobile , b_status  from BookNow where s_mobile='" + s_mobile + "' ");
    }

    public int UpdateProfileData(string Phone, string fullName, string email, string gender)
    {
        string sql = @"UPDATE [signup] SET [s_mobile] = '" + Phone + "', [s_fullname] = '" + fullName + "',[s_email]='" + email + "',[s_gender]='" + gender + "' , [s_mdfy_date] = getdate() WHERE s_mobile ='" + Phone + "'";
        return SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }


    public int UpdatePhoto(string Phone, string s_photo, string s_photoPath)
    {
        string sql = @"UPDATE [signup] SET ";

        if (s_photo.Length > 0)
        {
            sql = sql + "  [s_photo] = '" + s_photo + "', [s_photoPath] = '" + s_photoPath + "'";
        }

        sql = sql + " , [s_mdfy_date] = getdate() WHERE s_mobile ='" + Phone + "'";
        return SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public int UpdateStatus(string transID, string Mobile)
    {
        string sql = @"UPDATE [BookNow] SET [b_status] = 'Booked' where trascId = '" + transID + "'  and s_mobile = '" + Mobile + "'";
        return SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }


    public void AddProfle(string mobile, string rdbfood, string rdbSmoke, string rdbDrink, string rdbStay, string allergies)
    {
        string sql = "insert into tblprofile(s_mobile ,  p_food , p_smok , p_drink , p_stay ,  p_allergies , p_cr_date , p_mdfy_date ) values('" + mobile + "','" + rdbfood + "','" + rdbSmoke + "','" + rdbDrink + "','" + rdbStay + "', '" + allergies + "',  getdate() , getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }


    public void AddKycDocuments(string mobile, string identityProof, string NameOnIdentity, string IdentityNo, string filenamePhotoFront, string pathPhotoFront, string filenamePhotoBack, string pathPhotoBack , string ep_PropertyName , string ep_propertyvalue)
    {
        string sql = "insert into kycDocs(s_mobile ,  k_docsName , k_NameOnDocs , k_docsIdNo ,  k_frontName , k_frontPath , k_BackName ,k_BackPath , ep_PropertyName, ep_propertyvalue , k_cr_date , k_mdfy_date  ) values('" + mobile + "','" + identityProof + "','" + NameOnIdentity + "','" + IdentityNo + "','" + filenamePhotoFront + "', '" + pathPhotoFront + "','" + filenamePhotoBack + "','" + pathPhotoBack + "', '" + ep_PropertyName + "' ,'" + ep_propertyvalue + "',  getdate() , getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }


    public void AddBankDetails(string mobile, string BankName, string AccountHolderName, string BankAccountNo, string ifsccode, string Branch ,string b_PropertyName, string b_PropertyValue )
    {
        string sql = "insert into BankDetails(s_mobile ,  b_Name , b_AccountHolderName , b_AccountNo ,  b_IfscCode , b_branch , b_PropertyName , b_PropertyValue , b_cr_date , b_mdfy_date) values('" + mobile + "','" + BankName + "','" + AccountHolderName + "','" + BankAccountNo + "','" + ifsccode + "', '" + Branch + "', '" + b_PropertyName + "',  '" + b_PropertyValue + "' ,   getdate() , getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }


    public void AddCareers(string FullName, string Mobile, string email, string Applyfor, string filenameUploadCv, string pathUploadCv)
    {
        string sql = "insert into Careers(c_FullName ,  c_Mobile , c_email , c_Applyfor ,  c_filenameUploadCv , c_pathUploadCv , c_crdate , c_mdfydate) values('" + FullName + "','" + Mobile + "','" + email + "','" + Applyfor + "','" + filenameUploadCv + "', '" + pathUploadCv + "',   getdate() , getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }


    public void AddLeasProperty(string FullName, string Mobile, string City, string NoBedRoom, string NoOfWashrooom, string PropertyAddress, string Status, string Map)
    {
        string sql = "insert into LeasProperty(l_FullName ,  l_Mobile , l_City , l_NoBedRoom ,  l_NoOfWashrooom , l_PropertyAddress ,  l_Status , l_Map , l_crdate , l_mdfyDate) values ('" + FullName + "','" + Mobile + "','" + City + "','" + NoBedRoom + "','" + NoOfWashrooom + "', '" + PropertyAddress + "','" + Status + "','" + Map + "',  getdate() , getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void AddCoaching(string CoachingName, string FullName, string Mobile, string email, string Designation)
    {
        string sql = "insert into Coaching(c_CoachingName ,  c_FullName , c_Mobile , c_email ,  c_Designation , c_crdate , c_mdfyDate) values ('" + CoachingName + "','" + FullName + "','" + Mobile + "','" + email + "', '" + Designation + "',  getdate() , getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader GetTenants(string mobile)
    {
        string sql = "select t_name , t_MobileNo  , t_RoomNo  from Tenants where t_MobileNo = '" + mobile + "' ";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }


    public void AddComplaints(string t_name, string tc_PropertyName, string tc_PropertyVal, string t_MobileNo, string t_RoomNo, string TicketOfIssueText, string TicketOfIssueValue, string FacingissueText, string FacingissueValue, string FacingissueSubcategoryText, string FacingissueSubcategoryValue, string msg)
    {
        string sql = "insert into Ticketcomplaints(tc_Name  , tc_PropertyName , tc_PropertyVal ,tc_Mobile ,  tc_RoomNo  ,  tc_MainIssueText  , tc_MainIssueValue , tc_issueText , tc_issueValue , tc_subCatIssueText , tc_subCatIssueValue , tc_message  , tc_status , tc_crDate , tc_mdfyDate ) values ('" + t_name + "', '" + tc_PropertyName + "', '" + tc_PropertyVal + "','" + t_MobileNo + "', '" + t_RoomNo + "', '" + TicketOfIssueText + "', '" + TicketOfIssueValue + "', '" + FacingissueText + "', '" + FacingissueValue + "', '" + FacingissueSubcategoryText + "', '" + FacingissueSubcategoryValue + "', '" + msg + "' , 'unresolved' , getdate() , getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader GetToken(string Mobile)
    {
        string sql = "select Top 1 tc_id from Ticketcomplaints where tc_Mobile = '" + Mobile + "' order by tc_id DESC";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader GetProperty(string t_MobileNo)
    {
        string sql = "select t_PropertyName , t_PropertyVale , t_RoomNo from Tenants where t_MobileNo = '" + t_MobileNo + "'";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }
    public SqlDataReader GetTenantsKYC(string t_MobileNo)
    {
        string sql = "select k_id , s_mobile   from kycDocs where s_mobile = '" + t_MobileNo + "'";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader GetTenantsBankData(string t_MobileNo)
    {
        string sql = "select b_id , s_mobile   from BankDetails where s_mobile = '" + t_MobileNo + "'";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public DataSet GetfoodmenuSunday()
    {
        string sql = "select f_id ,  f_WeekdaysValue ,  f_WeekdaysText ,  f_Breakfast ,  CONVERT(varchar(15),CAST(f_BreakfastTime AS TIME),100) as f_BreakfastTime  ,  CONVERT(varchar(15),CAST(f_BreakfastTimeto AS TIME),100) as f_BreakfastTimeto  ,  f_Lunch , CONVERT(varchar(15),CAST(f_LunchTime AS TIME),100) as  f_LunchTime , CONVERT(varchar(15),CAST(f_LunchTimeTo AS TIME),100) as  f_LunchTimeTo , f_Snacks , CONVERT(varchar(15),CAST(f_SnacksTime AS TIME),100) as f_SnacksTime , CONVERT(varchar(15),CAST(f_SnacksTimeTo AS TIME),100) as f_SnacksTimeTo , f_Dinner , CONVERT(varchar(15),CAST(f_DinnarTime AS TIME),100) as f_DinnarTime ,  CONVERT(varchar(15),CAST(f_DinnarTimeTo AS TIME),100) as f_DinnarTimeTo from FoodMenu where f_WeekdaysText ='Sunday'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public DataSet GetfoodmenuMonday()
    {
        string sql = "select  f_id ,  f_WeekdaysValue ,  f_WeekdaysText ,  f_Breakfast ,  CONVERT(varchar(15),CAST(f_BreakfastTime AS TIME),100) as f_BreakfastTime  ,  CONVERT(varchar(15),CAST(f_BreakfastTimeto AS TIME),100) as f_BreakfastTimeto  ,  f_Lunch , CONVERT(varchar(15),CAST(f_LunchTime AS TIME),100) as  f_LunchTime , CONVERT(varchar(15),CAST(f_LunchTimeTo AS TIME),100) as  f_LunchTimeTo , f_Snacks , CONVERT(varchar(15),CAST(f_SnacksTime AS TIME),100) as f_SnacksTime , CONVERT(varchar(15),CAST(f_SnacksTimeTo AS TIME),100) as f_SnacksTimeTo , f_Dinner , CONVERT(varchar(15),CAST(f_DinnarTime AS TIME),100) as f_DinnarTime ,  CONVERT(varchar(15),CAST(f_DinnarTimeTo AS TIME),100) as f_DinnarTimeTo from FoodMenu where f_WeekdaysText ='Monday'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }


    public object GetfoodmenuTuesday()
    {
        string sql = "select  f_id ,  f_WeekdaysValue ,  f_WeekdaysText ,  f_Breakfast ,  CONVERT(varchar(15),CAST(f_BreakfastTime AS TIME),100) as f_BreakfastTime  ,  CONVERT(varchar(15),CAST(f_BreakfastTimeto AS TIME),100) as f_BreakfastTimeto  ,  f_Lunch , CONVERT(varchar(15),CAST(f_LunchTime AS TIME),100) as  f_LunchTime , CONVERT(varchar(15),CAST(f_LunchTimeTo AS TIME),100) as  f_LunchTimeTo , f_Snacks , CONVERT(varchar(15),CAST(f_SnacksTime AS TIME),100) as f_SnacksTime , CONVERT(varchar(15),CAST(f_SnacksTimeTo AS TIME),100) as f_SnacksTimeTo , f_Dinner , CONVERT(varchar(15),CAST(f_DinnarTime AS TIME),100) as f_DinnarTime ,  CONVERT(varchar(15),CAST(f_DinnarTimeTo AS TIME),100) as f_DinnarTimeTo from FoodMenu where f_WeekdaysText ='Tuesday'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public object GetfoodmenuWednesday()
    {
        string sql = "select  f_id ,  f_WeekdaysValue ,  f_WeekdaysText ,  f_Breakfast ,  CONVERT(varchar(15),CAST(f_BreakfastTime AS TIME),100) as f_BreakfastTime  ,  CONVERT(varchar(15),CAST(f_BreakfastTimeto AS TIME),100) as f_BreakfastTimeto  ,  f_Lunch , CONVERT(varchar(15),CAST(f_LunchTime AS TIME),100) as  f_LunchTime , CONVERT(varchar(15),CAST(f_LunchTimeTo AS TIME),100) as  f_LunchTimeTo , f_Snacks , CONVERT(varchar(15),CAST(f_SnacksTime AS TIME),100) as f_SnacksTime , CONVERT(varchar(15),CAST(f_SnacksTimeTo AS TIME),100) as f_SnacksTimeTo , f_Dinner , CONVERT(varchar(15),CAST(f_DinnarTime AS TIME),100) as f_DinnarTime ,  CONVERT(varchar(15),CAST(f_DinnarTimeTo AS TIME),100) as f_DinnarTimeTo from FoodMenu where f_WeekdaysText ='Wednesday'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public object GetfoodmenuThursday()
    {
        string sql = "select  f_id ,  f_WeekdaysValue ,  f_WeekdaysText ,  f_Breakfast ,  CONVERT(varchar(15),CAST(f_BreakfastTime AS TIME),100) as f_BreakfastTime  ,  CONVERT(varchar(15),CAST(f_BreakfastTimeto AS TIME),100) as f_BreakfastTimeto  ,  f_Lunch , CONVERT(varchar(15),CAST(f_LunchTime AS TIME),100) as  f_LunchTime , CONVERT(varchar(15),CAST(f_LunchTimeTo AS TIME),100) as  f_LunchTimeTo , f_Snacks , CONVERT(varchar(15),CAST(f_SnacksTime AS TIME),100) as f_SnacksTime , CONVERT(varchar(15),CAST(f_SnacksTimeTo AS TIME),100) as f_SnacksTimeTo , f_Dinner , CONVERT(varchar(15),CAST(f_DinnarTime AS TIME),100) as f_DinnarTime ,  CONVERT(varchar(15),CAST(f_DinnarTimeTo AS TIME),100) as f_DinnarTimeTo from FoodMenu where f_WeekdaysText ='Thursday'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public object GetfoodmenuFriday()
    {
        string sql = "select  f_id ,  f_WeekdaysValue ,  f_WeekdaysText ,  f_Breakfast ,  CONVERT(varchar(15),CAST(f_BreakfastTime AS TIME),100) as f_BreakfastTime  ,  CONVERT(varchar(15),CAST(f_BreakfastTimeto AS TIME),100) as f_BreakfastTimeto  ,  f_Lunch , CONVERT(varchar(15),CAST(f_LunchTime AS TIME),100) as  f_LunchTime , CONVERT(varchar(15),CAST(f_LunchTimeTo AS TIME),100) as  f_LunchTimeTo , f_Snacks , CONVERT(varchar(15),CAST(f_SnacksTime AS TIME),100) as f_SnacksTime , CONVERT(varchar(15),CAST(f_SnacksTimeTo AS TIME),100) as f_SnacksTimeTo , f_Dinner , CONVERT(varchar(15),CAST(f_DinnarTime AS TIME),100) as f_DinnarTime ,  CONVERT(varchar(15),CAST(f_DinnarTimeTo AS TIME),100) as f_DinnarTimeTo from FoodMenu where f_WeekdaysText ='Friday'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public object GetfoodmenuSaturday()
    {
        string sql = "select  f_id ,  f_WeekdaysValue ,  f_WeekdaysText ,  f_Breakfast ,  CONVERT(varchar(15),CAST(f_BreakfastTime AS TIME),100) as f_BreakfastTime  ,  CONVERT(varchar(15),CAST(f_BreakfastTimeto AS TIME),100) as f_BreakfastTimeto  ,  f_Lunch , CONVERT(varchar(15),CAST(f_LunchTime AS TIME),100) as  f_LunchTime , CONVERT(varchar(15),CAST(f_LunchTimeTo AS TIME),100) as  f_LunchTimeTo , f_Snacks , CONVERT(varchar(15),CAST(f_SnacksTime AS TIME),100) as f_SnacksTime , CONVERT(varchar(15),CAST(f_SnacksTimeTo AS TIME),100) as f_SnacksTimeTo , f_Dinner , CONVERT(varchar(15),CAST(f_DinnarTime AS TIME),100) as f_DinnarTime ,  CONVERT(varchar(15),CAST(f_DinnarTimeTo AS TIME),100) as f_DinnarTimeTo from FoodMenu where f_WeekdaysText ='Saturday'";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public DataSet GetNewComplaints(string mobile)
    {
        string sql = "select tc_id  , tc_Name  , tc_RoomNo  , tc_Mobile , tc_image , tc_MainIssueText  , tc_MainIssueValue , tc_issueText , tc_issueValue , tc_subCatIssueText , tc_subCatIssueValue , tc_message  , tc_status , convert(varchar , tc_crDate , 103) as tc_crDate  from Ticketcomplaints  where tc_Mobile ='" + mobile + "'  order by tc_id asc ";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader Loadtenants(string mobile)
    {
        string sql = "select t_id ,t_mobile , t_PropertyName , t_PropertyVale , t_Name , t_MobileNo , t_RoomNo , t_SecurityMoney ,t_BedsText , t_RentMoney , KycStatus , t_BankDetailStatus ,  convert(varchar , t_DateOfJoining ,103 ) as t_DateOfJoining, t_RentDate, t_Details , convert(varchar , t_crdate ,103 ) as t_crdate , t_mdfydate from Tenants where t_MobileNo = '" + mobile + "'";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public DataSet LoadAnnouncement(string mobile)
    {
        string sql = "select a_id , a_Text , a_Value , a_Details , convert(varchar , a_crdate , 103 ) as a_crdate from  Announcement where a_Text ='all' or  a_mobile = '" + mobile + "' ";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader getDues(string mobile)
    {
        string sql = "select d_id , d_PayeeText,  d_PayeeValue,  d_RoomNo,  d_t_Mobile,  d_DuesTypeText,  d_DuesTypeValue,  d_DuesAmount, CONVERT(varchar , d_DuesDate , 103 ) as d_DuesDate , CONVERT(varchar , d_DuesMonth , 103) as d_DuesMonth ,  d_Remark ,convert (varchar ,d_crdate ,103) as d_crdate ,d_mdfydate from  Dues where 1=1 and d_status= 'pending' and d_t_Mobile ='" + mobile + "' ";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }




    public SqlDataReader checkTenants(string mobile)
    {
        string sql = "select t_MobileNo from tenants where t_MobileNo ='" + mobile + "'";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void AddContact(string c_name, string c_email, string c_mobile, string c_gender, string c_msg)
    {
        string sql = "insert into Contact(c_name ,  c_email , c_mobile , c_gender ,  c_msg , c_crdate , c_mdfydate) values ('" + c_name + "','" + c_email + "','" + c_mobile + "','" + c_gender + "', '" + c_msg + "',  getdate() , getdate())";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader getprofile(string mobile)
    {
        string sql = @"SELECT s_photo , s_fullname , s_email , s_gender , s_mobile , s_photoPath  from signup WHERE s_mobile = '" + mobile + "'";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader getTenants(string mobile)
    {
        string sql = "select t_id ,t_mobile , t_PropertyName , t_PropertyVale , t_Name , t_MobileNo , t_RoomNo , t_SecurityMoney ,t_BedsText , t_RentMoney , t_DateOfJoining, t_RentDate, t_Details , t_crdate , t_mdfydate from Tenants where  t_MobileNo = '" + mobile + "'";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public void AddExitPropertyTenants(string t_PropertyName, string t_PropertyVale, string t_RoomNo, string t_Name, string t_MobileNo, string text, string DateOfExit, string Reason)
    {
        string sql = "insert into exitproperty(ep_PropertyName , ep_propertyvalue , ep_roomNo  , ep_tenantsname , ep_tenantsmobile , ep_text , ep_date , ep_reason , ep_status , ep_crdate , ep_modfydte )values('" + t_PropertyName + "' , '" + t_PropertyVale + "' , '" + t_RoomNo + "' ,  '" + t_Name + "' ,  '" + t_MobileNo + "' , '" + text + "' , '" + DateOfExit + "' , '" + Reason + "'  , 'pending' , getdate() , getdate() )";
        SqlHelper.ExecuteNonQuery(CnSettings.cnString1, CommandType.Text, sql);
    }

    public object LoadexitApplied(string mobile)
    {
        string sql = "select ep_id ,ep_PropertyName , ep_propertyvalue , ep_roomNo  , ep_tenantsname , ep_tenantsmobile , (ep_text + ' ' + convert(varchar ,ep_date , 103))   as Application ,  ep_reason , ep_status , ep_crdate , ep_modfydte from exitproperty where ep_tenantsmobile = '" + mobile + "' ";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }

    public SqlDataReader getdublicateSignup(string email, string phone)
    {
        string sql = @"SELECT s_email ,s_mobile  FROM signup WHERE s_email = '" + email + "' and s_mobile = '" + phone + "' ";
        return SqlHelper.ExecuteReader(CnSettings.cnString1, CommandType.Text, sql);
    }

    public object LoadPropert()
    {
        string sql = "select p_id , p_name , p_gender, p_address, p_maplink , p_StartPrice , p_discountprice , p_DicountPercent,  p_image1Path from Property where p_id > 0 order by p_id asc";
        return SqlHelper.ExecuteDataset(CnSettings.cnString1, CommandType.Text, sql);
    }
}