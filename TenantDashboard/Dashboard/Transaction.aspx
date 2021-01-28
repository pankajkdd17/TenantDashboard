<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="Transaction.aspx.cs" Inherits="Dashboard_Transaction" %>

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
								<h3>Transaction</h3>
							</div><!-- End heading-messages -->
						</div><!-- End column -->
						<%--<div class="col-md-4">
							<div class="breadcrumb">
								<div class="breadcrumb-item"><i class="fas fa-angle-right"></i><a href="Transaction.aspx">Transaction</a>
								</div>
								<div class="breadcrumb-item active"><i class="fas fa-angle-right"></i>Transaction
								</div>
							</div><!-- end breadcrumb -->
						</div><!-- end column -->--%>

					</div><!-- end row -->

					<div class="box">
						<div class="compose-messages-border">
							<ul class="nav nav-pills justify-content-center">
								<li class="nav-item">
									<a class="nav-link active" href="Transaction.aspx">TRANSACTION</a>
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
									<a class="nav-link " href="Food.aspx">FOOD</a>
								</li>
                                 <li class="nav-item">
                                <a class="nav-link " href="Food.aspx">FEEDBACK</a>
                            </li>
							</ul>
							
							<section>
								 <div class="row">
                                <asp:ListView ID="ListView3" runat="server" DataKeyNames="d_id" OnItemCommand="ListView3_ItemCommand">
                                    <ItemTemplate>
                                        <div class="col-md-4 col-sm-4">
                                            <table style="text-align: left;">
                                                <tr >
                                                    <td>RECIPT NO.:
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server" ID="lbld_id" Text='<%#Eval("d_id") %>' ForeColor="#000000" ></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>TENANT NAME :
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server" ID="lbld_PayeeText" Text='<%#Eval("d_PayeeText") %>' ForeColor="#000000" ></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>MOBILE:</td>
                                                    <td>
                                                        <asp:Label runat="server" ID="lbld_t_Mobile" Text='<%#Eval("d_t_Mobile") %>' ForeColor="#000000" ></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>DUES TYPE :
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server" ID="lbld_DuesTypeText" Text='<%#Eval("d_DuesTypeText") %>' ForeColor="#000000" ></asp:Label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>RECIVED AMOUNT:</td>
                                                    <td>
                                                        <i class="fa fa-rupee" style="font-size: 17px"></i>
                                                        <asp:Label runat="server" ID="lbld_recivedAmount" Text='<%#Eval("d_recivedAmount") %>' ForeColor="#000000" ></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>DUE MONTH :
                                                    </td>
                                                    <td>
                                                        <asp:Label runat="server" ID="lbld_DuesMonth" Text='<%#Eval("d_DuesMonth") %>' ForeColor="#000000" ></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>DUE RECEIVED DATE :
                                                    </td>
                                                    <td>

                                                        <asp:Label runat="server" ID="lbls_crdate" Text='<%#Eval("d_reciveddate") %>' ForeColor="#000000" ></asp:Label>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="lbtnedit" class="btn btn-dark" CommandArgument='<%#Eval("d_id")%>' CommandName="PrintRecipt" runat="server"><i class="fa fa-print" >View_Receipt</i></asp:LinkButton>
                                                    </td>
                                                    
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:ListView>
                            </div>
							</section>
						</div><!-- end compose-messages-border -->
					</div><!-- end box -->
				</div><!-- end compose-messages -->
			</div><!-- end content -->
		</section>
		<!-- ===========End Innerpage-wrapper============= -->
</asp:Content>

