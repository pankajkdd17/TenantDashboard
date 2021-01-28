<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="Dues.aspx.cs" Inherits="Dashboard_Dues" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- ===========Innerpage-wrapper============= -->
		<section>
			<div class="content">
				<div class="compose-messages">
					<div class="row no-gutters">
						<div class="col">
							<div class="heading-messages">
								<h3>Dues</h3>
							</div><!-- End heading-messages -->
						</div><!-- End column -->
						<%--<div class="col-md-4">
							<div class="breadcrumb">
								<div class="breadcrumb-item"><i class="fas fa-angle-right"></i><a href="Dues.aspx">Dues</a>
								</div>
								<div class="breadcrumb-item active"><i class="fas fa-angle-right"></i>Dues
								</div>
							</div>
						</div>--%>

					</div><!-- end row -->

					<div class="box">
						<div class="compose-messages-border">
							<ul class="nav nav-pills justify-content-center">
								<li class="nav-item">
									<a class="nav-link" href="Transaction.aspx">TRANSACTION</a>
								</li>
								<li class="nav-item">
									<a class="nav-link active" href="Dues.aspx">DUES</a>
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

							<section>
								 <asp:ListView ID="ListView3" runat="server" DataKeyNames="d_id">
                                        <ItemTemplate>
                                            <div style="min-height: 180px;">
                                                <table style="text-align: left">

                                                    <tr style="white-space: nowrap">
                                                        <td>Room No:
                                                        </td>
                                                        <td>
                                                            <i class="fa fa-home" style="font-size: 17px"></i>
                                                            <asp:Label runat="server" ID="lblBeds" Text='<%#Eval("d_RoomNo") %>' ForeColor="#00adef" Font-Size="17px" Style="white-space: nowrap"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Mobile:</td>
                                                        <td>
                                                            <i class="fa fa-mobile" style="font-size: 17px"></i>
                                                            <asp:Label runat="server" ID="lblrent" Text='<%#Eval("d_t_Mobile") %>' ForeColor="#00adef" Font-Size="17px"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr style="white-space: nowrap;">
                                                        <td>Dues Type :
                                                        </td>
                                                        <td>
                                                            <i class="fa fa-list" style="font-size: 17px"></i>
                                                            <asp:Label runat="server" ID="lblr_SecurityDeposit" Text='<%#Eval("d_DuesTypeText") %>' ForeColor="#00adef" Font-Size="17px"></asp:Label>

                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Dues Amount:</td>
                                                        <td>
                                                            <i class="fa fa-rupee" style="font-size: 17px"></i>
                                                            <asp:Label runat="server" ID="Label1" Text='<%#Eval("d_DuesAmount") %>' ForeColor="#00adef" Font-Size="17px"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr style="white-space: nowrap;">
                                                        <td>Dues Date :
                                                        </td>
                                                        <td>
                                                            <i class="fa fa-calendar" style="font-size: 17px"></i>
                                                            <asp:Label runat="server" ID="Label2" Text='<%#Eval("d_DuesDate") %>' ForeColor="#00adef" Font-Size="17px"></asp:Label>

                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>Dues Month:</td>
                                                        <td>
                                                            <i class="fa fa-calendar" style="font-size: 17px"></i>
                                                            <asp:Label runat="server" ID="Label3" Text='<%#Eval("d_DuesMonth") %>' ForeColor="#00adef" Font-Size="17px"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr style="white-space: nowrap;">
                                                        <td>Remark :
                                                        </td>
                                                        <td>
                                                            <i class="fa fa-list" style="font-size: 17px"></i>
                                                            <asp:Label runat="server" ID="Label4" Text='<%#Eval("d_Remark") %>' ForeColor="#00adef" Font-Size="17px"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr style="white-space: nowrap;">
                                                        <td>Due Added Date :
                                                        </td>
                                                        <td>
                                                            <i class="fa fa-calendar" style="font-size: 17px"></i>
                                                            <asp:Label runat="server" ID="Label5" Text='<%#Eval("d_crdate") %>' ForeColor="#00adef" Font-Size="17px"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <%-- <tr style="white-space: nowrap;">
                                                                                        <td><asp:LinkButton ID="lbtnRecivedDue" class="btn btn-info" CommandArgument='<%#Eval("d_id")%>' CommandName="ReceivedDue" runat="server"><i class="fa fa-rupee" > Pay Now</i></asp:LinkButton> 
                                                                                            </td>
                                                                                            </tr>--%>
                                                </table>
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
							</section>
						</div><!-- end compose-messages-border -->
					</div><!-- end box -->
				</div><!-- end compose-messages -->
			</div><!-- end content -->
		</section>
		<!-- ===========End Innerpage-wrapper============= -->
</asp:Content>

