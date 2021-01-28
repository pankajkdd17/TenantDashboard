<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="UpiPayment.aspx.cs" Inherits="Dashboard_UpiPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- -- ===========Innerpage-wrapper============= -->
    <section>
        <div class="content">
            <div class="compose-messages">
                <div class="row no-gutters">

                    <div class="col">
                        <div class="heading-messages">
                            <h3>UPI PAYMENT</h3>
                        </div>
                        <!-- End heading-messages -->
                    </div>
                    <!-- End column -->
                    <div class="col-md-4">
                        <div class="breadcrumb">
                            <div class="breadcrumb-item">
                                <i class="fas fa-angle-right"></i><a href="UpiPayment.aspx">UPI PAYMENT</a>
                            </div>
                            <div class="breadcrumb-item active">
                                <i class="fas fa-angle-right"></i>UPI PAYMENT
                            </div>
                        </div>
                        <!-- end breadcrumb -->
                    </div>
                    <!-- end column -->

                </div>
                <!-- end row -->

                <div class="box">
                    <div class="compose-messages-border">
                        <ul class="nav nav-pills justify-content-center">
                            <li class="nav-item">
                                <a class="nav-link" href="Transaction.aspx">TRANSACTION</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Dues.aspx">DUES</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="UpiPayment.aspx">UPI-PAYMENT</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="StayelloCare.aspx">STAYELLO CARE</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Leave.aspx">LEAVE</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="LateCheckIn.aspx">LATE CHECK-IN</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link " href="Food.aspx">FOOD</a>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link " href="Food.aspx">FEEDBACK</a>
                            </li>
                        </ul>
                        <%--<ul class="list-unstyled header-btns">
								<li class="list-inline-item">
									<a href="#" class="btn btn-success">Send</a>
								</li>
								<li class="list-inline-item">
									<a href="#" class="btn">Discard</a>
								</li>
								<li class="list-inline-item">
									<a href="#" class="btn">Draft</a>
								</li>
							</ul>--%>
                        <div class="compose-messages-border bg-secondary">
                            <div class="hotel-listing-form">
                                <h5 class="text-white text-center">StayEllo Payment Details</h5>
                                <section class="text-center">
                                    <div class="form-row">
                                        <!-- End column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <a href="https://www.instamojo.com/@stayellopayment/" rel="im-checkout" data-text="PAY NOW" data-css-style="color:#ffffff; background:#75c26a; width:180px; border-radius:30px" data-layout="vertical"></a>
                                                <script src="https://js.instamojo.com/v1/button.js"></script>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- End column -->
                                        <!-- End column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to7" class="NoSpace text-danger">GooglePay:</label>
                                                <asp:TextBox ID="txtGooglePay" runat="server" class="form-control text-center" text="7081521234" ReadOnly="true" ></asp:TextBox>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- End column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to7" class="NoSpace text-danger">PhonePay:</label>
                                                 <asp:TextBox ID="txtPhonePay" runat="server" class="form-control text-center" text="7081521234" ReadOnly="true" ></asp:TextBox>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                    </div>

                                </section>
                            </div>
                        </div>
                    </div>
                    <!-- end compose-messages-border -->
                </div>
                <!-- end box -->
            </div>
            <!-- end compose-messages -->
        </div>
        <!-- end content -->
    </section>
    <!-- ===========End Innerpage-wrapper============= -->
</asp:Content>

