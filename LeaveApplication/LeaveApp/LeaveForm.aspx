<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveForm.aspx.cs" Inherits="LeaveApp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leave Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script src="js/bootstrap.min.js"></script>

    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" href="http://localhost:8739/code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />

    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

    <script>
        $(document).ready(function () {
            var $fromdate = $('#TxtFromdate');
            var $todate = $('#TxtToDate');
            $fromdate.datepicker({
                dateFormat: "dd-mm-yy",
                changeYear: true,
                yearRange: "2000:2016",
                //minDate: 0,
                onClose: function (selectedDate) {
                    $($todate).datepicker("option", "minDate", selectedDate);

                    var from = $fromdate.datepicker('getDate');
                    var to = $todate.datepicker('getDate');
                    //$todate.minDate = from;
                    if (to !== null) {
                        var diff = new Date(to - from);
                        var days = diff / 1000 / 60 / 60 / 24;
                        if (days > 0) {
                            //alert(days);
                            //$('#TextBox3') = days;
                            $("#lblNumberOfDays").text(days);
                        }
                        if (days < 0) {
                            alert('Select a valid ToDate');
                            //$('#TxtToDate').val(from);
                            $('#lblNumberOfDays').text(null);
                            $todate.datepicker();
                        }
                        if (days > 100) {
                            alert('Please select valid From/To Date');
                            $('#TxtFromdate').val(null);
                            $('#TxtToDate').val(null);
                            $('#lblNumberOfDays').text(null);
                        }
                    }
                    else {
                        //alert('Please select To Date');
                        $todate.val(null);
                    }
                    //$(this).parent().next().children().focus();
                }

            });
            $todate.datepicker({
                dateFormat: "dd-mm-yy",
                changeYear: true,
                yearRange: "2000:2016",
                // minDate: "from",
                onClose: function () {
                    var from = $fromdate.datepicker('getDate');
                    var to = $todate.datepicker('getDate');
                    //$todate.minDate = from;
                    if (from !== null) {
                        var diff = new Date(to - from);
                        var days = (diff / 1000 / 60 / 60 / 24) + 1;
                        if (days > 0) {
                            //alert(days);
                            //$('#TextBox3') = days;
                            $("#lblNumberOfDays").text(days);
                        }
                        if (days < 0) {
                            alert('Select a valid ToDate');
                            //$('#TxtToDate').val(from);
                            $('#lblNumberOfDays').text(null);
                            $todate.datepicker();
                        }
                    }
                    else {
                        alert('Please select From Date');
                        $todate.val(null);

                    }

                }
            });
        });
    </script>
    <script>
        function fetchText() {
            debugger;
            var $result = $('#lblNumberOfDays')
            document.getElementById("hdnResultValue").value = ($result.text());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container list-group ">
            <div class="list-group-item list-group-item-success" style="border: none" id="common_section">
                <div class="row list-group-item list-group-item-success">
                    <div class="col-md-6">
                        <div class="logo">
                            <img class="img-responsive" src="image/REDLIME_LOGO.png" alt="Logo" width="200" height="57" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h1 class="text-right"></h1>
                    </div>
                </div>








                <div class="row list-group-item list-group-item-danger" style="color: #943032;">

                    <div class="row request-form-title1 text-center list-group-item list-group-item-danger">
                        <h4>Leave Request Form</h4>
                    </div>


                    <div class="form-group col-md-4 input-group-sm " style="color: #943032;">

                        <label for="Employee ID">Employee ID</label>
                  
                  
                        <asp:TextBox ID="TxtId" CssClass="form-control" type="text" placeholder="Id" AutoPostBack="true" runat="server" OnTextChanged="TxtId_TextChanged"></asp:TextBox>
                    </div>
                   
                    <div class="form-group col-md-4 input-group-sm">
                        <label for="Employee Name">Employee Name</label>
                        <asp:TextBox ID="TxtName" CssClass="form-control" type="text" placeholder="Name" ReadOnly="true" runat="server"></asp:TextBox>

                    </div>

                    <div class="form-group col-md-4 input-group-sm">
                        <label for="Email ID">Email ID</label>
                        <asp:TextBox ID="TxtEmail" CssClass="form-control" type="email" placeholder="Email Id" ReadOnly="true" runat="server"></asp:TextBox>

                    </div>

                    <div class="form-group col-md-4 input-group-sm">
                        <label for="Department">Department</label>
                        <asp:TextBox ID="TxtDepartment" CssClass="form-control" type="text" placeholder="Department" ReadOnly="true" runat="server"></asp:TextBox>

                    </div>

                    <div class="form-group col-md-4 input-group-sm">
                        <label for="Mobile Number">Mobile Number</label>
                        <asp:TextBox ID="TxtMobile" CssClass="form-control" type="tel" placeholder="Mobile Number" ReadOnly="true" runat="server"></asp:TextBox>

                    </div>

                    <div class="form-group col-md-4 input-group-sm">
                        <label for="Superviser">Superviser</label>
                        <asp:TextBox ID="TxtSuperviser" CssClass="form-control" type="text" placeholder="Superviser" ReadOnly="true" runat="server"></asp:TextBox>

                    </div>

                </div>




                <div class="row list-group-item list-group-item-danger" style="color: #943032;">
                    <div class="col-md-12">
                        <label>Type of Absence Request: &nbsp;</label>
                    </div>
                    <div class="checkboxes">

                        <div class="col-md-3">

                            <label class="checkbox-inline">

                                <asp:RadioButton ID="RadioBtnVacation" Text="Vacation" CssClass="radio" GroupName="absenceType" runat="server" />

                            </label>
                        </div>

                        <div class="col-md-3">
                            <label class="checkbox-inline">                               
                                <asp:RadioButton ID="RadioBtnnsick" Text="Sick" CssClass="radio" GroupName="absenceType" runat="server" />

                            </label>
                        </div>
                        <%--</div>--%>

                        <div class="col-md-3">

                            <label class="checkbox-inline">

                                <asp:RadioButton ID="RadioBtnLeavewithPay" Text="Leave with Pay" CssClass="radio" GroupName="absenceType" runat="server" />

                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="checkbox-inline">
                                <asp:RadioButton ID="RadioBtnLeavewithoutPay" Text="Leave without Pay" CssClass="radio" GroupName="absenceType" runat="server" />

                            </label>
                        </div>


                        <div class="col-md-3">

                            <label class="checkbox-inline">

                                <asp:RadioButton ID="RadioBtnEmergency" Text="Emergency" CssClass="radio" GroupName="absenceType" runat="server" />

                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="checkbox-inline">
                                <asp:RadioButton ID="RadioBtnMarriage" Text="Marriage" CssClass="radio" GroupName="absenceType" runat="server" />

                            </label>
                        </div>


                        <div class="col-md-3">

                            <label class="checkbox-inline">

                                <asp:RadioButton ID="RadioBtnMaternity_Paternity" Text="Maternity/Paternity" CssClass="radio" GroupName="absenceType" runat="server" />

                            </label>
                        </div>
                        <div class="col-md-3">
                            <label class="checkbox-inline">
                                <asp:RadioButton ID="RadioBtnOther" Text="Other" CssClass="radio" GroupName="absenceType" runat="server" />

                            </label>
                        </div>



                    </div>

                </div>



                <div class="row list-group-item list-group-item-danger" style="color: #943032;">

                    <div class="form-group col-md-4 input-group-sm">
                        <label for="from_date"><small>From:</small></label>
                        <asp:TextBox ID="TxtFromdate" type="text" placeholder="From Date" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                    <div class="form-group col-md-4 input-group-sm">
                        <label for="to_date"><small>To:</small></label>
                        <asp:TextBox ID="TxtToDate" type="text" placeholder="To Date" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                    <div class="form-group col-md-4 input-group-sm">
                        <label for="to_date"><small>Days(s) Of Absence:</small></label>
                        <asp:Label ID="lblNumberOfDays" runat="server" Text="Days(s) Of Absence" CssClass="form-control"></asp:Label>
                        <%--<asp:Label ID="txtNumberOfDays" runat="server" CssClass="form-control" Text="Label"></asp:Label>--%>
                        <%--<asp:TextBox ID="TxtNumberOfDays" ReadOnly="true" type="text" placeholder="Days(s) Of Absence" CssClass="form-control" EnableViewState="true" runat="server"></asp:TextBox>--%>
                        <%--<asp:Label ID="Labelhid" runat="server" Text="" Visible="false"></asp:Label>--%>
                    </div>

                </div>



                <div class="row list-group-item list-group-item-danger" style="color: #943032;">
                    <div class="col-md-12">
                        <label>Reason For Absence: &nbsp;</label>
                    </div>
                    <div class=" col-md-12"></div>

                    <textarea id="textarea_reasonforAbsence" runat="server" class="form-control comment-textArea" rows="1" style="margin-bottom: 10px"></textarea>


                    <%--<h5 id="obligation-text"><em>You must submit requests for absences, other than sick leave, two days prior to the first day you will be absent.</em></h5>--%>
                </div>

            </div>

            <div class="list-group-item list-group-item-danger" style="border: none; margin-top: 10px" id="superviser_section" runat="server" visible="false">




                <div class="row list-group-item list-group-item-danger" style="color: #943032;">

                    <div class="text-center request-form-title1 list-group-item list-group-item-danger" style="background-color: #943032">
                        <h4>Superviser Approval</h4>
                    </div>

                    <div class="col-md-2 middleportion1">
                        <div style="margin-bottom: 10px">

                            <div class="input-group input-group-sm">
                                <asp:RadioButton GroupName="Superviser" ID="RadioBtn_Approved_supervise" class="input-group-addon" runat="server" />
                                <span class="form-control " style="color: #943032; font-weight: bold">Approved </span>

                                <asp:RadioButton GroupName="Superviser" ID="RadioButton1" class="input-group-addon" runat="server" />
                                <span class="form-control " style="color: #943032; font-weight: bold">Rejected </span>
                            </div>


                        </div>

                    </div>
                </div>



                <div class="row list-group-item list-group-item-danger" style="color: #943032;">
                    <div class="col-md-12">
                        <label>Superviser Comments: &nbsp;</label>
                    </div>
                    <div class="comment-textArea col-md-12"></div>

                    <textarea id="textarea_reasonforAbsenceSupervise" runat="server" class="form-control comment-textArea" rows="1" style="margin-bottom: 10px"></textarea>


                    <%--<h5 id="H1"><em>You must submit requests for absences, other than sick leave, two days prior to the first day you will be absent.</em></h5>--%>
                </div>

            </div>
            <div class="list-group-item list-group-item-danger" style="border: none; margin-top: 10px" id="HRsection" runat="server" visible="false">



                <div class="row list-group-item list-group-item-danger" style="color: #943032;">
                    <div class="text-center request-form-title1" style="background-color: #943032">
                        <h4>HR Approval</h4>
                    </div>

                    <div class="col-md-2 lowerportion1">
                        <div style="margin-bottom: 10px">

                            <div class="input-group input-group-sm">
                                <asp:RadioButton GroupName="Superviser" ID="RadioButton2" class="input-group-addon" runat="server" />
                                <span class="form-control " style="color: #943032; font-weight: bold">Approved </span>

                                <asp:RadioButton GroupName="Superviser" ID="RadioButton3" class="input-group-addon" runat="server" />
                                <span class="form-control " style="color: #943032; font-weight: bold">Rejected </span>
                            </div>


                        </div>
                        <%-- <div>
                            <label class="checkbox-inline">
                                <div class="input-group input-group-sm">
                                   
                                </div>

                            </label>
                        </div>--%>
                    </div>
                </div>

                <div class="row list-group-item list-group-item-danger" style="color: #943032;">
                    <div class="col-md-12">
                        <label>HR Comments: &nbsp;</label>
                    </div>
                    <div class="comment-textArea col-md-12"></div>

                    <textarea id="txtarea_ReasonForAbsence_HR" class="form-control comment-textArea" rows="1" style="margin-bottom: 10px"></textarea>







    







                    <%--<h5 id="H2"><em>You must submit requests for absences, other than sick leave, two days prior to the first day you will be absent.</em></h5>--%>
                </div>


            </div>

            <div class="row" style="text-align: center; padding-top: 10px">
                <%--border:1px solid #808080 --%>
                <div class="col-md-12">
                    <asp:HiddenField ID="hdnResultValue" Value="0" runat="server" />
                    <asp:Button ID="BtnSubmit" CssClass="btn btn-danger" runat="server" Text="Submit" OnClientClick="fetchText()" OnClick="BtnSubmit_Click" />
                    <asp:Button ID="BtnCancle" CssClass="btn btn-danger" runat="server" Text="Cancle" />
                </div>

            </div>

        </div>


    </form>
</body>
</html>
