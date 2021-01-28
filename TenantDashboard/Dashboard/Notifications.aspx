<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="Dashboard_Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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

        . /*padding*/ {
            padding: 1em;
        }
    </style>
    <!-- ===========Innerpage-wrapper============= -->
    <section>
        <div class="content listing-content users-list">
            <div class="in-content-wrapper">
                <div class="row no-gutters">

                    <div class="col">
                        <div class="heading-messages">
                            <h3>Notifications</h3>
                        </div>
                        <!-- End heading-messages -->
                    </div>
                    <!-- End column -->

                </div>
                <!-- end row -->

                <div class="box">
                    <%--<div class="row no-gutters">
							<div class="col text-left">
								<div class="add-new">
									<a href="users-create-user.html">Add New<i class="fas fa-plus"></i></a>
								</div><!-- End add-new-->
							</div><!-- End column-->
							<div class="col text-right">
								<div class="tools-btns">
									<a href="#"><i class="fas fa-print" data-toggle="tooltip" data-html="true"
											title="Print"></i></a>
									<a href="#"><i class="fas fa-file-pdf" data-toggle="tooltip" data-html="true"
											title="Pdf"></i></a>
									<a href="#"><i class="fas fa-file-excel" data-toggle="tooltip" data-html="true"
											title="Excel"></i></a>
								</div><!-- End tool-btns-->
							</div><!-- End text-right-->

						</div>--%><!-- end row -->
                    <div class="row no-gutters padding bg-warning">
                        <div class="col">
                            <table id="example" class="display table-hover table-responsive-xl listing">
                                <thead>
                                    <tr class="bg-dark text-white">
                                        <th>S.No</th>
                                        <th>Details</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptNotification" runat="server">
                                        <ItemTemplate>

                                            <tr class="text-dark">
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("a_id") %>'></asp:Label>
                                                </td>
                                                <td>

                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("a_Details") %>'></asp:Label>
                                                </td>
                                                <td>

                                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("a_crdate") %>'></asp:Label>
                                                </td>
                                            </tr>

                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                        <!-- end column -->
                    </div>
                    <!-- end row -->
                </div>
                <!-- end box -->
            </div>
            <!-- end in-content-wrapper -->
        </div>
        <!-- end users-list -->
    </section>
    <!-- ===========End Innerpage-wrapper============= -->
</asp:Content>

