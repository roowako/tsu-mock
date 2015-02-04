<%@ Page Language="VB" AutoEventWireup="false" CodeFile="director-ui.aspx.vb" Inherits="director_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
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
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/rev/assets/images/TSULOGO.png" Height="55" Width="55" CssClass="img-float-nav" />
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
                                 <h3 class="page-header"><span class="glyphicon glyphicon-home">&nbsp;</span>Timeline</h3>
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
                            <div class="col-xs-6 col-sm-6 placeholder announcementHolder" >
                              
                              
                              
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                            <div class="col-xs-6 col-sm-1 placeholder"> </div>
                             <!-- end spacer -->
                           

                            <!-- start right-side -->
                            <div class="col-xs-6 col-sm-5 placeholder border-enabled">
                              <h4 class="header-padded"><span class="glyphicon glyphicon-pencil minified"></span>&nbsp; Post Announcement</h4>
                              <div class="row">
                                  <div class="col-xs-12 " style="border-top:thin solid #ccc;">
                                      <br />
                                      <div class="">
                                          <asp:TextBox ID="txtPostAnnouncementCoor" runat="server" TextMode="MultiLine" placeholder="" CssClass="form-control"></asp:TextBox>
                                          <br />
                                          <div class="row">
                                              <div class="col-xs-12 highlighted-div">
                                                   <asp:Button ID="btnPostAnnouncementCoor" runat="server" Text="Post Announcement" CssClass="btn btn-warning" type="button" />
                                              </div>
                                          </div>
                                         
                                      </div>
                                  </div>
                                  
                              </div>
                            </div>
                            <!-- end right-side -->

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
        $(document).ready(function () {
           
            $.ajax({
                type: "post",
                url: "director-ui.aspx/pullAnnouncement",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (announceReturn) {
                    if (announceReturn.d == "[]") {
                        $(".announcementHolder").append("<p> No available announcement as of the moment. </p>");
                    }else{
                    data = announceReturn.d
                    data = jQuery.parseJSON(data)
                    $.each(data, function (i, object) {

                        $(".announcementHolder").append(
                            
                            "<div class='row'>" +
                                "<div class='col-xs-12 border-enabled'>" +
                                    "<h4 class='header-padded'>" + object.account_idfk +" </h4>" +
                                    "<div class='row'>" +
                                        "<div class='theme-color col-xs-3 highlighted-div'>" +
                                            "<p> " + object.description + "   </p>" +
                                            "<input type='button' '  id='btnAuth' value='Authorize' class='btn btn-default' />" +
                                        "</div>" +
                                   
                                    "</div> " +
                                "</div>" +
                            "</div>" +
                            
                            "<br />"
                            );
                    });
                    }
                }

            });

            $("#btnPostAnnouncementCoor").click(function (e) {
                e.preventDefault();
                var announcement = $("#txtPostAnnouncementCoor").val();
                console.log(announcement);

                $.ajax({
                    type: "post",
                    url: "director-ui.aspx/pushAnnouncement",
                    data: "{'myAnnouncement':'"+ announcement +"'}",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (announceReturn) {
                        $("#txtPostAnnouncementCoor").val("");
                        console.log(announceReturn);
                    }
                });
            });
        });
    </script>
</body>
</html>
