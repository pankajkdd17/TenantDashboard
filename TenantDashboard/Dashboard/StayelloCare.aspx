<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="StayelloCare.aspx.cs" Inherits="Dashboard_StayelloCare" %>

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

        .hotel-listing-form section .input-group-text {
            color: #0f0f0f;
            font-weight: 600;
            position: relative;
            background-color: #cccccc;
            width: 160px;
            padding: 7px 0px;
            border-radius: unset;
            border: unset;
            text-align: left;
            margin: 0 auto;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            position: relative;
        }
    </style>
    <!-- ===========Innerpage-wrapper============= -->
    <section>
        <div class="content">
            <div class="compose-messages">
                <div class="row no-gutters">

                    <div class="col">
                        <div class="heading-messages">
                            <h3>STAYELLO CARE</h3>
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
                                <a class="nav-link active" href="StayelloCare.aspx">STAYELLO CARE</a>
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

                        <div class="hotel-listing-form bg-secondary padding">
                            <section class="text-center">
                                <div class="form-row">
                                    <div class="col-md">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <label class="input-group-text" for="inputGroupSelect00">Category :</label>
                                                </div>
                                                <asp:DropDownList ID="ddlTicketOfIssue" runat="server" class="custom-select" OnSelectedIndexChanged="ddlTicketOfIssue_SelectedIndexChanged" AutoPostBack="true" data-style="select-with-transition">
                                                </asp:DropDownList>
                                                <i class="fas fa-angle-down"></i>
                                            </div>
                                        </div>
                                        <!-- end form-group -->
                                    </div>
                                    <!-- end column -->
                                </div>
                                <!-- end form-row -->
                                <div class="form-row">
                                    <div class="col-md">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <label class="input-group-text" for="inputGroupSelect00">Sub-Category :</label>
                                                </div>
                                                <asp:DropDownList ID="ddlFacingissue" runat="server" class="custom-select" OnSelectedIndexChanged="ddlFacingissue_SelectedIndexChanged" AutoPostBack="true" data-style="select-with-transition">
                                                </asp:DropDownList>
                                                <i class="fas fa-angle-down"></i>
                                            </div>
                                        </div>
                                        <!-- end form-group -->
                                    </div>
                                    <!-- end column -->
                                </div>
                                <!-- end form-row -->
                                <div class="form-row">
                                    <div class="col-md">
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <label class="input-group-text" for="inputGroupSelect00">Issue-Sub-Category :</label>
                                                </div>
                                                <asp:DropDownList ID="ddlFacingissueSubcategory" runat="server" class="custom-select" data-style="select-with-transition">
                                                </asp:DropDownList>
                                                <i class="fas fa-angle-down"></i>
                                            </div>
                                        </div>
                                        <!-- end form-group -->
                                    </div>
                                    <!-- end column -->
                                </div>
                                <!-- end form-row -->

                                <div class="form-group">
                                    <asp:TextBox ID="txtmsg" runat="server" class="form-control textarea text-left p-3 h-100" placeholder="Your message" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <!-- end form-group -->
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <asp:Button ID="btnCreateTicket" runat="server" Text="Create Ticket" class="btn btn-success" OnClick="btnCreateTicket_Click" />
                                    </li>
                                    <%--<li class="list-inline-item">
										<button type="submit" class="btn">Cancel</button>
									</li>--%>
                                </ul>

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
                            <h5 class="text-dark text-center">Your complaints record</h5>
                            <section class="text-center">
                                <div class="row">
                                    <div class="container-fluid table-responsive">
                                        <asp:GridView ID="gvComplaint" runat="server" class="table table-striped table-no-bordered table-hover" CellSpacing="0" Width="100%" Style="width: 100%" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Token No">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblp_name" Text='<%#Eval("tc_id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label3" Text='<%#Eval("tc_Name") %>' Style="white-space: nowrap"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Room No">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label4" Text='<%#Eval("tc_RoomNo") %>' Style="white-space: nowrap"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Mobile">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label5" Text='<%#Eval("tc_Mobile") %>' Style="white-space: nowrap"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Complaint Detail">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="lblrent" Text='<%#Eval("tc_MainIssueText") %>'></asp:Label>->
                                                                                                 <asp:Label runat="server" ID="lblr_SecurityDeposit" Text='<%#Eval("tc_issueText") %>'></asp:Label>->
                                                                                                <asp:Label runat="server" ID="Label1" Text='<%#Eval("tc_subCatIssueText") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Description">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label2" Text='<%#Eval("tc_message") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Status">
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" ID="Label6" Text='<%#Eval("tc_status") %>'></asp:Label>
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

