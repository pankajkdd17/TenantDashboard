<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="Food.aspx.cs" Inherits="Dashboard_Food" %>

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
        <div class="content">
            <div class="compose-messages">
                <div class="row no-gutters">

                    <div class="col">
                        <div class="heading-messages">
                            <h3>Food</h3>
                        </div>
                        <!-- End heading-messages -->
                    </div>
                    <!-- End column -->
                    <%--<div class="col-md-12">
							<div class="breadcrumb">
								<div class="breadcrumb-item"><i class="fas fa-angle-right"></i><a href="food.aspx">Food</a>
								</div>
								<div class="breadcrumb-item active"><i class="fas fa-angle-right"></i>Food
								</div>
							</div><!-- end breadcrumb -->
						</div>--%><!-- end column -->

                </div>
                <!-- end row -->

                <div>
                    <div class="compose-messages-border">
                        <ul class="nav nav-pills justify-content-center">
                            <li class="nav-item">
                                <a class="nav-link" href="Transaction.aspx">TRANSACTION</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Dues.aspx">DUES</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="UpiPayment.aspx">UPI-PAYMENT</a>
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
                                <a class="nav-link active" href="Food.aspx">FOOD</a>
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

                        <div class="compose-messages-border">
                            <div class="hotel-listing-form">
                                <h5 class="text-dark text-center">Your food menu</h5>
                                <section>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="chart-edge  bg-warning">
                                                <div class="demo-placeholder">
                                                    <asp:Repeater ID="repeater1" runat="server">
                                                        <HeaderTemplate>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td class="text-capitalize  text-center">
                                                                        <asp:Label runat="server" CssClass="text-danger" ID="lblf_WeekdaysText" Text='<%#Eval("f_WeekdaysText") %>'></asp:Label>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>BREAK FAST :
                                                                <asp:Label runat="server" ID="lblf_Breakfast" CssClass="text-white" Text='<%#Eval("f_Breakfast") %>'></asp:Label></td>

                                                                    <td class="text-left">
                                                                        <asp:Label runat="server" ID="lblf_BreakfastTime" Text='<%#Eval("f_BreakfastTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label3" Text='<%#Eval("f_BreakfastTimeto") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>LUNCH  :  
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Lunch" Text='<%#Eval("f_Lunch") %>'></asp:Label></td>
                                                                    <td class="text-left">
                                                                        <asp:Label runat="server" ID="lblf_LunchTime" Text='<%#Eval("f_LunchTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label2" Text='<%#Eval("f_LunchTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>REFRESHMENT :      
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Snacks" Text='<%#Eval("f_Snacks") %>'></asp:Label></td>
                                                                    <td class="text-left">
                                                                        <asp:Label runat="server" ID="lblf_SnacksTime" Text='<%#Eval("f_SnacksTime") %>'></asp:Label>
                                                                        To 
                                                                    <asp:Label runat="server" ID="Label4" Text='<%#Eval("f_SnacksTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>DINNER  : 
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Dinner" Text='<%#Eval("f_Dinner") %>'></asp:Label></td>
                                                                    <td class="text-left">
                                                                        <asp:Label runat="server" ID="lblf_DinnarTime" Text='<%#Eval("f_DinnarTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label5" Text='<%#Eval("f_DinnarTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="chart-edge  bg-warning ">
                                                <div class="demo-placeholder">
                                                    <asp:Repeater ID="repeater2" runat="server">
                                                        <HeaderTemplate>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td class="text-capitalize  text-center">
                                                                        <b>
                                                                            <asp:Label runat="server" CssClass="text-danger text-capitalize  text-center" ID="lblf_WeekdaysText" Text='<%#Eval("f_WeekdaysText") %>'></asp:Label></b></td>
                                                                    <td></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>BREAK FAST :
                                                                        <asp:Label runat="server" CssClass="text-white" ID="lblf_Breakfast" Text='<%#Eval("f_Breakfast") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_BreakfastTime" Text='<%#Eval("f_BreakfastTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label3" Text='<%#Eval("f_BreakfastTimeto") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Lunch : 
                                                                        <asp:Label runat="server" CssClass="text-white" ID="lblf_Lunch" Text='<%#Eval("f_Lunch")  %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_LunchTime" Text='<%#Eval("f_LunchTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label2" Text='<%#Eval("f_LunchTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>REFRESHMENT :      
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Snacks" Text='<%#Eval("f_Snacks") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_SnacksTime" Text='<%#Eval("f_SnacksTime") %>'></asp:Label>
                                                                        To 
                                                                    <asp:Label runat="server" ID="Label4" Text='<%#Eval("f_SnacksTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>DINNER  : 
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Dinner" Text='<%#Eval("f_Dinner") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_DinnarTime" Text='<%#Eval("f_DinnarTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label5" Text='<%#Eval("f_DinnarTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                   
                                                               
                                                            
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="chart-edge bg-warning">
                                                <div class="demo-placeholder">
                                                    <asp:Repeater ID="repeater3" runat="server">
                                                        <HeaderTemplate>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td class="text-capitalize  text-center">
                                                                        <b>
                                                                            <asp:Label runat="server" CssClass="text-danger text-capitalize  text-center" ID="lblf_WeekdaysText" Text='<%#Eval("f_WeekdaysText") %>'></asp:Label></b></td>
                                                                    <td></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>BREAK FAST :
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Breakfast" Text='<%#Eval("f_Breakfast") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_BreakfastTime" Text='<%#Eval("f_BreakfastTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label3" Text='<%#Eval("f_BreakfastTimeto") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>LUNCH  :  
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Lunch" Text='<%#Eval("f_Lunch") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_LunchTime" Text='<%#Eval("f_LunchTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label2" Text='<%#Eval("f_LunchTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>REFRESHMENT :      
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Snacks" Text='<%#Eval("f_Snacks") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_SnacksTime" Text='<%#Eval("f_SnacksTime") %>'></asp:Label>
                                                                        To 
                                                                    <asp:Label runat="server" ID="Label4" Text='<%#Eval("f_SnacksTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>DINNER  : 
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Dinner" Text='<%#Eval("f_Dinner") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_DinnarTime" Text='<%#Eval("f_DinnarTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label5" Text='<%#Eval("f_DinnarTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="chart-edge bg-warning">
                                                <div class="demo-placeholder">
                                                    <asp:Repeater ID="repeater4" runat="server">
                                                        <HeaderTemplate>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td class="text-capitalize  text-center">
                                                                        <b>
                                                                            <asp:Label runat="server" CssClass="text-danger text-capitalize  text-center" ID="lblf_WeekdaysText" Text='<%#Eval("f_WeekdaysText") %>'></asp:Label></b></td>
                                                                    <td></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>BREAK FAST :
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Breakfast" Text='<%#Eval("f_Breakfast") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_BreakfastTime" Text='<%#Eval("f_BreakfastTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label3" Text='<%#Eval("f_BreakfastTimeto") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>LUNCH :  
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Lunch" Text='<%#Eval("f_Lunch") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_LunchTime" Text='<%#Eval("f_LunchTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label2" Text='<%#Eval("f_LunchTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>REFRESHMENT :      
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Snacks" Text='<%#Eval("f_Snacks") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_SnacksTime" Text='<%#Eval("f_SnacksTime") %>'></asp:Label>
                                                                        To 
                                                                    <asp:Label runat="server" ID="Label4" Text='<%#Eval("f_SnacksTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>DINNER  : 
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Dinner" Text='<%#Eval("f_Dinner") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_DinnarTime" Text='<%#Eval("f_DinnarTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label5" Text='<%#Eval("f_DinnarTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                            
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="chart-edge bg-warning">
                                                <div class="demo-placeholder">
                                                    <asp:Repeater ID="repeater5" runat="server">
                                                        <HeaderTemplate>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td class="text-capitalize  text-center">
                                                                        <b>
                                                                            <asp:Label runat="server" CssClass="text-danger text-capitalize  text-center" ID="lblf_WeekdaysText" Text='<%#Eval("f_WeekdaysText") %>'></asp:Label></b></td>
                                                                    <td></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>BREAK FAST :
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Breakfast" Text='<%#Eval("f_Breakfast") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_BreakfastTime" Text='<%#Eval("f_BreakfastTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label3" Text='<%#Eval("f_BreakfastTimeto") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>LUNCH  :  
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Lunch" Text='<%#Eval("f_Lunch") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_LunchTime" Text='<%#Eval("f_LunchTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label2" Text='<%#Eval("f_LunchTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>REFRESHMENT :      
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Snacks" Text='<%#Eval("f_Snacks") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_SnacksTime" Text='<%#Eval("f_SnacksTime") %>'></asp:Label>
                                                                        To 
                                                                    <asp:Label runat="server" ID="Label4" Text='<%#Eval("f_SnacksTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>DINNER  : 
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Dinner" Text='<%#Eval("f_Dinner") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_DinnarTime" Text='<%#Eval("f_DinnarTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label5" Text='<%#Eval("f_DinnarTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="chart-edge bg-warning">
                                                <div class="demo-placeholder">
                                                    <asp:Repeater ID="repeater6" runat="server">
                                                        <HeaderTemplate>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table>
                                                                <tr>
                                                                    <td class="text-capitalize  text-center">
                                                                        <b>
                                                                            <asp:Label runat="server" CssClass="text-danger text-capitalize  text-center" ID="lblf_WeekdaysText" Text='<%#Eval("f_WeekdaysText") %>'></asp:Label></b></td>
                                                                    <td></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>BREAK FAST :
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Breakfast" Text='<%#Eval("f_Breakfast") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_BreakfastTime" Text='<%#Eval("f_BreakfastTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label3" Text='<%#Eval("f_BreakfastTimeto") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>LUNCH  :  
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Lunch" Text='<%#Eval("f_Lunch") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_LunchTime" Text='<%#Eval("f_LunchTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label2" Text='<%#Eval("f_LunchTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>REFRESHMENT :      
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Snacks" Text='<%#Eval("f_Snacks") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_SnacksTime" Text='<%#Eval("f_SnacksTime") %>'></asp:Label>
                                                                        To 
                                                                    <asp:Label runat="server" ID="Label4" Text='<%#Eval("f_SnacksTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>DINNER : 
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Dinner" Text='<%#Eval("f_Dinner") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_DinnarTime" Text='<%#Eval("f_DinnarTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label5" Text='<%#Eval("f_DinnarTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                   
                                                               
                                                            
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="chart-edge bg-warning">
                                                <div class="demo-placeholder">
                                                    <asp:Repeater ID="repeater0" runat="server">
                                                        <HeaderTemplate>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <table>
                                                                <tr class="text-capitalize  text-center">
                                                                    <td class="text-capitalize text-center">

                                                                        <asp:Label runat="server" CssClass="text-danger" ID="lblf_WeekdaysText" Text='<%#Eval("f_WeekdaysText") %>'></asp:Label></td>
                                                                    <td></td>
                                                                </tr>

                                                                <tr>
                                                                    <td>BREAK FAST :
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Breakfast" Text='<%#Eval("f_Breakfast") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_BreakfastTime" Text='<%#Eval("f_BreakfastTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label3" Text='<%#Eval("f_BreakfastTimeto") %>'></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>LUNCH  :  
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Lunch" Text='<%#Eval("f_Lunch") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_LunchTime" Text='<%#Eval("f_LunchTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label2" Text='<%#Eval("f_LunchTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>REFRESHMENT :      
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Snacks" Text='<%#Eval("f_Snacks") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_SnacksTime" Text='<%#Eval("f_SnacksTime") %>'></asp:Label>
                                                                        To 
                                                                    <asp:Label runat="server" ID="Label4" Text='<%#Eval("f_SnacksTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>DINNER : 
                                                                <asp:Label runat="server" CssClass="text-white" ID="lblf_Dinner" Text='<%#Eval("f_Dinner") %>'></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label runat="server" ID="lblf_DinnarTime" Text='<%#Eval("f_DinnarTime") %>'></asp:Label>
                                                                        To
                                                                    <asp:Label runat="server" ID="Label5" Text='<%#Eval("f_DinnarTimeTo") %>'></asp:Label></td>
                                                                </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                   
                                                               
                                                            
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>

                        <!-- end compose-messages-border -->
                        <!-- end box -->

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

