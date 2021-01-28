<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="LateCheckIn.aspx.cs" Inherits="Dashboard_LateCheckIn" %>

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
            width: 118px;
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
        $(function () {
            var today = new Date();
            var month = ('0' + (today.getMonth() + 1)).slice(-2);
            var day = ('0' + today.getDate()).slice(-2);
            var year = today.getFullYear();
            var date = year + '-' + month + '-' + day;
            $('[id*=txtLatecheckinDate]').attr('min', date);
        });
    </script>
    <script type="text/javascript">
        function successalert() {
            swal({
                title: 'Congratulations!',
                text: 'Your Late Check-In applied successfully',
                type: 'success'
            });
        }
    </script>
    <section>
        <div class="content">
            <div class="compose-messages">
                <div class="row no-gutters">

                    <div class="col">
                        <div class="heading-messages">
                            <h3>LATE CHECK-IN</h3>
                        </div>
                        <!-- End heading-messages -->
                    </div>
                    <!-- End column -->
                    <%--<div class="col-md-4">
							<div class="breadcrumb">
								<div class="breadcrumb-item"><i class="fas fa-angle-right"></i><a href="LateCheckIn.aspx">LATE CHECK-IN</a>
								</div>
								<div class="breadcrumb-item active"><i class="fas fa-angle-right"></i>LATE CHECK-IN
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
                                <a class="nav-link" href="Leave.aspx">LEAVE</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="LateCheckIn.aspx">LATE CHECK-IN</a>
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

                        <div class="hotel-listing-form  bg-secondary padding">
                            <h5 class="text-white text-center">Apply for late check-in( If you come after 10pm at property)</h5>
                            <section class="text-center">
                                <div class="form-row">
                                    <!-- End column -->
                                    <div class="col-md">
                                        <div class="form-group">
                                            <label for="to7" class="NoSpace">Late check-in date:</label>
                                            <asp:TextBox ID="txtLatecheckinDate" TextMode="Date" class="form-control text-center" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="reqtxtLatecheckinDate" ControlToValidate="txtLatecheckinDate" Display="Dynamic" ForeColor="White" ValidationGroup="late" ErrorMessage="Please choose Late check-in date!" />
                                        </div>
                                        <!-- end form-group -->
                                    </div>
                                    <!-- End column -->
                                    <!-- End column -->
                                    <div class="col-md">
                                        <div class="form-group">
                                            <label for="to7" class="NoSpace">Late check-in Time:</label>
                                            <asp:TextBox ID="txtLatecheckinTime" TextMode="Time" class="form-control text-center" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="reqtxtLatecheckinTime" ControlToValidate="txtLatecheckinTime" Display="Dynamic" ForeColor="White" ValidationGroup="late" ErrorMessage="Please choose Late check-in Time!" />
                                        </div>
                                        <!-- end form-group -->
                                    </div>
                                    <!-- End column -->
                                </div>
                                <div class="form-row">
                                    <div class="col-md">
                                        <div class="form-group">
                                            <label for="to6" class="NoSpace">Parent Name:</label>
                                            <asp:TextBox ID="txtParentName" class="form-control text-center" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="reqtxtParentName" ControlToValidate="txtParentName" Display="Dynamic" ForeColor="White" ValidationGroup="late" ErrorMessage="Please enter father name!" />
                                        </div>
                                    </div>
                                    <!-- end form-group -->
                                    <div class="col-md">
                                        <div class="form-group">
                                            <label for="to6" class="NoSpace">Parent Phone:</label>
                                            <asp:TextBox ID="txtParentPhone" TextMode="Number" onkeypress="if (this.value.length > 9) { return false; }" class="form-control text-center" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ID="reqtxtParentPhone" ControlToValidate="txtParentPhone" Display="Dynamic" ForeColor="White" ValidationGroup="late" ErrorMessage="Please enter father mobile no.!" />
                                        </div>
                                        <!-- end form-group -->
                                    </div>
                                </div>
                                <!-- end column -->
                                <div class="form-group">
                                    <asp:TextBox ID="txtmsg" runat="server" class="form-control textarea text-left p-3 h-100" placeholder="Your late check-in reason" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="reqtxtmsg" ControlToValidate="txtParentPhone" Display="Dynamic" ForeColor="White" ValidationGroup="late" ErrorMessage="Please enter late check-in reason!" />
                                </div>
                                <!-- end form-group -->
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <asp:Button ID="btnLateCheckin" runat="server" class="btn btn-success" OnClick="btnLateCheckin_Click" ValidationGroup="late" CausesValidation="true" Text="Apply Late check-in" />
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
                            <h5 class="text-dark text-center">Your Late check-In record</h5>
                            <section class="text-center">
                                <div class="row no-gutters">
                                    <div class="col">
                                        <asp:GridView ID="gvLateCheckin" runat="server" class="display table-hover table-responsive-xl listing" AutoGenerateColumns="false" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                            <Columns>
                                                <asp:TemplateField HeaderText="SR.NO">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltlc_id" runat="server" Text='<%#Eval("tlc_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Late Check-in Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltlc_LateCheckinDate" runat="server" Text='<%#Eval("tlc_LateCheckinDate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Late Check-In Time">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltlc_LeaveEndDate" runat="server" Text='<%#Eval("tlc_LateCheckinTime")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Father Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltlc_FatherName" runat="server" Text='<%#Eval("tlc_FatherName")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Father Phone">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltlc_FatherMobile" runat="server" Text='<%#Eval("tlc_FatherMobile")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reason">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltlc_msg" runat="server" Text='<%#Eval("tlc_msg")%>'></asp:Label>
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
            </div>
            <!-- end box -->
        </div>
        <!-- end compose-messages -->
       
    </section>
    <!-- ===========End Innerpage-wrapper============= -->

</asp:Content>

