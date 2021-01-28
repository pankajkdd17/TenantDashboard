<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="profile-edit-profile.aspx.cs" Inherits="Dashboard_profile_edit_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ===========Innerpage-wrapper============= -->
    <script type="text/javascript">
        function successalert() {
            swal({
                title: 'Congratulations!',
                text: 'Your profile updated successfully!',
                type: 'success'
            });
        }

        function successalertUpload() {
            swal({
                title: 'Congratulations!',
                text: 'Your profile photo uploaded successfully!',
                type: 'success'
            });
        }

        function successalertkyc() {
            swal({
                title: 'Congratulations!',
                text: 'Your kyc uploaded successfully!',
                type: 'success'
            });
        }
    </script>

    <style>
        .NoSpace {
            white-space: nowrap;
        }

        .padding {
            padding: 1em;
        }

        .photo {
            margin: auto;
            text-align: center;
            border: 2px dashed #b3b3b3;
            max-width: 184px;
            max-height: 150px;
        }

        .photoAdhaar {
            margin: auto;
            text-align: center;
            border: 2px dashed #b3b3b3;
            max-width: 220px;
            max-height: 200px;
        }

        @media (max-width: 576px) {
            .content.profile .hotel-listing-form .form-group label {
                /* align-content: center; */
                width: 82px;
                font-size: 11px;
                height: 30px;
                padding: 0px 0;
                text-align: center;
            }
        }
    </style>

    <section>
        <div class="content add-details profile ">
            <div class="in-content-wrapper">
                <div class="row no-gutters">

                    <div class="col">
                        <div class="heading-messages">
                            <h3>Profile</h3>
                        </div>
                        <!-- End heading-messages -->
                    </div>
                </div>
                <!-- end row -->

                <div class="box">
                    <div class="row">
                        <div class="col">
                            <div class="details-text">
                                <h4>Edit Profile Details</h4>
                            </div>
                            <!-- end details-text -->
                        </div>
                        <!-- end column -->
                    </div>
                    <!-- end row -->
                    <div class="hotel-listing-form badge-secondary">
                        <section class="text-center padding">
                            <div class="row">
                                <div class="col-sm-4">
                                </div>
                                <div class="col-sm-4">
                                    <div class="col">
                                        <div class="upload-photo-wrapper">
                                            <div class="upload-heading">
                                                <h5>Your Photo</h5>
                                            </div>
                                            <!-- end upload-heading -->
                                            <div>
                                                <asp:Image ID="Image1" runat="server" class="photo" />
                                            </div>
                                            <div>
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                    <ContentTemplate>
                                                        <asp:FileUpload ID="fuProfilePhoto" runat="server" class="form-control" />
                                                        <asp:LinkButton ID="lbtnUpload" Class="btn btn-primary" OnClick="lbtnUpload_Click" runat="server">Upload</asp:LinkButton>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="lbtnUpload" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </div>
                                            <!-- end dropzone -->
                                        </div>
                                        <!-- end upload-photo-wrapper -->

                                    </div>
                                    <!-- end column -->
                                </div>
                                <div class="col-sm-4">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-row">
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to" class="">Tenant Name :</label>
                                                <asp:TextBox ID="txtTenantName" MaxLength="300" class="form-control text-center" runat="server"></asp:TextBox>
                                                <%--  <asp:RequiredFieldValidator runat="server" ID="reqtxtTenantName" ControlToValidate="txtParentName" Display="Dynamic" ForeColor="White" ValidationGroup="editprofile" ErrorMessage="Please enter tenant Name!" />--%>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <!-- end column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to1" class="">Mobile :</label>
                                                <asp:TextBox ID="txtTenantMobile" TextMode="Number" onkeypress="if (this.value.length > 9) { return false; }" ReadOnly="true" class="form-control text-center" runat="server"></asp:TextBox>
                                                <%-- <asp:RequiredFieldValidator runat="server" ID="reqParentPhone" ControlToValidate="txtTenantMobile" Display="Dynamic" ForeColor="White" ValidationGroup="editprofile" ErrorMessage="Please enter mobile name!" />--%>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->

                                        <!-- end column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to1" class="">Gender :</label>
                                                <asp:DropDownList ID="ddlGender" class="form-control text-center" data-style="select-with-transition" runat="server">
                                                    <asp:ListItem Text="--Select-" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                                    <asp:ListItem Text="Transgender" Value="Transgender"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" InitialValue="0" ID="reqddlGender" ControlToValidate="ddlGender" Display="Dynamic" ForeColor="White" ValidationGroup="editprofile" ErrorMessage="Please select gender!" />
                                            </div>
                                            <!-- end form-group -->
                                        </div>

                                    </div>
                                    <!-- end form-row -->
                                    <div class="form-row">
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to" class="">Property :</label>
                                                <asp:TextBox ID="txtProperty" MaxLength="400" ReadOnly="true" class="form-control text-center" runat="server"></asp:TextBox>
                                                <%-- <asp:RequiredFieldValidator runat="server" ID="reqProperty" ControlToValidate="txtProperty" Display="Dynamic" ForeColor="White" ValidationGroup="editprofile" ErrorMessage="Please enter property Name!" />--%>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                    </div>
                                    <!-- end form-row -->
                                    <div class="form-row">
                                        <!-- end column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to1" class="">Room No :</label>
                                                <asp:TextBox ID="txtRoomNo" TextMode="Number" onkeypress="if (this.value.length > 5) { return false; }" ReadOnly="true" class="form-control text-center" runat="server"></asp:TextBox>
                                                <%-- <asp:RequiredFieldValidator runat="server" ID="reqtxtRoomNo" ControlToValidate="txtRoomNo" Display="Dynamic" ForeColor="White" ValidationGroup="editprofile" ErrorMessage="Please enter Room No!" />--%>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->

                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to2" class="">Email :</label>
                                                <asp:TextBox ID="txtEmail" MaxLength="400" class="form-control text-center" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqEmail" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="White" ValidationGroup="editprofile" ErrorMessage="Please enter Email!" />
                                                <asp:RegularExpressionValidator ID="reqtxtEmail" runat="server" ControlToValidate="txtEmail"
                                                    ForeColor="#00adef" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                                    Display="Dynamic" ValidationGroup="editprofile" ErrorMessage="Invalid email address" />
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to2" class="">Parent Name :</label>
                                                <asp:TextBox ID="txtParentName" MaxLength="400" class="form-control text-center" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqParentName" ControlToValidate="txtParentName" Display="Dynamic" ForeColor="White" ValidationGroup="editprofile" ErrorMessage="Please enter Parent Name!" />
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to3" class="">Parent Mobile :</label>
                                                <asp:TextBox ID="txtParentMobile" MaxLength="400" class="form-control text-center" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqParentMobile" ControlToValidate="txtParentMobile" Display="Dynamic" ForeColor="White" ValidationGroup="editprofile" ErrorMessage="Please enter Parent Mobile!" />
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtCommunicationaddress" runat="server" class="form-control textarea text-left p-3 h-100" placeholder="Your Communication Address" TextMode="MultiLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqCommunicationaddress" ControlToValidate="txtCommunicationaddress" Display="Dynamic" ForeColor="White" ValidationGroup="editprofile" ErrorMessage="Please enter communication address!" />
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                    </div>
                                    <!-- end form-row -->


                                    <!-- end form-row -->
                                    <!-- end form-group -->
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <asp:Button ID="btnUpdateProfile" class="btn btn-success" ValidationGroup="editprofile" CausesValidation="true" OnClick="btnUpdateProfile_Click" runat="server" Text="Update Profile" />
                                        </li>
                                        <%--<li class="list-inline-item">
                                            <button type="submit" class="btn">Cancel</button>
                                        </li>--%>
                                    </ul>
                                </div>
                                <!-- end column -->

                            </div>
                            <!-- end row -->
                        </section>
                    </div>
                </div>

                <!-- end box -->

                <!-- end row -->

                <div class="box">
                    <div class="row">
                        <div class="col">
                            <div class="details-text">
                                <h4>Submit Kyc Details</h4>
                            </div>
                            <!-- end details-text -->
                        </div>
                        <!-- end column -->
                    </div>
                    <!-- end row -->
                    <div class="hotel-listing-form badge-secondary padding">
                        <section class="text-center">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-row">

                                        <!-- end column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to1" class="">Select Identity Proof:</label>
                                                <asp:DropDownList ID="ddlidentityProof" runat="server" class="form-control text-center">
                                                    <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Aadhaar Card" Value="Aadhaar Card"></asp:ListItem>
                                                    <asp:ListItem Text="Voter Id" Value="Voter Id"></asp:ListItem>
                                                    <asp:ListItem Text="Passport" Value="Passport"></asp:ListItem>
                                                    <asp:ListItem Text="Rasan Card" Value="Rasan Card"></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator runat="server" InitialValue="0" ID="reqddlidentityProof" ControlToValidate="ddlidentityProof" Display="Dynamic" ForeColor="White" ValidationGroup="kyc" ErrorMessage="Please select KYC!" />
                                            </div>
                                            <!-- end form-group -->
                                        </div>

                                        <!-- end column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to1" class="">Name On Identity Proof:</label>
                                                <asp:TextBox ID="txtNameOnIdentity" runat="server" class="form-control text-center" MaxLength="100"></asp:TextBox>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                    </div>
                                    <div class="form-row">
                                        <!-- end column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to1" class="">Identity Proof Id No:</label>
                                                <asp:TextBox ID="txtIdentityNo" runat="server" class="form-control text-center" MaxLength="20"></asp:TextBox>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="col">
                                        <div class="upload-photo-wrapper">
                                            <div class="upload-heading">
                                                <h5>Your Front Adhaar Photo</h5>
                                            </div>
                                            <!-- end upload-heading -->
                                            <div class="photoAdhaar">

                                                <asp:Image ID="Image2" runat="server" class="photoAdhaar" />

                                            </div>
                                            <div>
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                    <ContentTemplate>
                                                        <asp:FileUpload ID="FileFront" runat="server" class="fileinput-new btn btn-round btn-file" />
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnUpdateKyc" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </div>
                                            <!-- end dropzone -->
                                        </div>
                                        <!-- end upload-photo-wrapper -->

                                    </div>
                                    <!-- end column -->
                                </div>
                                <div class="col-sm-6">
                                    <div class="col">
                                        <div class="upload-photo-wrapper">
                                            <div class="upload-heading">
                                                <h5>Your Back Adhaar Photo</h5>
                                            </div>
                                            <!-- end upload-heading -->
                                            <div class="photoAdhaar">

                                                <asp:Image ID="Image3" runat="server" class="photoAdhaar" />

                                            </div>
                                            <div>
                                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                                    <ContentTemplate>
                                                        <asp:FileUpload ID="FileBack" runat="server" class="fileinput-new btn btn-round btn-file" />
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btnUpdateKyc" />
                                                    </Triggers>
                                                </asp:UpdatePanel>

                                            </div>
                                            <!-- end dropzone -->
                                        </div>
                                        <!-- end upload-photo-wrapper -->

                                    </div>
                                    <!-- end column -->
                                </div>
                            </div>
                            <h5>Make sure all information provided by you is correct it will not editable further</h5>
                            <div class="row">
                                <div class="col-sm-12">

                                    <!-- end form-group -->
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <asp:Button ID="btnUpdateKyc" class="btn btn-success" ValidationGroup="kyc" CausesValidation="true" OnClick="btnUpdateKyc_Click" runat="server" Text="Submit Kyc" />
                                        </li>
                                        <%-- <li class="list-inline-item">
                                            <button type="submit" class="btn">Cancel</button>
                                        </li>--%>
                                    </ul>
                                </div>
                                <!-- end column -->

                            </div>
                            <!-- end row -->

                        </section>
                    </div>
                </div>
                <!-- end box -->
            </div>
            <!-- end in-content-wrapper -->
        </div>
        <!-- end profile -->
    </section>
    <!-- ===========End Innerpage-wrapper============= -->

</asp:Content>

