<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.Master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Dashboard_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ===========Innerpage-wrapper============= -->
    <style>
        .content table {
            margin: 8px;
            width: 95%;
            text-align: center;
        }

            .content table tr td:last-child {
                text-align: center;
            }
            .content table tr td {
                border-top: 1px solid #cccccc;
                text-align: left;
                width: 100em;
            }
    </style>
    <section>
        <div class="content profile view-profile">

            <div class="row no-gutters">

                <div class="col">
                    <div class="heading-messages">
                        <h3>Dashboard</h3>
                    </div>
                </div>
                <%-- <div class="col-md-4">
                    <div class="breadcrumb">
                        <div class="breadcrumb-item">
                            <i class="fas fa-angle-right"></i><a href="#">Profile</a>
                        </div>
                        <div class="breadcrumb-item active">
                            <i class="fas fa-angle-right"></i>View Profile
                        </div>
                    </div>
                    <!-- end breadcrumb -->
                </div>--%>
                <!-- End column -->

            </div>
            <!-- end row -->
            <div class="box">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="details-text">
                            <h4>Your Details </h4>
                        </div>
                        <!-- end details-text -->
                    </div>
                    <!-- end -->

                </div>
                <!-- end row -->
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <table class="display table-hover table-responsive-xl listing  bg-warning">

                            <tr>
                                <td>NAME
                                </td>
                            </tr>
                            <tr class="bg-secondary">
                                <td>
                                    <asp:Label ID="lblName" runat="server" ForeColor="White"></asp:Label>
                                </td>
                            </tr>
                            <tr>

                                <td>MOBILE
                                </td>
                            </tr>
                            <tr class="bg-secondary">

                                <td>
                                    <asp:Label ID="lblMobile" runat="server" ForeColor="White"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>PROPERTY NAME</td>
                            </tr>
                            <tr class="bg-secondary">
                                <td>
                                    <asp:Label ID="lblProperty" runat="server" ForeColor="White"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>ROOM NO</td>
                            </tr>
                            <tr class="bg-secondary">
                                <td>
                                    <asp:Label ID="RoomNo" runat="server" ForeColor="White"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>SECURITY DEPOSIT</td>
                            </tr>
                            <tr class="bg-secondary">
                                <td>
                                    <asp:Label ID="lblSecurityDeposit" runat="server" ForeColor="White"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>ROOM RENT AMOUNT
                                </td>
                            </tr>
                            <tr class="bg-secondary">
                                <td>
                                    <asp:Label ID="lblRoomRentAmount" runat="server" ForeColor="White"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>ROOM ALLOTED TYPE
                                </td>
                            </tr>
                            <tr class="bg-secondary">
                                <td>
                                    <asp:Label ID="lblBedAllotedType" runat="server" ForeColor="White"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>KYC STATUS
                                </td>
                            </tr>
                            <tr class="bg-secondary">
                                <td>
                                    <asp:Label ID="lblKYCStatus" runat="server" ForeColor="White"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Due Type</td>
                            </tr>
                            <tr class="bg-secondary">
                                <td>
                                    <asp:Label ID="lblDueType" runat="server" ForeColor="White"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>Due Amount:</td>
                            </tr>
                            <tr class="bg-secondary">
                                <td>
                                    <asp:Label ID="lblDueAmount" runat="server" ForeColor="White"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>DATE OF JOINING:
                                </td>
                            </tr>
                            <tr class="bg-secondary">
                                <td>
                                    <asp:Label ID="lblDateOfJoining" runat="server" ForeColor="White"></asp:Label>
                                </td>

                            </tr>

                        </table>
                    </div>
                </div>

            </div>
            <!-- end box -->
        </div>
        <!-- end view-profile -->
    </section>
    <!-- ===========End Innerpage-wrapper============= -->
</asp:Content>

