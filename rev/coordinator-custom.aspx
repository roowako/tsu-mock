<%@ Page Language="VB" AutoEventWireup="false" CodeFile="coordinator-custom.aspx.vb" Inherits="coordinator_custom" %>

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
        <div class="container-fluid  ">
           <nav class="navbar navbar-inverse navbar-fixed-top default-theme shadowed"> 
                <div class="container-fluid">
                <div class="navbar-header ">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand extended-brand " href="./coordinator-custom.aspx">
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
            <div class="container-fluid">
                <div class="row">

               
                  <div class="col-sm-3 col-md-2 sidebar">
                       <!-- side bar -->
	                <ul class="nav nav-sidebar">
		                <li>
			                <a href="" >

				                <asp:Image ID="Image2" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="75" Width="75" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />          

			                </a>

		                </li>
		                <li><a href="./alumni-profile.aspx" class="bolder"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a></li>
		                <li>
			                <br />
		                </li>
		                <li><a href="./coordinator-custom.aspx" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline</a></li>
		                <li><a href="./messaging-ui.aspx" ><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Messages</a></li>
		                <li><a href="./poll-generator-ui.aspx"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Survey</a></li>
		                <li><a href="./statistics-coordinator.aspx"><span class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;Statistics</a></li>
		                <li><a href="./token-generator-ui.aspx"><span class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;Tokens</a></li>
		  
		                <li><a href="#" id="alumni_logout" runat="server"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;Log out</a></li>
                        <li>
                            <asp:TextBox ID="account_idpk" runat="server"></asp:TextBox>
                            <asp:TextBox ID="college_idfk" runat="server"></asp:TextBox>
                        </li>
	                </ul>

                </div>


                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                        <h3 class="page-header"><span class="glyphicon glyphicon-home">&nbsp;</span>Timeline </h3>
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-6 placeholder announcementHolder ">
                              
                              <div id="loaderImage"></div>
                            
                              
                              
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                            <div class="col-xs-6 col-sm-1 placeholder"> </div>
                             <!-- end spacer -->
                           

                            <!-- start right-side -->
                            <div class="col-xs-6 col-sm-5 placeholder border-enabled">
                              <h4 class="header-padded"><span class="glyphicon glyphicon-pencil minified"></span>&nbsp; Post Announcement</h4>
                              <div class="row">
                                  <div class="col-xs-12 highlighted-div ">
                                      <div class="form-group">
                                          <asp:TextBox ID="txtPostAnnouncementCoor" runat="server" TextMode="MultiLine" placeholder="" CssClass="form-control"></asp:TextBox>
                                          <br />
                                          <asp:Button ID="btnPostAnnouncementCoor" runat="server" Text="Post Announcement" CssClass="btn btn-warning" type="button" />
                                      </div>
                                  </div>
                                  
                              </div>
                            </div>
                            <!-- end right-side -->

                        </div>
                    </div>

                </div>
            </div>

            <!-- End content here -->
        </div>



    </form>
    
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script type="text/javascript" src="./js/ajax-loader.js"></script>
    <script type="text/javascript" src="./js/home-search.js"></script>
    <script type="text/javascript" src="./js/bindDelay.js"></script>
    <script type="text/javascript" src="h./js/json2.js"></script>
    <script>
        $(document).ready(function () {
            var fk = $("#account_idpk").val();
            var college_id = $("#college_idfk").val();
            var name;
            var actor_name = $("#alumni_name").text();

            $.ajax({
                type: "post",
                url: "coordinator-custom.aspx/pullAnnouncement",
                data:"{'fk':'"+ fk +"'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (announceReturn) {
                    $("#loaderImage").hide();
                  
                    if (announceReturn.d == "[]") {
                        $(".announcementHolder").append("<p> No available announcement as of the moment. </p>");
                    } else {
                        data = announceReturn.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i, object) {
                            console.log(fk);
                            

                            $(".announcementHolder").append(

                                "<div class='row'>" +
                                    "<div class='col-xs-12 border-enabled'>" +
                                        "<h4 class='header-padded'><span class='glyphicon glyphicon-bookmark'>&nbsp;</span>" + object.given_name + "<br>  </h4>" +
                                        "<span class='dateIndicator'>&nbsp;&nbsp;" + object.formatedB + "</span>" +
                                        "<span id='del'>x </span>"+
                                        "<div class='row'>" +
                                            "<br>"+
                                            "<div class='theme-color col-xs-3 highlighted-div'>" +
                                                "<p> " + object.description + "   </p>" +
                                            "</div>" +                                       
                                        "</div> " +
                                        "<div class='row'>" +
                                            "<br>" +
                                            "<div class='theme-color col-xs-3'>" +
                                                "<a class='share btn btn-primary btn-sm' data-sharable='" + object.description + "' data-u='" + object.given_name + "'>share on facebook</a>" +
                                            "</div>" +

                                        "</div> " +

                                        "<br>" +
                                    "</div>" +
                                "</div>" +

                                "<br />"
                                );
                            if (fk == object.uid) {
                                $("#del").css("display", "block");
                            } else {
                                $("#del").css("display", "none");
                            }
                        });

                        $('.share').click(function (e) {
                            var context = $(this).data("sharable");
                            var u = $(this).data("u");
                            e.preventDefault();
                            FB.ui(
                            {
                                method: 'feed',
                                name: ' ' + context + ' ',
                                link: 'http://tsualumnitracer-001-site1.smarterasp.net/Default.aspx',
                                caption: '',
                                description: ' Posted by : ' + u + ' ',
                                message: 'aaa'
                            });
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
                    url: "coordinator-custom.aspx/pushAnnouncement",
                    data: "{'myAnnouncement':'" + announcement + "','fk':'" + fk + "','college_id':'" + college_id + "'}",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (announceReturn) {
                        $("#txtPostAnnouncementCoor").val("");
                        console.log(announceReturn);
                        alert("Announcement Posted.");
                        window.location.reload(true);
                    }
                });
            });
        });
    </script>
</body>
</html>
