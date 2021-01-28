<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="ExitProperty.aspx.cs" Inherits="Dashboard_ExitProperty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- ===========Innerpage-wrapper============= -->
    <script type="text/javascript">
        function ValidateCheckBox(sender, args) {
            if (document.getElementById("<%=chbcorrectInfo.ClientID %>").checked == true) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }
    </script>
    <style>
        .NoSpace {
            white-space: nowrap;
        }

        .padding {
            padding: 1em;
        }

        .p-3 {
            padding: 0.5rem !important;
            margin-bottom: -2.3em;
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
            $('[id*=txtCheckoutDate]').attr('min', date);
        });
    </script>
    <script type="text/javascript">
        function successalert() {
            swal({
                title: 'Congratulations!',
                text: 'Your exit property applied successfully',
                type: 'success'
            });
        }
    </script>

    <section>
        <div class="content add-details profile">
            <div class="in-content-wrapper">
                <div class="row no-gutters">

                    <div class="col">
                        <div class="heading-messages">
                            <h3>Profile</h3>
                        </div>
                        <!-- End heading-messages -->
                    </div>
                    <!-- End column -->
                    <%-- <div class="col-md-4">
                        <div class="breadcrumb">
                            <div class="breadcrumb-item">
                                <i class="fas fa-angle-right"></i><a href="#">Profile</a>
                            </div>
                            <div class="breadcrumb-item active">
                                <i class="fas fa-angle-right"></i>Edit Profile
                            </div>
                        </div>
                        <!-- end breadcrumb -->
                    </div>--%>
                    <!-- End column -->

                </div>
                <!-- end row -->

                <div class="box">

                    <div class="row">
                        <div class="col">
                            <div class="details-text">
                                <h4>Apply For Exit Property</h4>
                            </div>
                            <!-- end details-text -->
                        </div>
                        <!-- end column -->
                    </div>
                    <!-- end row -->
                    <div class="hotel-listing-form bg-secondary padding">
                        <section class="text-center">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-row">
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to" class="">Checkout Date:</label>
                                                <asp:TextBox ID="txtCheckoutDate" TextMode="Date" class="form-control text-center" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqtxtCheckoutDate" ControlToValidate="txtCheckoutDate" Display="Dynamic" ForeColor="White" ValidationGroup="exit" ErrorMessage="Please choose Checkout Date!" />
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtmsg" runat="server" class="form-control textarea text-left p-3 h-100" placeholder="Your Checkout reason" TextMode="MultiLine"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqmsg" ControlToValidate="txtmsg" Display="Dynamic" ForeColor="White" ValidationGroup="exit" ErrorMessage="Please enter reason for exit property!" />
                                            </div>
                                        </div>
                                    </div>
                                    <h5>Please provide bank account details for processing refund</h5>
                                    <!-- end form-row -->
                                    <div class="form-row">
                                        <div class="col-md">
                                            <div class="col-md">
                                                <div class="form-group">
                                                    <label for="to1" class="text-wrap">Bank Name:</label>
                                                    <asp:DropDownList ID="ddlBankName" runat="server" class="form-control text-right">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator runat="server" InitialValue="0" ID="reqddlBankName" ControlToValidate="ddlBankName" Display="Dynamic" ForeColor="White" ValidationGroup="exit" ErrorMessage="Choose Bank Name!" />
                                                </div>
                                                <!-- end form-group -->
                                            </div>
                                        </div>
                                        <!-- end column -->
                                        <!-- end column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to1" class="" style="white-space: nowrap">Branch Name(Optional):</label>
                                                <asp:TextBox ID="txtBranchName" class="form-control text-center" runat="server"></asp:TextBox>
                                                <%-- <asp:RequiredFieldValidator runat="server" ID="reqtxtBranchName" ControlToValidate="txtBranchName" Display="Dynamic" ForeColor="White" ValidationGroup="exit" ErrorMessage="Please enter Branch Name!" />--%>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                    </div>
                                    <!-- end form-row -->
                                    <div class="form-row">
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to2" class="">Account number:</label>
                                                <asp:TextBox ID="txtAccountnumber" TextMode="Number" onkeypress="if (this.value.length > 20) { return false; }" class="form-control text-center" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqtxtAccountnumber" ControlToValidate="txtAccountnumber" Display="Dynamic" ForeColor="White" ValidationGroup="exit" ErrorMessage="Please enter Account number!" />
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to3" class="">Confirm Account No:</label>
                                                <asp:TextBox ID="txtConfirmAccountNo" TextMode="Number" onkeypress="if (this.value.length > 20) { return false; }" class="form-control text-center" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="txtreqConfirmAccountNo" ControlToValidate="txtConfirmAccountNo" Display="Dynamic" ForeColor="White" ValidationGroup="exit" ErrorMessage="Please enter Confirm Account number!" />
                                                <asp:CompareValidator ID="reqConfirmAccountNo" runat="server" ControlToCompare="txtConfirmAccountNo" ControlToValidate="txtAccountnumber" Display="Dynamic" ErrorMessage="Enter Confirm Account No" ForeColor="white"></asp:CompareValidator>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                    </div>
                                    <!-- end form-row -->
                                    <div class="form-row">
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to2" class="">IFSC code:</label>
                                                <asp:TextBox ID="txtIFSCcode" onkeypress="if (this.value.length > 15) { return false; }" class="form-control text-center" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqtxtIFSCcode" ControlToValidate="txtIFSCcode" Display="Dynamic" ForeColor="White" ValidationGroup="exit" ErrorMessage="Please enter IFSC code!" />
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to3" class="">Account holder name:</label>
                                                <asp:TextBox ID="txtAccountholdername" class="form-control text-center" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator runat="server" ID="reqAccountholdername" ControlToValidate="txtAccountholdername" Display="Dynamic" ForeColor="White" ValidationGroup="exit" ErrorMessage="Please enter Account holder name!" />
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                    </div>
                                    <!-- end form-row -->
                                    <div class="form-row">
                                        <div class="col-md">
                                            <div class="form-group">
                                                <label for="to2" class="">Mobile No (Optional):</label>
                                                <asp:TextBox ID="txtMobileNo" TextMode="Number" onkeypress="if (this.value.length > 9) { return false; }" class="form-control text-center" runat="server"></asp:TextBox>
                                            </div>
                                            <!-- end form-group -->
                                        </div>
                                        <!-- end column -->
                                    </div>
                                    <!-- end form-row -->
                                    <div class="form-row">
                                        <div class="col-md">
                                            <asp:CheckBox ID="chbcorrectInfo" runat="server" Text="All information provided by me in the above is correct as per my knowledge" class="form-control textarea text-center p-3 h-100" />
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Acknowledgement must be accepted" ClientValidationFunction="ValidateCheckBox" ValidationGroup="exit" ForeColor="#ffde00"></asp:CustomValidator>
                                        </div>
                                    </div>

                                    <!-- end form-group -->
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <asp:Button ID="btnApplyforExit" class="btn-success" runat="server" OnClick="btnApplyforExit_Click" CausesValidation="true" ValidationGroup="exit" Text="Apply for Exit" />
                                        </li>
                                        <%--<li class="list-inline-item">
                                            <button type="submit" class="btn">Cancel</button>
                                        </li>--%>
                                    </ul>
                                </div>
                                <!-- end column -->

                            </div>
                            <!-- end row -->

                        </section>
                    </div>
                </div>

                <div class="box">
                    <div class="compose-messages-border">
                        <div class="hotel-listing-form">
                            <h5 class="text-dark text-center">Your Exit record</h5>
                            <section class="text-center">
                                <div class="row no-gutters">
                                    <div class="col">
                                        <asp:GridView ID="gvExitProperty" runat="server" class="display table-hover table-responsive-xl listing" AutoGenerateColumns="false" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                            <Columns>

                                                <asp:TemplateField HeaderText="SR.NO">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbltlc_id" runat="server" Text='<%#Eval("tep_id")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Property Check-Out Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblttep_CheckoutDate" runat="server" Text='<%#Eval("tep_CheckoutDate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Reason for Check-Out">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblttep_msg" runat="server" Text='<%#Eval("tep_msg")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Applied Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblttep_crdate" runat="server" Text='<%#Eval("tep_crdate")%>'></asp:Label>
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
            <!-- end in-content-wrapper -->
        </div>
        <!-- end profile -->
    </section>
    <!-- ===========End Innerpage-wrapper============= -->
</asp:Content>

