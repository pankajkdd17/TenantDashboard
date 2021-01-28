<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="Leave.aspx.cs" Inherits="Dashboard_Leave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ===========Innerpage-wrapper============= -->
    <style>
        .NoSpace {
            white-space: nowrap;
        }

        .padding {
            padding: 1em;
        }
        .hotel-listing-form section .form-group > label {
            position: absolute;
            color: #0f0f0f;
            font-weight: 600;
            font-size:0.8rem;
            left: 0px;
            background-color: #cccccc;
            width: 110px;
            padding: 7px 0px;
            height: 38px;
            margin: auto 0;
            text-align: left;
            white-space:nowrap;
        }
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
    <script type="text/javascript">
        function successalert() {
            swal({
                title: 'Congratulations!',
                text: 'Your Leave applied successfully!',
                type: 'success'
            });
        }
    </script>
    <script type="text/javascript">
        $(function () {
            var today = new Date();
            var month = ('0' + (today.getMonth() + 1)).slice(-2);
            var day = ('0' + today.getDate()).slice(-2);
            var year = today.getFullYear();
            var date = year + '-' + month + '-' + day;
            $('[id*=txtLeaveStartDate]').attr('min', date);
        });
    </script>

     <script type="text/javascript">
         $(function () {
             var today = new Date();
             var month = ('0' + (today.getMonth() + 1)).slice(-2);
             var day = ('0' + today.getDate()).slice(-2);
             var year = today.getFullYear();
             var date = year + '-' + month + '-' + day;
             $('[id*=txtLeaveEndDate]').attr('min', date);
         });
     </script>

    <section>
        <div class="content">
            <div class="compose-messages">
                <div class="row no-gutters">

                    <div class="col">
                        <div class="heading-messages">
                            <h3>LEAVE</h3>
                        </div>
                        <!-- End heading-messages -->
                    </div>
                    <!-- End column -->
                    <%--<div class="col-md-4">
							<div class="breadcrumb">
								<div class="breadcrumb-item"><i class="fas fa-angle-right"></i><a href="Leave.aspx">LEAVE</a>
								</div>
								<div class="breadcrumb-item active"><i class="fas fa-angle-right"></i>LEAVE
								</div>
							</div><!-- end breadcrumb -->
						</div><!-- end column -->--%>
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
                                <a class="nav-link" href="UpiPayment.aspx">UPI-PAYMENT</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="StayelloCare.aspx">STAYELLO CARE</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="Leave.aspx">LEAVE</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="LateCheckIn.aspx">LATE CHECK-IN</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="Food.aspx">FOOD</a>
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


                        <div class="hotel-listing-form  bg-secondary padding">
                            <h5 class="text-white text-center">Your leave request will be informed to your parents by  SMS</h5>
                            <section class="text-center">
                                <div class="form-row">
                                    <!-- End column -->
                                    <div class="col-md">
                                        <div class="form-group">
                                            <label for="to7" class="NoSpace">Leave Start Date:</label>
                                            <asp:TextBox ID="txtLeaveStartDate" TextMode="Date" class="form-control text-center" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="reqLeaveStartDate" ControlToValidate="txtLeaveStartDate" Display="Dynamic" ForeColor="White" ValidationGroup="leave" ErrorMessage="Please choose Leave Start Date!" />
                                        </div>
                                        <!-- end form-group -->
                                    </div>
                                    <!-- End column -->
                                    <!-- End column -->
                                    <div class="col-md">
                                        <div class="form-group">
                                            <label for="to7" class="NoSpace">Leave End Date:</label>
                                            <asp:TextBox ID="txtLeaveEndDate" TextMode="Date" class="form-control text-center" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="reqLeaveEndDate" ControlToValidate="txtLeaveEndDate" Display="Dynamic" ForeColor="White" ValidationGroup="leave" ErrorMessage="Please choose Leave End Date!" />
                                        </div>
                                        <!-- end form-group -->
                                    </div>
                                    <!-- End column -->
                                </div>
                                <div class="form-row">
                                    <div class="col-md">
                                        <div class="form-group">
                                            <label for="to6" class="NoSpace">Parent Name:</label>
                                            <asp:TextBox ID="txtParentName" MaxLength="300" class="form-control text-center" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="reqParentName" ControlToValidate="txtParentName" Display="Dynamic" ForeColor="White" ValidationGroup="leave" ErrorMessage="Please enter father name!" />
                                        </div>
                                    </div>
                                    <!-- end form-group -->
                                    <div class="col-md">
                                        <div class="form-group">
                                            <label for="to6" class="NoSpace">Parent Phone:</label>
                                            <asp:TextBox ID="txtParentPhone" TextMode="Number" onkeypress="if (this.value.length > 9) { return false; }" class="form-control text-center" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="reqParentPhone" ControlToValidate="txtParentPhone" Display="Dynamic" ForeColor="White" ValidationGroup="leave" ErrorMessage="Please enter mobile no!" />
                                        </div>
                                        <!-- end form-group -->
                                    </div>
                                </div>
                                <!-- end column -->
                                <div class="form-group">
                                    <asp:TextBox ID="txtmsg" runat="server" class="form-control textarea text-left p-3 h-100" placeholder="Your leave reason" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="reqmsg" ControlToValidate="txtmsg" Display="Dynamic" ForeColor="White" ValidationGroup="leave" ErrorMessage="Please enter reason for leave!" />
                                </div>
                                <!-- end form-group -->
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <asp:Button ID="btnApplyLeave" runat="server" class="btn btn-success" OnClick="btnApplyLeave_Click" ValidationGroup="leave" CausesValidation="true" Text="Apply Leave" />
                                    </li>
                                    <%-- <li class="list-inline-item">
                                        <button type="submit" class="btn">Cancel</button>
                                    </li>--%>
                                </ul>
                            </section>
                        </div>
                        <!-- end hotel-listing-form -->
                    </div>
                </div>
                <div class="box">
                    <div class="compose-messages-border">
                        <div class="hotel-listing-form">
                            <h5 class="text-dark text-center">Your applyed leave record</h5>
                            <section class="text-center">
                                <div class="row no-gutters">
                                    <div class="col">
                                        <asp:GridView ID="gvLeave" runat="server" class="display table-hover table-responsive-xl listing" AutoGenerateColumns="false" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                            <Columns>
                                                <asp:TemplateField HeaderText="SR.NO">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltl_id" runat="server" Text='<%#Eval("tl_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave Start Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltl_LeaveStartDate" runat="server" Text='<%#Eval("tl_LeaveStartDate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Leave End Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltl_LeaveEndDate" runat="server" Text='<%#Eval("tl_LeaveEndDate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Father Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltl_FatherName" runat="server" Text='<%#Eval("tl_FatherName")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Father Phone">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltl_FatherMobile" runat="server" Text='<%#Eval("tl_FatherMobile")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reason">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltl_msg" runat="server" Text='<%#Eval("tl_msg")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC"></FooterStyle>

                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                            <PagerStyle HorizontalAlign="Left" BackColor="#CCCCCC" ForeColor="Black"></PagerStyle>

                                            <RowStyle BackColor="White"></RowStyle>

                                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                                            <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                                            <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

                                            <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                                            <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
                                        </asp:GridView>
                                       
                                    </div>
                                    <!-- end column -->
                                </div>
                                <!-- end row -->
                            </section>
                        </div>
                    </div>
                </div>
                <!-- end compose-messages-border -->
                <!-- end box -->
            </div>
            <!-- end compose-messages -->
        </div>
        <!-- end content -->
    </section>
    <!-- ===========End Innerpage-wrapper============= -->

</asp:Content>

