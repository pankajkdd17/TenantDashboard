using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard_profile_edit_profile : System.Web.UI.Page
{
    UpdateProfile updateProfile = new UpdateProfile();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (HttpContext.Current.Request.Cookies["UserDetails"] != null)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                GetTenantsProfile();
                GetTenantsKyc();
            }
            else
            {
                Response.Redirect("~/Dashboard/login.aspx");
            }
        }
    }

    private void GetTenantsKyc()
    {
        string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
        SqlDataReader sdr = updateProfile.GetTenantsKYC(Mobile);
        if (sdr.HasRows)
        {
            if (sdr.Read())
            {
                //select k_id, t_MobileNo, k_docsName, k_NameOnDocs, k_docsIdNo, k_frontName, k_frontPath, k_BackName, k_BackPath, ep_PropertyName, ep_propertyvalue
                string k_frontPath = sdr["k_frontPath"].ToString();
                string k_BackPath = sdr["k_BackPath"].ToString();
                if ((k_frontPath != string.Empty) && (k_frontPath != null))
                {
                    Image2.ImageUrl = sdr["k_frontPath"].ToString();
                }
                else
                {
                    Image2.ImageUrl = "~/Dashboard/images/IdentityProof/FrontAdhaarimage.jpg";
                }
                if ((k_BackPath != string.Empty) && (k_BackPath != null))
                {
                    Image3.ImageUrl = sdr["k_BackPath"].ToString();
                }
                else
                {
                    Image3.ImageUrl = "~/Dashboard/images/IdentityProof/BackAdhaarimage.jpg";
                }
                ddlidentityProof.SelectedItem.Text = sdr["k_docsName"].ToString();
                txtNameOnIdentity.Text = sdr["k_NameOnDocs"].ToString();
                txtIdentityNo.Text = sdr["k_docsIdNo"].ToString();
                
            }
        }
        else
        {
            Image2.ImageUrl = "~/Dashboard/images/IdentityProof/FrontAdhaarimage.jpg";
            Image3.ImageUrl = "~/Dashboard/images/IdentityProof/BackAdhaarimage.jpg";
        }
    }

    private void GetTenantsProfile()
    {
        try
        {
            string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            SqlDataReader sdr = updateProfile.GetTenant(Mobile);
            if (sdr.HasRows)
            {
                if (sdr.Read())
                {
                    string t_PhotoNamePath = sdr["t_PhotoNamePath"].ToString();
                    if ((t_PhotoNamePath != string.Empty) && (t_PhotoNamePath != null))
                    {
                        Image1.ImageUrl = sdr["t_PhotoNamePath"].ToString();
                    }
                    else
                    {
                        Image1.ImageUrl = "~/Dashboard/images/ProfilePhoto/male-ppdummy.jpg";
                    }
                    txtTenantName.Text = sdr["t_Name"].ToString();
                    txtTenantMobile.Text = sdr["t_MobileNo"].ToString();
                    txtProperty.Text = sdr["t_PropertyName"].ToString();
                    string PropertyValue = sdr["t_PropertyVale"].ToString();
                    
                    ddlGender.SelectedItem.Text = sdr["t_gender"].ToString();
                    txtRoomNo.Text = sdr["t_RoomNo"].ToString();
                    txtEmail.Text = sdr["t_email"].ToString();
                    txtParentName.Text = sdr["t_ParentName"].ToString();
                    txtParentMobile.Text = sdr["t_ParentPhone"].ToString();
                    txtCommunicationaddress.Text = sdr["t_CommunicationAddres"].ToString();
                }
            }
            else
            {
                Image1.ImageUrl = "~/Dashboard/images/ProfilePhoto/male-ppdummy.jpg";
            }
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
        }
    }

    protected void btnUpdateProfile_Click(object sender, EventArgs e)
    {
        try
        {
            string t_Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            updateProfile.UpdateProfileRecord(txtTenantName.Text, ddlGender.SelectedItem.Text, txtEmail.Text, txtParentName.Text, txtParentMobile.Text, txtCommunicationaddress.Text, t_Mobile);
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
            GetTenantsProfile();
            //var cookie = new System.Web.HttpCookie("UserDetails");
            //cookie.Values.Add("t_ParentName", txtTenantName.Text);
            //cookie.Values.Add("t_gender", ddlGender.SelectedItem.Text);
            //cookie.Values.Add("t_email", txtEmail.Text);
            //cookie.Values.Add("t_ParentName", txtParentName.Text);
            //cookie.Values.Add("t_ParentPhone", txtParentMobile.Text);
            //cookie.Values.Add("t_CommunicationAddres", txtCommunicationaddress.Text);
            //cookie.Expires = DateTime.Now.AddYears(1);
            //Response.Cookies.Add(cookie);
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
        }
    }
   
    protected void lbtnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            if(fuProfilePhoto.HasFile)
            {
                string Mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                string fileExtensionPhoto = System.IO.Path.GetExtension(fuProfilePhoto.FileName);
                int fileSizePhoto = fuProfilePhoto.PostedFile.ContentLength;

                string filenamePhoto = System.IO.Path.GetFileNameWithoutExtension(fuProfilePhoto.FileName) + DateTime.Now.ToString("ddMMyyyyHHmmssms") + System.IO.Path.GetExtension(fileExtensionPhoto);
                fuProfilePhoto.PostedFile.SaveAs(Server.MapPath("~/Dashboard/images/ProfilePhoto/") + filenamePhoto);
                string filepath = Server.MapPath("~/Dashboard/images/ProfilePhoto/");
                string pathPhoto = "/Dashboard/images/ProfilePhoto/" + filenamePhoto;
                if ((fileExtensionPhoto == ".jpg") || (fileExtensionPhoto == ".jpeg") || (fileExtensionPhoto == ".png"))
                {
                    updateProfile.UpdatePhoto(Mobile, filenamePhoto, pathPhoto);
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalertUpload();", true);
                    GetTenantsProfile();
                }
                else
                {
                    string errorMsg = "Please upload only .jpg , .jpeg , .png file";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
                }
            }
            else
            {
                string errorMsg = "Please select profile photo";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);

            }
        }
        catch (Exception ex)
        {
            string errorMsg = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + errorMsg + "')</script>", false);
        }
    }

    protected void btnUpdateKyc_Click(object sender, EventArgs e)
    {
        if ((CheckKycUploded() != true))
        {
            try
            {
                if (FileFront.HasFile && FileBack.HasFile)
                {
                    string fileExtensionPhotoFront = System.IO.Path.GetExtension(FileFront.FileName);
                    int fileSizeFront = FileFront.PostedFile.ContentLength;

                    string filenamePhotoFront = System.IO.Path.GetFileNameWithoutExtension(FileFront.FileName) + DateTime.Now.ToString("ddMMyyyyHHmmssms") + System.IO.Path.GetExtension(fileExtensionPhotoFront);
                    FileFront.PostedFile.SaveAs(Server.MapPath("~//Dashboard/images/IdentityProof") + filenamePhotoFront);
                    string filepathFront = Server.MapPath("/Dashboard/images/IdentityProof");
                    string pathPhotoFront = "/Dashboard/images/IdentityProof" + filenamePhotoFront;

                    string fileExtensionPhotoBack = System.IO.Path.GetExtension(FileBack.FileName);
                    int fileSizeBack = FileBack.PostedFile.ContentLength;

                    string filenamePhotoBack = System.IO.Path.GetFileNameWithoutExtension(FileBack.FileName) + DateTime.Now.ToString("ddMMyyyyHHmmssms") + System.IO.Path.GetExtension(fileExtensionPhotoBack);
                    FileBack.PostedFile.SaveAs(Server.MapPath("~//Dashboard/images/IdentityProof") + filenamePhotoBack);
                    string filepathBack = Server.MapPath("/Dashboard/images/IdentityProof");
                    string pathPhotoBack = "/Dashboard/images/IdentityProof" + filenamePhotoBack;

                    if (((fileExtensionPhotoFront == ".jpg") || (fileExtensionPhotoFront == ".jpeg") || (fileExtensionPhotoFront == ".png") || (fileExtensionPhotoFront == ".pdf")) && ((fileExtensionPhotoBack == ".jpg") || (fileExtensionPhotoBack == ".jpeg") || (fileExtensionPhotoBack == ".png") || (fileExtensionPhotoBack == ".pdf")))
                    {
                        string mobile = Request.Cookies["UserDetails"]["t_MobileNo"];
                        SqlDataReader sdr = updateProfile.GetTenant(mobile);
                        if (sdr.HasRows)
                        {
                            if (sdr.Read())
                            {
                                string propertyName = Request.Cookies["UserDetails"]["t_PropertyName"];
                                string propertyValue = Request.Cookies["UserDetails"]["t_PropertyVale"];
                                updateProfile.AddKycDocuments(mobile, ddlidentityProof.SelectedItem.Text, txtNameOnIdentity.Text, txtIdentityNo.Text, filenamePhotoFront, pathPhotoFront, filenamePhotoBack, pathPhotoBack, propertyName, propertyValue);
                                var cookie = new System.Web.HttpCookie("UserDetails");
                                updateProfile.UpdateTenantsKYC(mobile);
                                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalertkyc();", true);
                                txtNameOnIdentity.Text = string.Empty;
                                txtIdentityNo.Text = string.Empty;
                                GetTenantsKyc();
                            }
                        }
                    }
                    else
                    {
                        string text = "Only .jpg, .jpeg, .png, .pdf file are allowed for upload";
                        ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
                    }

                }
                else
                {
                    string text = "Please select required file!";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
                }
            }
            catch (Exception ex)
            {
                string text = ex.Message.ToString();
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
            }
        }
    }

    private bool CheckKycUploded()
    {
        bool result = false;
        try
        {
            string Tenantmobile = Request.Cookies["UserDetails"]["t_MobileNo"];
            SqlDataReader sdr1 = updateProfile.GetTenantsKYC(Tenantmobile);
            if (sdr1.HasRows)
            {
                if (sdr1.Read())
                {
                    string k_Mobile = sdr1["s_mobile"].ToString();
                    string text = "Your  KYC by mobile " + k_Mobile + " already Uploded";
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
                    result = true;
                }
                sdr1.Close();
            }
        }
        catch (Exception ex)
        {
            string text = ex.Message.ToString();
            ScriptManager.RegisterStartupScript(this, typeof(Page), "Warning", "<script>showpoperror('" + text + "')</script>", false);
        }
        return result;
    }
}