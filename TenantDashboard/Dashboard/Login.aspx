<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Dashboard_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tenant Login</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="images/faviconLogo.png" type="image/x-icon">
    <!-- Framework Stylesheets Start-->
    <!-- Data Tables Stylesheet -->




    <link rel="stylesheet" type="text/css" href="vendors/dropzone-5.5.0/dist/min/dropzone.min.css">

    <!-- Bootstrap Stylesheet -->
    <link href="css/bootstrap-reboot4.2.1.css" rel="stylesheet" />
    <link href="css/bootstrap.min4.2.1.css" rel="stylesheet" />

    <!-- Framework Stylesheets End-->
    <!-- Data Tables Stylesheet -->
    <link href="css/custom.datatables.css" rel="stylesheet" />
    <link href="vendors/datatables/datatables.min.css" rel="stylesheet" />

    <!-- Font Awsome Stylesheet -->
    <link href="vendors/fontawesome5.7.2/css/all.min.css" rel="stylesheet" />

    <!-- Custom Stylesheet Start-->
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/responsive.css" rel="stylesheet" />

    <!-- Custom Stylesheet End-->
    <script src="toastrAlert/jquery.min.js"></script>
    <link href="toastrAlert/toastr.css" rel="stylesheet" />
    <script src="toastrAlert/toastr.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />





