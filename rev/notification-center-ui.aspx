<%@ Page Language="VB" AutoEventWireup="false" CodeFile="notification-center-ui.aspx.vb" Inherits="rev_notification_center_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Notification Center</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/sidebar-theme.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
             <nav class="navbar navbar-inverse navbar-fixed-top default-theme shadowed"> 
                <div class="container-fluid">
                <div class="navbar-header ">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand extended-brand " href="./director-ui.aspx">
                        <span class="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="./assets/images/TSULOGO.png" Height="55" Width="55" CssClass="img-float-nav" />
                            <h3>&nbsp;&nbsp;&nbsp;Dashboard</h3>
                             <span class="clearfix"></span>
                        </span>
                       
                    </a>

               
                </div>
                <div id="navbar" class="navbar-collapse collapse" > <!---collapse collapse -->
                  
                     
                    
                </div><!--/.navbar-collapse -->
                </div>
            </nav>-->
             <!-- Start content here -->
            <div class="container-fluid">
                <div class="row">
                    <!--#include file="./includes/sidebar-director.inc"-->
                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                         <div class="row">
                             <div class="col-xs-4">
                                 <h3 class="page-header"><span class="glyphicon glyphicon-phone">&nbsp;</span>Notification Center</h3>
                             </div>
                             <div class="col-xs-2">
                                
                             </div>
                             <div class="col-xs-3">
                                 
                             </div>
                              <div class="col-xs-3">
                                 <ul class="right-action-buttons">
                                   <li><a href="#"><span class="glyphicon glyphicon-cog"></span> </a></li>
                                   <li><a href="#"><span class="glyphicon glyphicon-home"></span> </a></li>
                                    <li><a href="#">Log out</a></li>
                                  </ul>
                             </div>
                         </div>
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-6 placeholder announcementHolder border-enabled" >
                                <br />
                              <asp:TextBox ID="txtNotificationMessage" runat="server" TextMode="MultiLine" placeholder="" CssClass="form-control"></asp:TextBox>
                                <br />
                                <div class="row">
                                    <div class="col-xs-12 highlighted-div">
                                        <asp:Button ID="btnSendNotification" runat="server" Text="Send notification via SMS and Email" CssClass="btn btn-warning" type="button" />
                                    </div>
                                </div>
                              
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                            <div class="col-xs-6 col-sm-3 placeholder">
                                <div id="m">

                                </div>
                            </div>
                             <!-- end spacer -->
                           

                            <!-- start right-side -->
                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script>

        var emaiLarr =[];
      
        $.ajax({
            type: "post",
            url: "notification-center-ui.aspx/pullEmail",
         
            dataType: "json",
            processData: false,
            traditional: true,
            contentType: "application/json; charset=utf-8",
            success: function (dataOpt) {
              
                var data;
                data = dataOpt.d;
                data = jQuery.parseJSON(data)
                $.each(data, function (i, o) {
                  
                    emaiLarr.push(o.email_address);
                        
                    
                });

                
                console.log(dataOpt.d);
            }


        });

        $("#btnSendNotification").click(function (e) {

            e.preventDefault();
            var noti = $("#txtNotificationMessage").val();
            $.ajax({
                type: "post",
                url: "notification-center-ui.aspx/pushNotification",
                data: "{'notificationSMS':'" + noti + "','email':'" + emaiLarr + "'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (dataOpt) {
                    alert(dataOpt.d);
                    $("#txtNotificationMessage").val("");
                }


            });

        });
    </script>
</body>
</html>
