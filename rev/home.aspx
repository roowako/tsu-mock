<%@ Page Language="VB" AutoEventWireup="false" CodeFile="home.aspx.vb" Inherits="home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>TSU Alumin Tracer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
    <link href="./css/sidebar-theme.css" rel="stylesheet" />
</head>

<body onload="pullFromServer()">

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
                    <a class="navbar-brand extended-brand " href="./#">
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
            <br />
            
           <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3 col-md-2 sidebar">  <!--side-bar -->
	                        <ul class="nav nav-sidebar">
		                        <li>
			                        <a href="#" >
<asp:Image ID="undeditable" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="50" Width="65" BorderColor="White" BorderStyle="Solid" BorderWidth="3"  CssClass="non-m" />			                        </a>
		                        </li>
                            <li>    
                                <a href="./alumni-profile.aspx"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a>
                            </li>
		  		                <li><a href="./home.aspx" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline</a></li>
		                        <li><a href="./messaging-ui-alumni.aspx" ><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Messages</a></li>
		                        <li><a href="#" id="alumni_logout" runat="server"><span class="glyphicon glyphicon-off" ></span>&nbsp;&nbsp;Log out</a></li>
                                
                                <li> <asp:TextBox ID="account_idpk" runat="server"></asp:TextBox> </li>
                                <li> <asp:TextBox ID="college_idpk" runat="server"></asp:TextBox> </li>
                                <li> <asp:TextBox ID="course_idpk" runat="server"></asp:TextBox> </li>
                                <li> <asp:TextBox ID="college_desc" runat="server"></asp:TextBox> </li>                              
                            </ul>
                    </div>

                     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main " >
                         <div class="row ">
                             <div class="col-xs-4">
                                 <h3 class="page-header"><span class="glyphicon glyphicon-option-vertical">&nbsp;</span>Timeline</h3>
                             </div>
                             <div class="col-xs-4">
                                 
                             </div>
                             <div class="col-xs-2">
                                 
                             </div>
                         </div>
                        <div class="row placeholders " >
                            <br />

                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-6 placeholder announcementHolder">
                             
                             
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                            <div class="col-xs-6 col-sm-1 placeholder"> </div>
                             <!-- end spacer -->
                           
                            <!-- start right-side -->
                            <div class="col-xs-6 col-sm-5 placeholder border-enabled">
                              <h4 class="header-padded"><span class="glyphicon glyphicon-tasks minified"></span>&nbsp; Survey Questions</h4>
                              <div class="row">
                                  <div class="col-xs-12" >
                                        <table class="table" style="border-top:thin solid #ccc;">
                                            <tr>
                                          
                                                <td>Survey Title</td>                                          
                                                <td></td>
                                            </tr>
                                                    
                                        </table>

                                  </div>
                               
                              </div>
                                <div class="row"> <div id="noPoll"></div></div>

                            </div>
                            <!-- end right-side -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

     //Modal form
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="border-bottom:0px;">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel" style="border-bottom:thin solid #eee;padding-bottom:8px;">Modal title</h4>
          </div>
          <div class="modal-body">
              <h4 >Survey Question</h4>
              <p id="questionPlaceholder"></p>
           
              <br />
              <h4>Survey Options</h4>
              <ul id="placeholderOptions" class="bulletsNone">
                 
              </ul>
          </div>
          <div class="modal-footer" style="background:#f5f5f5;">
              <div class="btn-group">

                 
                 <button type="button" class="btn btn-warning btn-sm btnPollAns" data-dismiss="modal"><span class="glyphicon glyphicon-send"></span>&nbsp;&nbsp;Submit</button>
                  <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
              </div>
             
          </div>
        </div>
      </div>
    </div>
        <div class="modal fade bs-example-modal-sm" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="border-radius:3px;">
      <div class="modal-dialog modal-sm" style="width:500px;border-radius:3px;top:100px;">
        <div class="modal-content" style="border-radius:3px;">
          <div class="modal-header" style="background:#F6F7F8;border-radius:3px;padding:8px;">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h5 class="modal-title" id="myModalLabel2" style="padding:3px;"><b>Delete Post</b></h5>
          </div>
          <div class="modal-body" style="border-radius:3px;">
              <p style="border-bottom:thin solid #ccc;padding-bottom:15px;color:#333;">Are you sure you want to delete this post?</p>
         
              <div class="btn-group btn-sm" style="text-align:right;float:right">
                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger btn-sm del_p">Confirm</button>
            </div>
          </div>
      
        </div>
      </div>
    </div>
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script type="text/javascript" src="./js/home-search.js"></script>
    <script type="text/javascript" src="./js/bindDelay.js"></script>
    <script type="text/javascript" src="h./js/json2.js"></script>
    <script>
        var college_id = $("#college_idpk").val();
        var course_id = $("#course_idpk").val();
        var college_desc = $("#college_desc").val();
        var filterPoll = $("#account_idpk").val();
        var myParam = location.search.split('id=')[1];
        var sharable;
        var uid;

        $("#alumni_name").text(myParam);

            function pullFromServer() {
                $.ajax({
                    type: "post",
                    url: "./home.aspx/pullFromServer",
                    data: "{'filter':'" + filterPoll + "','college_id':'" + college_id + "'}",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",

                    success: function (r) {
                        data = r.d;
                        data = jQuery.parseJSON(data);

                        if (data.length == 0)
                        {
                            $("#noPoll").append("<span> <b> No available survey for graduating students. </b> </span>");
                        }
                        else
                        {
                            $.each(data, function (i, object) {
                                object.status = "active";

                                $(".table").append(
                                    "<tr>" +
                                    "<td>  " + object.polls_idpk + " </td>" +
                                    "<td>  " + object.description + " </td>" +
                                    "<td>  " + "<a class='btn btn-primary btn-sm theatre' id='" + object.polls_idpk + "' data-poll-title='" + object.description + "' data-poll-question='" + object.question + "' data-poll-id='" + object.polls_idpk + "' data-toggle='modal' data-target='#myModal'>View Details and participate </a>" + " </td>" +
                                    "</tr>"
                                    );
                            });
                            
                            //ITERATE POLL OPTIONS
                            $(".theatre").click(function () {
                                $("#placeholderOptions").html("");
                                $("#questionPlaceholder").text($(this).data("poll-question"));
                                $("#myModalLabel").text($(this).data("poll-title"));
                                $(".btnPollAns").attr("data-poll-idpk", $(this).data('poll-id'));
                                pollsPK = $(this).data("poll-id");

                                $.ajax({
                                    type: "post",
                                    url: "./home.aspx/pullPollOptions",
                                    data: "{'optFk' :'" + pollsPK + "' }",
                                    dataType: "json",
                                    processData: false,
                                    traditional: true,
                                    contentType: "application/json; charset=utf-8",
                                    success: function (dataOpt) {

                                        optionsArr = dataOpt.d;
                                        optionsArr = jQuery.parseJSON(optionsArr);

                                        $.each(optionsArr, function (i, pollOpt) {
                                            var replaced = pollOpt.option_description.replace("-", ",");
                                            $("#placeholderOptions").append(
                                             "<li><input type='radio' name='polloptions' value=" + pollOpt.pollsoption_idpk + "> &nbsp; " + replaced + "  </li>"
                                             );
                                        });
                                    }
                                });
                            });

                            //ANSWER POLL
                            $(".btnPollAns").click(function (e) {
                                e.preventDefault();
                                var pollAns = $("input[name='polloptions']:checked").val();
                                var pollFk = $(this).data("poll-idpk");
                                var account_id = $("#account_idpk").val();
                                college_id = $("#college_idpk").val();
                                course_id = $("#course_idpk").val();

                                $.ajax({
                                    type: "post",
                                    url: "./home.aspx/pushToPollDataStats",
                                    data: "{'poll_idpk' :'" + pollsPK + "','poll_option_idfk':'" + pollAns + "','account_idfk':'" + account_id + "','course_idfk':'" + course_id + "','college_idfk':'" + college_id + "' }",
                                    dataType: "json",
                                    processData: false,
                                    traditional: true,
                                    contentType: "application/json; charset=utf-8",
                                    success: function (dataOpt) {
                                        alert("Thank you for participating.");
                                        window.location.reload(true);
                                    }
                                });
                            });
                        }
                    }
                });
            }

            $.ajax({
                type: "post",
                url: "home.aspx/pullAnnouncement",
                data: "{'college_id' :'" + college_id + "' }",
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
                            else { src_ = object.dp; }
                            $(".announcementHolder").append(

                                "<div class='row'>" +
                                        "<div class='col-xs-12 border-enabled highlighted-div'>" +
                                            "<h4 class='header-padded' style='color:#A6635D;'><img style='border-radius:0px !important;width:36px;height:33px;' src='" + src_ + "'/> &nbsp;" + object.u +
                                            "<br><span class='dateIndicator' >&nbsp;&nbsp;" + object.formatedB + "</span>" + "</h4>" +

                                            "<div class='row'>" +

                                                "<div class='theme-color col-xs-3 highlighted-div'>" +
                                                    "<p > " + object.description + "   </p>" +
                                                "</div>" +
                                            "</div> " +
                                            "<div class='row ' style='background:#F6F7F8;border-top:thin solid #E1E2E3;'>" +

                                                "<div class='theme-color col-xs-12 btn-group' style='text-align:right;padding:8px;'>" +
                                                    "<a href='#' style='color:#A6635D;font-size:13px;' class='share' data-sharable='" + object.description + "' data-u='" + object.u + "' data-src='" + src_ + "'>Share</a>" +
                                                    
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
    </script>
            
    </form>

     </body>
</html>

