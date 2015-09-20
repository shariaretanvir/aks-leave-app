<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="datepicker.aspx.cs" Inherits="LeaveApp.datepicker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"><link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script src="js/bootstrap.min.js"></script>
    
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
     <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<%--    <script>
        $(function () {
            $('#TextBox1').datepicker({
                dateFormat: "dd-mm-yy",
                changeYear: true,
                yearRange: "1960:2016",
                minDate: 0,
                maxDate: "1m"
            });

        });
          </script>
<script>
        $(function () {
            $('#TextBox2').datepicker({
                dateFormat: "dd-mm-yy",
                changeYear: true,
                yearRange: "1960:2016",
                minDate: 0,
                maxDate: "1m"
            });

        });
          </script>--%>

    <script>
        $(document).ready(function(){
            var $fromdate = $('#TextBox1');
            var $todate = $('#TextBox2');
            $fromdate.datepicker();
            $todate.datepicker({
                onClose: function () {
                    var from = $fromdate.datepicker('getDate');
                    var to = $todate.datepicker('getDate');
                    var diff = new Date(to - from);
                    var days = diff / 1000 / 60 / 60 / 24;
                    alert(days);
                    //$('#TextBox3') = days;
                    $("#TextBox3").val(days);

                }
            });
            });
    </script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </div>
    </form>
</body>
</html>
