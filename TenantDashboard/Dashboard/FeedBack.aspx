<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="FeedBack.aspx.cs" Inherits="Dashboard_FeedBack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .NoSpace {
            white-space: nowrap;
        }

        .padding {
            padding: 1em;
        }
    </style>
     <script type="text/javascript">
        function successalert() {
            swal({
                title: 'Thanks For Your FeedBack!',
                text: 'Your feedback submited successfully!',
                type: 'success',
            });
        }
     </script>
    <style>
        .rbl input[type="radio"] {
            margin-left: 10px;
            margin-right: 10px;
            padding-top: 2px
        }

        .content table tr td:last-child {
            text-align: left;
        }

        .content table {
            /* margin: 15px; */
            max-width: 100%;
            text-align: center;
            margin-left: 0em;
            margin-right: 0em;
            padding: 1em;
        }

            .content table tr td {
                border-top: 1px solid #cccccc;
                text-align: left;
                padding-left: 2em;
                width: 100em;
            }
    </style>
    <!-- ===========Innerpage-wrapper============= -->
    <section>
        <div class="content">
            <div class="compose-messages">
                <div class="row no-gutters">

                    <div class="col">
                        <div class="heading-messages">
                            <h3>FEEDBACK</h3>
                        </div>
                        <!-- End heading-messages -->
                    </div>
                    <!-- End column -->
                    <%--  <div class="col-md-4">
                        <div class="breadcrumb">
                            <div class="breadcrumb-item">
                                <i class="fas fa-angle-right"></i><a href="StayelloCare.aspx">STAYELLO CARE</a>
                            </div>
                            <div class="breadcrumb-item active">
                                <i class="fas fa-angle-right"></i>STAYELLO CARE
                            </div>
                        </div>
                        <!-- end breadcrumb -->
                    </div>
                    <!-- end column -->--%>
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
                                <a class="nav-link" href="LateCheckIn.aspx">LATE CHECK-IN</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link " href="Food.aspx">FOOD</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="Food.aspx">FEEDBACK</a>
                            </li>
                        </ul>

                        <div class="hotel-listing-form bg-secondary padding">
                            <section class="text-center">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-row">
                                            <div class="col-md">
                                                <div class="form-group">
                                                    <h6 class="bg-warning">1.FOOD QUALITY </h6>
                                                    <asp:RadioButtonList ID="rdbfood" class="rbl" BackColor="White" runat="server" RepeatDirection="Vertical">
                                                        <asp:ListItem Text="Excellent" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="Very good" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Good" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Fair" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Poor" Value="1"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="reqrdbfood" ErrorMessage="Please select food quality"
    ControlToValidate="rdbfood" runat="server" ForeColor="White" ValidationGroup="feed"  Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md">
                                                <div class="form-group">
                                                    <h6 class="bg-warning">2.HOUSEKEEPING CLEANLINESS AND MAINTENANCE </h6>
                                                    <asp:RadioButtonList ID="rdbHOUSEKEEPING" class="rbl" TextAlign="Right" BackColor="White" runat="server" RepeatDirection="Vertical">
                                                        <asp:ListItem Text="Excellent" Value="5"></asp:ListItem>
                                                        <asp:ListItem Text="Very good" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Good" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Fair" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Poor" Value="1"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="reqrdbHOUSEKEEPING" ErrorMessage="Please select housekeeping cleanliness and maintenance"
    ControlToValidate="rdbHOUSEKEEPING" runat="server" ForeColor="White" ValidationGroup="feed"  Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="col-md">
                                                <div class="form-group">
                                                    <h6 class="bg-warning">3.HOSTEL ATMOSPHERE </h6>
                                                    <asp:RadioButtonList ID="rdbATMOSPHERE" class="rbl" TextAlign="Right" BackColor="White" runat="server" RepeatDirection="Vertical">
                                                        <asp:ListItem Text="Peaceful" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Quite" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Noisy" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Chaotic" Value="1"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="reqrdbATMOSPHERE" ErrorMessage="Please select hostel atmosphere"
    ControlToValidate="rdbATMOSPHERE" runat="server" ForeColor="White" ValidationGroup="feed"  Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md">
                                                <div class="form-group">
                                                    <h6 class="bg-warning">4.STAFF BEHAVIOUR </h6>
                                                    <asp:RadioButtonList ID="rdbSTAFFBEHAVIOUR" class="rbl" TextAlign="Right" BackColor="White" runat="server" RepeatDirection="Vertical">
                                                        <asp:ListItem Text="Polite" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Rude" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Unresponsive" Value="1"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                    <asp:RequiredFieldValidator ID="reqrdbSTAFFBEHAVIOUR" ErrorMessage="Please select staff behaviour"
    ControlToValidate="rdbSTAFFBEHAVIOUR" runat="server" ForeColor="White" ValidationGroup="feed"  Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md">
                                                <div class="form-group">
                                                    <h6 class="bg-warning">5.WIFI CONNECTIVITY </h6>
                                                    <asp:RadioButtonList ID="rdbWIFICONNECTIVITY" class="rbl" TextAlign="Right" BackColor="White" runat="server" RepeatDirection="Vertical">
                                                        <asp:ListItem Text="Good" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="Average" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Poor" Value="1"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                     <asp:RequiredFieldValidator ID="reqwificonnectivity" ErrorMessage="Please select wifi connectivity"
    ControlToValidate="rdbWIFICONNECTIVITY" runat="server" ForeColor="White" ValidationGroup="feed"  Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md">
                                                <div class="form-group">
                                                    <h6 class="bg-warning">6.WOULD YOU RECOMMEND STAYELLO PG/HOSTEL TO YOUR FRIENDS</h6>
                                                    <asp:RadioButtonList ID="rdbRECOMMEND" class="rbl" TextAlign="Right" BackColor="White" runat="server" RepeatDirection="Vertical">
                                                        <asp:ListItem Text="Yes" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="No" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="Maybe" Value="1"></asp:ListItem>
                                                    </asp:RadioButtonList>
                                                       <asp:RequiredFieldValidator ID="reqrdbrecommend" ErrorMessage="Please select would you recommend stayello_pg/hostel to your friends."
    ControlToValidate="rdbRECOMMEND" runat="server" ForeColor="White" ValidationGroup="feed"  Display="Dynamic" />
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end column -->
                                        <div class="form-row">
                                            <div class="col-md">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtWORDSOFAPPRECIATION" runat="server" class="form-control textarea text-left p-3 h-100" placeholder="YOUR WORDS OF APPRECIATION" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end form-group -->
                                        <!-- end column -->
                                        <div class="form-row">
                                            <div class="col-md">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPOINTSOFIMPROVEMENTS" runat="server" class="form-control textarea text-left p-3 h-100" placeholder="YOUR POINTS OF IMPROVEMENTS" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end form-group -->

                                        <ul class="list-inline">
                                            <li class="list-inline-item">
                                                <asp:Button ID="btnFeedBack" runat="server" ValidationGroup="feed" CausesValidation="true" Text="Submit Feedback" class="btn btn-success" OnClick="btnFeedBack_Click" />
                                            </li>
                                            <%--<li class="list-inline-item">
										<button type="submit" class="btn">Cancel</button>
									</li>--%>
                                        </ul>
                                    </div>
                                </div>
                            </section>
                        </div>
                        <!-- end hotel-listing-form -->
                    </div>
                    <!-- end compose-messages-border -->
                </div>
                <!-- end box -->
                <div class="box">
                    <div class="compose-messages-border">
                        <div class="hotel-listing-form">
                            <h5 class="text-dark text-center">Your Feedback record</h5>
                            <section class="text-center">
                                <div class="row">
                                    <div class="container-fluid table-responsive">
                                        <asp:GridView ID="gvFeedBack" runat="server" class="table table-striped table-no-bordered table-hover" CellSpacing="0" Width="100%" Style="width: 100%" AutoGenerateColumns="false">
                                            <Columns>
                                                    
                                                <asp:TemplateField HeaderText="Sr.No.">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblp_name" Text='<%#Eval("tfb_id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Food">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbltfb_rdbfoodText" Text='<%#Eval("tfb_rdbfoodText") %>' Style="white-space: nowrap"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ATMOSPHERE">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbltfb_rdbATMOSPHEREText" Text='<%#Eval("tfb_rdbATMOSPHEREText") %>' Style="white-space: nowrap"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="STAFF BEHAVIOUR">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbltfb_rdbSTAFFBEHAVIOURText" Text='<%#Eval("tfb_rdbSTAFFBEHAVIOURText") %>' Style="white-space: nowrap"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="WIFI CONNECTIVITY">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbltfb_rdbWIFICONNECTIVITYText" Text='<%#Eval("tfb_rdbWIFICONNECTIVITYText") %>' Style="white-space: nowrap"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="RECOMMEND">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbltfb_rdbRECOMMENDText" Text='<%#Eval("tfb_rdbRECOMMENDText") %>' Style="white-space: nowrap"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="POINTS OF IMPROVEMENTS">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbltfb_POINTSOFIMPROVEMENTS" Text='<%#Eval("tfb_POINTSOFIMPROVEMENTS") %>' Style="white-space: nowrap"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="WORDS OF APPRECIATION">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lbltfb_WORDSOFAPPRECIATION" Text='<%#Eval("tfb_WORDSOFAPPRECIATION") %>' Style="white-space: nowrap"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Mobile">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label5" Text='<%#Eval("tfb_crdate") %>' Style="white-space: nowrap"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end compose-messages -->
        </div>
        <!-- end content -->
    </section>
    <!-- ===========End Innerpage-wrapper============= -->
</asp:Content>

