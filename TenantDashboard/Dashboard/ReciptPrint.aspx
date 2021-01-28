<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard/TenantsMaster.master" AutoEventWireup="true" CodeFile="ReciptPrint.aspx.cs" Inherits="Dashboard_ReciptPrint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- Content Wrapper. Contains page content -->
    <script>
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }
    </script>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                            <div class="text-center pull-center">
                                <%--<button type="submit" class="btn btn-primary"><i class="icmn-checkmark margin-right-5"></i>Proceed to payment </button>--%>
                                <button type="button" class="btn btn-default" onclick="printDiv('PrintArea')"><i class="icmn-printer margin-right-5 fa fa-print"></i>&nbsp Print </button>
                            </div>
                        
                        <div class="card-content card-padding">

                            <div class="row" id="PrintArea">
                                <div class="col-md-12">
                                        <div class="card-header text-center">
                                            <h4>SATYELLO PAYMENT RECEIPT</h4>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <h5>PROPERTY DETAILS
                                                <br>
                                                    <img id="invoice-logo" src="Logo/LogoOfStayEllo.jpeg" style="width: 100px; image-resolution: initial" alt="Company Logo">
                                                </h5>
                                                <address>
                                                    PROPERTY :<asp:Label ID="lblPgName" runat="server"></asp:Label><br />
                                                    ADDRESS :<asp:Label ID="lblpgAddress" runat="server"></asp:Label><br />
                                                    WEBSITE:&nbsp;&nbsp;www.stayello.com<br>
                                                    PHONE:&nbsp;&nbsp;7081521234<br>
                                                </address>
                                            </div>
                                            <div class="col-md-6 text-left">
                                                <h5>TENANT DETAILS</h5>
                                                <p>
                                                    <a class="font-size-20">RECEIPT NO:<asp:Label ID="lblReciptNo" runat="server"></asp:Label></a>
                                                    <br>
                                                    <span class="font-size-20">TENANT NAME:<asp:Label ID="lblTenantsName" runat="server"></asp:Label></span>
                                                </p>
                                                <address>
                                                   PROPERTY:&nbsp;&nbsp;<asp:Label ID="lblpgNamee" runat="server"></asp:Label>
                                                    <br>
                                                    PHONE NO:&nbsp;&nbsp;<asp:Label ID="lblPhone" runat="server"></asp:Label>
                                                    <br>
                                                    ROOM NO:&nbsp;&nbsp;<asp:Label ID="lblRoomNo" runat="server"></asp:Label>
                                                    <br>
                                                </address>
                                                <span>DUE DATE:
                                                <asp:Label ID="lbldateTime" runat="server"></asp:Label></span>
                                                <br>
                                                <span>DUE MONTH:
                                                <asp:Label ID="lblDueMonth" runat="server"></asp:Label></span>
                                                <br>
                                            </div>
                                        </div>
                                        <div class="table-responsive" >
                                            <table class="table table-striped text-right" style="overflow-x:auto;">
                                                <thead>
                                                    <tr style="background-color: #000000; color: white">
                                                        <th class="text-center">S.NO.</th>
                                                        <th class="text-center">DUE TYPE</th>
                                                        <th class="text-center">PARTICULARS</th>
                                                        <th class="text-center">AMOUNT</th>
                                                        <th class="text-center"></th>
                                                        <th class="text-center"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="text-center">
                                                            <asp:Label ID="lblSrNo" runat="server"></asp:Label></td>
                                                        <td class="text-center">
                                                            <asp:Label ID="lblDueType" runat="server"></asp:Label></td>
                                                        <td class="text-center">StayEllo processing charges </td>
                                                        <td class="text-center">₹ 0</td>
                                                        <td class="text-center"></td>
                                                         <td class="text-center"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center"></td>
                                                        <td class="text-center"></td>
                                                        <td class="text-center">Payment processing charges </td>
                                                        <td class="text-center">₹ 0 </td>
                                                        <td class="text-center"></td>
                                                         <td class="text-center"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center"></td>
                                                        <td class="text-center"></td>
                                                        <td class="text-center">StayEllo credits applied </td>
                                                        <td class="text-center">₹ 0 </td>
                                                        <td class="text-center"></td>
                                                         <td class="text-center"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center"></td>
                                                        <td class="text-center"></td>
                                                        <td class="text-center">Owner discount applied </td>
                                                        <td class="text-center">₹ 0 </td>
                                                        <td class="text-center"></td>
                                                         <td class="text-center"></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-center"></td>
                                                        <td class="text-left"></td>
                                                        <td class="text-center">
                                                            <asp:Label ID="lblDueTypee" runat="server"></asp:Label></td>
                                                        <td class="text-center">₹
                                                        <asp:Label ID="lblDueTypeAmount" runat="server"></asp:Label></td>
                                                        <td class="text-center"></td>
                                                         <td class="text-center"></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="text-left clearfix">
                                            <div class="pull-right text-center">
                                                <p>Sub-Total amount: <strong><span>Rs:<asp:Label ID="lblDueSubAmount" runat="server"></asp:Label></span></strong> </p>
                                                <%--<p>VAT: <strong><span>$123.00</span></strong> </p>--%>
                                                <p class="page-invoice-amount"><strong>Grand Total: <span>Rs:<asp:Label ID="lblDueAmount" runat="server"></asp:Label></span></strong> </p>
                                             <hr>
                                            </div>
                                            <div class="pull-left">
                                                <h6>NOTE:</h6>
                                                <p class="small hint-text">
                                                    This is a Computer Generated Receipt and do not require any signature.
                                                    Discrepancy if noted , should be informed immediately.
                                                     </p>
                                                <h6>REFUND POLICY:</h6>
                                                <p>
                                                    Security deposit is only refundable if both the condition mentioned below is fulfilled
                                                    <br />
                                                    (a) Minimum LOCK-IN period of 6 months is served. (LOCK-IN period means minimum stay duration at STAYELLO PROPERTY)
                                                    <br />
                                                    (b) One month of notice period. (NOTICE period means informing the STAYELLO MANAGEMENT in written before 1 month of leaving the hostel.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                              
                            </div>
                           

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

