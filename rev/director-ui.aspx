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
    <div id="fb-root"></div>
    <script>
        window.fbAsyncInit = function () {
            FB.init({
                appId: '587353881401057', status: true, cookie: true,
                xfbml: true
            });
        };
        (function () {
            var e = document.createElement('script'); e.async = true;
            e.src = document.location.protocol +
            '//connect.facebook.net/en_US/all.js';
            document.getElementById('fb-root').appendChild(e);
        }());
    </script>

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
                    <br />
                  <ul class="nav navbar-nav navbar-right extended" style="margin-top:8px;margin-right:100px;">
                        <li>
                            <div class="form-group" style="position:absolute;z-index:40000;">
                                <input type="text" placeholder="Search for alumni" name=""  class="form-control input-sm" id="searching" autocomplete="off"/>
                                <div class="resWrapper">

                                </div>
                            <div class="display"></div>
                            </div>
                        </li>
                    </ul>
                </div><!--/.navbar-collapse -->
                </div>
            </nav>-->
             <!-- Start content here -->
            <div class="container-fluid" style="background:#F5F5F5">
                <div class="row">
                    <div class="col-sm-3 col-md-2 sidebar">
	                    <ul class="nav nav-sidebar">
		                    <li>
			                    <a href="#" >

				                    <asp:Image ID="undeditable" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="50" Width="65" BorderColor="White" BorderStyle="Solid" BorderWidth="3"  CssClass="non-m" />          

			                    </a>

		                    </li>
		                    <li><a href="./alumni-profile.aspx" class="bolder"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a></li>
		  
		                    <li><a href="./director-ui.aspx" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline</a></li>
		                    <li><a href="./messaging-ui-director.aspx" ><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Messages</a></li>
		                    <li><a href="./notification-center-ui.aspx"><span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;Notification Center</a></li>
                        <li>
                          <a href="./pending-reg-ui.aspx">
                            <span class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;Pending Registration
                          </a>
                        </li>
                        <li><a href="./pending-ui.aspx"><span class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;Pending Surveys</a></li>
                        <li>
                          <a href="./survey-gen-director.aspx">
                            <span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;Surveys
                          </a>
                        </li>
		                    <li><a href="./statistics-ui.aspx"><span class="glyphicon glyphicon-signal"></span>&nbsp;&nbsp;Statistics</a></li>
			                  <li><a href="./director-list-ui.aspx"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;List of Coordinators</a></li>
			                  <li><a href="./alumni-list-ui.aspx"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;List of Registered users</a></li>
		                    <li><a href="#" id="alumni_logout" runat="server"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;Log out</a></li>
                            <li>
                                <asp:TextBox ID="account_idpk" runat="server" ></asp:TextBox>
                            </li>
	                    </ul>

                    </div>


                    <div class="col-sm-12 col-sm-offset-6 col-md-10 col-md-offset-2 main" >
                        <div class="row">
                             <div class="col-xs-4">
                                 <h3 class="page-header"><span class="glyphicon glyphicon-option-vertical">&nbsp;</span>Timeline</h3>
                             </div>
                     
                             <div class="col-xs-3">
                                 
                             </div>
                              
                         </div>
                        <div class="row placeholders" >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-6 placeholder announcementHolder" >
                              
                              
                              
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                            <div class="col-xs-6 col-sm-1 placeholder"> </div>
                             <!-- end spacer -->
                           

                            <!-- start right-side -->
                            <div class="col-xs-6 col-sm-5 placeholder border-enabled " style="background:#fff;">
                              <h4 class="header-padded" style="color:#A6635D;"><span style="color:#A6635D;" class="glyphicon glyphicon-bullhorn minified"></span>&nbsp; Post Announcement</h4>
                              <div class="row">
                                  <div class="col-xs-12 " >
                                      
                                      <div class="" style="border-top:thin solid #E1E2E3;">
                                          <br />
                                          <asp:TextBox ID="txtPostAnnouncementCoor" runat="server" TextMode="MultiLine" placeholder="" CssClass="form-control" style="resize:none;border-radius:0px;"></asp:TextBox>
                                          <br />
                                          <div class="row">
                                              <div class="col-xs-12" style="background:#F6F7F8;text-align:right;padding:8px;border-top:thin solid #E1E2E3;">
                                              
                                                   <asp:Button ID="btnPostAnnouncementCoor" runat="server" Text="Post announcement" CssClass="btn btn-primary btn-sm clerical" type="button" />
                                                
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
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="border-radius:3px;">
  <div class="modal-dialog modal-sm" style="width:500px;border-radius:3px;top:100px;">
    <div class="modal-content" style="border-radius:3px;">
      <div class="modal-header" style="background:#F6F7F8;border-radius:3px;padding:8px;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title" id="myModalLabel" style="padding:3px;"><b>Delete Post</b></h5>
      </div>
      <div class="modal-body" style="border-radius:3px;">
          <p style="border-bottom:thin solid #ccc;padding-bottom:15px;color:#333;">Are you sure you want to delete this post?</p>
         
          <div class="btn-group btn-sm" style="text-align:right;float:right">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-danger btn-sm del_p">Delete Post</button>
        </div>
      </div>
      
    </div>
  </div>