</head>
<body class="bodyColor">

    <script type="text/javascript">

        function countdown() {
            seconds = document.getElementById("timerLabel").innerHTML;
            if (seconds > 0) {
                document.getElementById("timerLabel").innerHTML = seconds - 1;
                setTimeout("countdown()", 1000);
            }
        }

        setTimeout("countdown()", 1000);

    </script>
    <style>
        .contentNew {
            margin-left: 14em;
            margin-right: 13em;
        }
        
        .boxColor{
            background-image: linear-gradient(#ffde00 ,white );
        }
        .bodyColor
        {
             background-image: linear-gradient(#ffde00 ,white );
        }
        @media (max-width: 991.9px) {
            .content {
                margin-left: 2em;
                margin-right: 2em;
            }
        }
    </style>


    <script type="text/javascript">  
        $(document).ready(function () {
            $('#txtOtp').hover(function show() {
                //Change the attribute to text  
                $('#txtOtp').attr('type', 'text');
                $('.icon').removeClass('fa fa-eye-slash').addClass('fa fa-eye');
            },
                function () {
                    //Change the attribute back to password  
                    $('#txtOtp').attr('type', 'password');
                    $('.icon').removeClass('fa fa-eye').addClass('fa fa-eye-slash');
                });
            //CheckBox Show Password  
            $('#ShowPassword').click(function () {
                $('#Password').attr('type', $(this).is(':checked') ? 'text' : 'password');
            });
        });
    </script>
    <form id="form1" runat="server">
        <div>
            <form class="form-inline my-2 my-lg-0 d-none d-xl-flex">
                <%--<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" />--%>
                <%--<i class="fas fa-search"></i>--%>
            </form>
            <!-- ===========Innerpage-wrapper============= -->
            <section>
                <div class="content contentNew add-details change-password">
                    <div class="in-content-wrapper">
                        <!-- End row -->
                        <div class="box boxColor">
                            <div class="row">
                                <div class="col">
                                    <div class="details-text text-center">
                                        <h4>WELLCOME AT STAYELLO</h4>
                                    </div>
                                    <!-- End details-text -->
                                </div>
                                <!-- End column -->
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="details-text text-center">
                                        <h6>TENANT LOGIN</h6>
                                    </div>
                                    <!-- End details-text -->
                                </div>
                                <!-- End column -->
                            </div>
                            <!-- End row -->
                            <div class="hotel-listing-form">
                                <section class="text-center">
                                    <div class="row">
                                        <div class="col-md-2">
                                        </div>
                                        <div class="col-md-8">
                                            <!-- End form-row -->
                                            <div class="form-row">
                                                <div class="col-md">
                                                    <div class="form-group">
                                                        <label for="to1" class="">Mobile No:</label>
                                                        <asp:TextBox ID="txtMobile" runat="server" TextMode="Number" onkeypress="if (this.value.length > 9) { return false; }"  placeholder="Enter Mobile no" class="form-control"></asp:TextBox><asp:LinkButton ID="lbtnSendeOtp" class="btn btn-info" OnClientClick="countdown()" OnClick="lbtnSendeOtp_Click" runat="server">Send OTP</asp:LinkButton>
                                                        <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtMobile" Display="Dynamic" ForeColor="#ff3300" ValidationGroup="login" ErrorMessage="Please enter your mobile!" />
                                                        <asp:RegularExpressionValidator ID="reqMobile" runat="server" ControlToValidate="txtMobile" ValidationExpression="^[0-9]{10}$" ValidationGroup="login" Display="Dynamic" ForeColor="#ff6600" ErrorMessage="Please enter your valid mobile!"></asp:RegularExpressionValidator>
                                                        <asp:Label ID="lblmessage" runat="server"></asp:Label>
                                                    </div>
                                                    <!-- end form-group -->
                                                </div>
                                                <!-- end column -->
                                            </div>
                                            <!-- end form-row -->
                                            <div class="form-row">
                                                <div class="col-md">
                                                    <div class="form-group">
                                                        <label for="to1" class="">OTP:</label>
                                                         <asp:TextBox ID="txtOtp" runat="server" TextMode="Number" onkeypress="if (this.value.length > 5) { return false; }"  placeholder="Enter OTP" class="form-control"></asp:TextBox>
                                                        <asp:RequiredFieldValidator runat="server" ID="reqOtp" ControlToValidate="txtOtp" Display="Dynamic" ValidationGroup="login" ForeColor="#ff3300" ErrorMessage="Please Enter otp!" />
                                                        <span id="timerLabel" runat="server"></span>

                                                      <asp:Label ID="lblError" runat="server"></asp:Label>  
                                                    </div>
                                                    <!-- end form-group -->
                                                </div>
                                                <!-- End column -->
                                            </div>
                                            <!-- End form-row -->
                                            <div class="form-row">
                                                <div class="col-md">
                                                    <!-- end form-group -->
                                                    <asp:CheckBox ID="chkRememberMe" class="form-control" runat="server" Text="Remember me" />
                                                    <!-- end form-group -->
                                                </div>
                                                <!-- End column -->
                                            </div>
                                            <!-- End form-row -->


                                            <ul class="list-inline">
                                                <li class="list-inline-item">
                                                    <asp:Button ID="btnLogin" class="btn btn-success" OnClick="btnLogin_Click" runat="server" ValidationGroup="login" CausesValidation="true" Text="Verify & Login" />
                                                </li>
                                                <%-- <li class="list-inline-item">
                                                    <asp:Button ID="btnOtpLogin" class="btn btn-success" OnClick="btnOtpLogin_Click" runat="server" Text="Login with OTP" />
                                                </li>--%>
                                            </ul>
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                        <!-- End column -->
                                    </div>
                                    <!-- End row -->
                                </section>
                            </div>
                            <!-- End hotel-listing-form -->
                        </div>
                        <!-- End Box -->
                    </div>
                    <!-- End in-content-wrapper -->
                </div>
                <!-- End change-password -->
            </section>
            <!-- ===========End Innerpage-wrapper============= -->
        </div>

        <!-- ===========End wrapper============= -->


        <!-- Optional JavaScript, Not optional it's need too -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="vendors/datatables/datatables.min.js"></script>
        <script src="vendors/dropzone-5.5.0/dist/min/dropzone.min.js"></script>

        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min4.2.1.js"></script>
        <script src="js/customscriptfile.js"></script>
        <script src="js/progressbar.min.js"></script>
        <script src="vendors/chart.js-2.8.0/dist/Chart.min.js"></script>
        <script src="vendors/datatables/datatables.min.js"></script>

        <!-- Page Scripts Ends -->
        <script src="vendors/ckeditor5-build-classic/ckeditor.js"></script>
    </form>
</body>
</html>