</div>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script type="text/javascript" src="./js/home-search.js"></script>
    <script type="text/javascript" src="./js/bindDelay.js"></script>
    <script type="text/javascript" src="./js/json2.js"></script>
    <script>

        $(document).ready(function () {
            var fk = $("#account_idpk").val();
            var uid;
            $.ajax({
                type: "post",
                url: "director-ui.aspx/pullAnnouncement",
                data: "{'fk':'" + fk + "'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (announceReturn) {
                    if (announceReturn.d == "[]") {
                        $(".announcementHolder").append("<p> No available announcement as of the moment. </p>");
                    } else {

                    data = announceReturn.d
                    data = jQuery.parseJSON(data)
                    $.each(data, function (i, object) {
                        var src_;
                        if (object.dp == null) { src_ = "./assets/images/default-dp.jpg"; }
                        else { src_ = object.dp;}
                        $(".announcementHolder").append(

                            "<div class='row'>" +
                                    "<div class='col-xs-12 border-enabled highlighted-div'>" +
                                        "<h4 class='header-padded' style='color:#A6635D;'><img style='border-radius:0px !important;width:36px;height:33px;' src='"+ src_ +"'/> &nbsp;" + object.u +  
                                        "<br><span class='dateIndicator' >&nbsp;&nbsp;" + object.formatedB + "</span>" + "</h4>" +

                                        "<div class='row'>" +
                                            
                                            "<div class='theme-color col-xs-3 highlighted-div'>" +
                                                "<p > " + object.description + "   </p>" +
                                            "</div>" +
                                        "</div> " +
                                        "<div class='row ' style='background:#F6F7F8;border-top:thin solid #E1E2E3;'>" +
                                           
                                            "<div class='theme-color col-xs-12 btn-group' style='text-align:right;padding:8px;'>" +
                                                "<a href='#' style='color:#A6635D;font-size:13px;' class='share' data-sharable='" + object.description + "' data-u='" + object.u + "' data-src='"+  src_ +"'>Share</a>" +
                                                "<span style='color:#A6635D;font-size:13px;'>&nbsp;&nbsp;•&nbsp;&nbsp; </span>" +
                                                "<a href='#' class='c_del'   data-toggle='modal' data-target='.bs-example-modal-sm '  style='color:#A6635D;font-size:13px;' data-id='" + object.uid + "'><span style='font-size:13px;' class='glyphicon glyphicon-trash'></span></a>&nbsp;&nbsp;" +
                                            "</div>" +
                                             
                                        "</div> " +

                                       
                                    "</div>" +
                                "</div>" +

                                "<br />"
                            );

                       
                    });
                    
                    

                    $(".c_del").on("click", function () {
                        uid = "";
                        uid = $(this).data("id");
                        $(".del_p").data("uid", uid);
                    });
                    $(".del_p").on("click", function () {
                        $.ajax({
                            type: "post",
                            url: "director-ui.aspx/deleteAnnouncement",
                            data: "{'aid':'" + uid + "'}",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (announceReturn) {
                                $("#txtPostAnnouncementCoor").val("");
                                console.log(announceReturn);
                                
                                window.location.reload(true);
                            }
                        });
                    });

                    $('.share').click(function (e) {
                        var context = $(this).data("sharable");
                        var u = $(this).data("u");
                        var dp_ = $(this).data("src");
                        e.preventDefault();
                        FB.ui(
                        {
                            method: 'feed',
                            name: ' ' + context + ' ',
                            link: 'http://alumni.tsu.edu.ph/',
                            caption: '',
                            description: ' Posted by :' + u + ' ',
                           
                        });
                    });
                    }
                }
            });

            $("#btnPostAnnouncementCoor").click(function (e) {

                e.preventDefault();
                var announcement = $("#txtPostAnnouncementCoor").val();
               
                console.log(announcement);
                if (announcement == "") { alert("Announcement can't be empty."); }

                else{
                    var id = $("#account_idpk").val();
                    $.ajax({
                        type: "post",
                        url: "director-ui.aspx/pushAnnouncement",
                        data: "{'myAnnouncement':'"+ announcement +"','id':'"+ id +"'}",
                        dataType: "json",
                        processData: false,
                        traditional: true,
                        contentType: "application/json; charset=utf-8",
                        success: function (announceReturn) {
                            $("#txtPostAnnouncementCoor").val("");
                            console.log(announceReturn);
                            window.location.reload(true);
                        }
                    });
                }
            });
        });
    </script>
</body>
</html>
