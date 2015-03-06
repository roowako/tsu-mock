<%@ Page Language="VB" AutoEventWireup="false" CodeFile="statistics-ui.aspx.vb" Inherits="statistics_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Statistics</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/horizBarChart.css" rel="stylesheet" />
    <link href="./css/chart.css" rel="stylesheet" />
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
                    <a class="navbar-brand extended-brand " href="./Default.aspx">
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
	                    <ul class="nav nav-sidebar">
		                    <li>
			                    <a href="#" >
                                    <asp:Image ID="undeditable" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="50" Width="65" BorderColor="White" BorderStyle="Solid" BorderWidth="3"  /> 
			                    </a>
		                    </li>
		                    <li><a href="#" class="bolder"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a></li>
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
                        <li>
                          <a href="#" id="alumni_logout" runat="server">
                            <span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;Log out
                          </a>
                        </li>
                            <li> <asp:TextBox ID="account_idpk" runat="server" ></asp:TextBox> </li>

                            <li> <asp:TextBox ID="college_id" runat="server"></asp:TextBox> </li>
                            
	                    </ul>

                    </div>

                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"  style="background:#FFF;">
                       
                        <div class="row borderless">
                            <div class="col-xs-4">
                                  <h3 class="page-header"><span class="glyphicon glyphicon-option-vertical">&nbsp;</span>View Survey statitics</h3>                                
                             </div>
                             <div class="col-xs-3">
                                <div id="loaderImage"  class="ajax-loader"></div>
                             </div>
                         </div>    
                        <div class="row placeholders">
                            <br />
                            <!-- start main-content -->
                             <div class="col-xs-6 col-sm-12 placeholder " >

                                 <div class="row"  >
                                     <div class="col-xs-3">
                                         <div class="input-group">
                                             <div class="input-group-addon">Filter by :</div>
                                             <asp:DropDownList ID="filterSurvey" runat="server" CssClass="form-control filterView" >
                                                 <asp:ListItem Text="Survey Questions" Value="poll"/>
                                                 <asp:ListItem Text="General Survey Questions" Value="survey" />
                                             </asp:DropDownList>
                                            
                                         </div>
                                     </div>

                                     <div class="col-xs-3">
                                          <asp:DropDownList ID="cboCollege" runat="server" CssClass="form-control">
                                             
                                          </asp:DropDownList>
                                     </div>

                                     <div class="col-xs-3">
                                          <asp:DropDownList ID="cboCourse" runat="server" CssClass="form-control">
                                             <asp:ListItem>ALL COURSES</asp:ListItem>
                                          </asp:DropDownList>
                                     </div>
                                 </div>
                                 <div class="row"  style="background:#FFF;">
                                     <div class="col-xs-12 ">
                                         <h4 class="header-padded "></h4>
                                         <div class="row">
                                             <div class="col-xs-12 ">

                                                <div class="table-responsive" >
                                                    <table class="table tableDetailsView "  id="pendingPlaceholder" style="cursor:pointer">
                                                        <thead>
                                                            <tr>
                                                      
                                                                <th><b>Title</b></th>
                                                                <th><b>Question</b></th>                                   
                                                                <th><b>College</b></th>
                                                                <th></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                               
                                                        </tbody>          
                                                    </table>
                                                </div>

                                                 <div class="row">
                                                     <div class="col-xs-12">
                                                         <div class="genSurvey table-responsive" style="display:none;"> 
                                                          <table class="table" >
                                                            <thead>
                                                                <tr>
                                                                   
                                                                    <th><b>Survey</b></th>
                                                                    <th><b></b></th>                                   
                                                                </tr>
                                                            </thead>
                                                            
                                                            <tbody>
                                                                <tr>
                                                                
                                                                    <td>General Employment Survey</td>
                                                                    <td  style="text-align:right;"><input type="button" class="btn btn-warning btn-sm" value="View statistics" id="employed_stat" data-toggle='modal' data-target='#myModal' /></td>                               
                                                                </tr> 
                                                            </tbody>          
                                                        </table>
                                                         </div>
                                                     </div>
                                                 </div>
                                                 
                                                 <br />
                                             </div>
                                         </div>
          
                                     </div>
                                 </div>
                                 <br />
                            </div>

                             <!-- star spacer -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End content here -->
        </div>
    </form>

    //Modal form
    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Survey Statistics</h4>
            <h6 class="modal-title" id="Modal-College-Info">Survey Statistics</h6>
            <h6 class="modal-title" id="Modal-Course-Info">Survey Statistics</h6>
            <h6 class="modal-title" id="Modal-Respondents-Info">Survey Statistics</h6>
          </div>

          <div class="modal-body ">          
              <div class="chart-horiz">
                <ul class="chart"> </ul>
              </div>
          </div>

          <div class="modal-footer" style="background:#f5f5f5;">
              <div class="btn-group">
                  <button type="button" class="btn btn-warning btn-sm" data-dismiss="modal" id="director_print"><span class="glyphicon glyphicon-print"></span>&nbsp;Print Statistics </button>
                   <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal" id="close">Close</button>
              </div>
              
          </div>
        </div>
      </div>
    </div>

    //Delete modal
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

    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script type="text/javascript" src="./js/horizBarChart.js"></script>
    <script type="text/javascript" src="./js/bindDelay.js"></script>
    <script type="text/javascript" src="./js/home-search.js"></script>
    <script type="text/javascript" src="./js/json2.js"></script>
    <script type="text/javascript">
        var pollID;
        var college_desc = $("#cboCollege").val();
        var course_desc = $("#cboCourse").val();
        var report_desc = $("#filterSurvey").val();
        var ui;

        $("#director_print").click(function () {
            college_desc = $("#cboCollege").val();
            course_desc = $("#cboCourse").val();
            report_desc = $("#filterSurvey").val();

            console.log(college_desc);
            console.log(course_desc);
            console.log(report_desc);
            console.log(pollID);
            window.open("./reports/statistics_report.aspx?college_desc=" + college_desc + "&course_desc=" + course_desc + "&report_desc=" + report_desc + "&survey_id=" + pollID, "fullscreen=yes");
        });

        $("#close").click(function () {
            $(".modal-body .chart").html("");
        });

        $('.chart').horizBarChart({
            selector: '.bar',
            speed: 3000
        });

        var object =[];
        var param1 =[];
        var c_id = $("#college_id").val();
            var filterView = "poll";
            var collegeView;
           
            $.ajax({
                type: "post",
                url: "statistics-ui.aspx/PullQ",
                data: "{'filterView':'" + filterView + "','cid':'" + c_id + "','college_desc':'" + college_desc + "'}",
                dataType: "json",
                contentType: "application/json",
                success: function (serverData) {
                    data = serverData.d;
                    data = jQuery.parseJSON(data);

                    $.each(data, function (i, o) {
                        $(".tableDetailsView tbody").append(
                            "<tr>" +                              
                                "<td>" + o.t + " </td>" +
                                "<td>" + o.q + "</td>" +
                                "<td>" + o.c + " </td>" +
                                "<td style='text-align:right;'>" +
                                    "<div class='btn-group' role='group'>" +
                                        "<a class='btn btn-warning btn-sm theatre' data-poll-id='" + o.pid + "' data-toggle='modal' data-target='#myModal'>View Statistics </a> " +
                                        "<a class='btn btn-danger btn-sm deletePoll' data-poll-id='" + o.pid + "' data-toggle='modal' data-target='.bs-example-modal-sm '>&nbsp;<span class='glyphicon glyphicon-trash'></span></a>" +
                                    "</div>" +
                                "</td>" +                               
                            "</tr>"
                            );

                        console.log(o.poid);
                    });

                    $(".theatre").click(function () {
                        $(".chart").html("");
                        $("#questionPlaceholder").text($(this).data("poll-question"));
                        $("#myModalLabel").text($(this).data("poll-title"));

                        pollsPK = $(this).data("poll-id");
                        pollID = $(this).data("poll-id");
                        college_desc = $("#cboCollege").val();
                        course_desc = $("#cboCourse").val();
                        report_desc = $("#filterSurvey").val();

                        $.ajax({
                            type: "post",
                            url: "./statistics-ui.aspx/pullPollOptions",
                            data: "{'optFk' :'" + pollsPK + "','college_desc' :'" + college_desc + "','course_desc' :'" + course_desc + "' }",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (dataOpt) {

                                optionsArr = dataOpt.d;
                                optionsArr = jQuery.parseJSON(optionsArr);
                                var s;

                                $.each(optionsArr, function (i, pollOpt) {
                                    if (pollOpt.stats_data == 0) {
                                        s = "Zero respondents";                                       
                                    }
                                    else {
                                        s = pollOpt.stats_data;                                      
                                    }

                                    console.log(pollOpt.stats_data);
                                    $(".chart").append(
                                        "<li class='bar' title='" + pollOpt.option_description + "' >" +
                                            "<span class='bar' data-number=" + s + "></span>" +
                                            "<span class='number'>" + s + "</span>" +
                                        "</li>"
                                        );
                                });

                                $('.chart').horizBarChart({
                                    selector: '.bar',
                                    speed: 3000
                                });


                                console.log(object);
                            }
                        });
                    });


                    $(".deletePoll").on("click", function () {
                        uid = "";
                        uid = $(this).data("poll-id");
                        $(".del_p").data("uid", uid);
                    });

                    $(".del_p").on("click", function () {
                        $.ajax({
                            type: "post",
                            url: "statistics-ui.aspx/deletePoll",
                            data: "{'poll_id':'" + uid + "'}",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (serverData) {
                                window.location.reload(true);
                            }
                        });
                    });
                    

                }
            });
            
            $("#cboCollege").change(function () {
                var a = $(".filterView option:selected").val();
                var b = $("#college_id").val();
                var c = $("#cboCollege").val();

                console.log(a)
                console.log(b)
                console.log(c)

                myFunction(a, b, c);
            });

            $(".filterView").change(function () {
                filterView = $(".filterView option:selected").val();

              if (filterView == "poll") {
                  $(".modal-body .chart").html("");
                  $(".table-responsive").css("display", "block");
                  $(".genSurvey").css("display", "none");
                  $(".tableDetailsView tbody").html("");

                    //Fetch Survey
                    $.ajax({
                        type: "post",
                        url: "statistics-ui.aspx/PullQ",
                        data: "{'filterView':'" + filterView + "'}",
                        dataType: "json",
                        contentType: "application/json",
                        success: function (serverData) {
                            data = serverData.d;
                            data = jQuery.parseJSON(data);
                            $.each(data, function (i, o) {
                                $(".tableDetailsView tbody").append(
                                    "<tr>" +
                                     
                                        "<td> " + o.t + " </td>" +
                                        "<td> " + o.q + "</td>" +
                                        "<td>" + o.c + " </td>" +
                                        "<td style='text-align:right;'>" +
                                            "<div class='btn-group' role='group'>" +
                                                "<a class='btn btn-warning btn-sm theatre' data-poll-id='" + o.pid + "' data-toggle='modal' data-target='#myModal'>View Statistics </a> " +
                                                "<a class='btn btn-danger btn-sm deletePoll' data-poll-id='" + o.pid + "' data-toggle='modal' data-target='.bs-example-modal-sm '>&nbsp;<span class='glyphicon glyphicon-trash'></span></a>" +
                                            "</div>" +
                                        "</td>" +

                                   "</tr>"
                                    );
                                console.log(o.polls_idpk);
                            });

                            $(".theatre").click(function () {
                                $(".chart").html("");
                                $("#questionPlaceholder").text($(this).data("poll-question"));
                                $("#myModalLabel").text($(this).data("poll-title"));
                                
                                pollsPK = $(this).data("poll-id");
                                pollID = $(this).data("poll-id");
                                college_desc = $("#cboCollege").val();
                                course_desc = $("#cboCourse").val();
                                report_desc = $("#filterSurvey").val();

                                $.ajax({
                                    type: "post",
                                    url: "./statistics-ui.aspx/pullPollOptions",
                                    data: "{'optFk' :'" + pollsPK + "','college_desc' :'" + college_desc + "','course_desc' :'" + course_desc + "'  }",
                                    dataType: "json",
                                    processData: false,
                                    traditional: true,
                                    contentType: "application/json; charset=utf-8",
                                    success: function (dataOpt) {

                                        optionsArr = dataOpt.d;
                                        optionsArr = jQuery.parseJSON(optionsArr);
                                        var s;

                                        $.each(optionsArr, function (i, pollOpt) {
                                            if (pollOpt.stats_data == 0) {
                                                s = "Zero respondents";
                                            } else {
                                                s = pollOpt.stats_data;
                                            }

                                            console.log(pollOpt.stats_data);
                                            $(".chart").append(
                                                "<li class='current' title='" + pollOpt.option_description + "' >" +
                                                    "<span class='bar' data-number=" + s + "></span>" +
                                                    "<span class='number'>" + s + "</span>" +
                                                "</li>"
                                                );
                                        });

                                        $('.chart').horizBarChart({
                                            selector: '.bar',
                                            speed: 3000
                                        });
                                    }
                                });
                            });
                        }
                    });

                } else if (filterView == "survey") {
                    //Fetch General Survey
                    $(".tableDetailsView tbody").html("");
                    $(".table-responsive").css("display", "none");
                    $(".genSurvey").css("display", "block");

                    $.ajax({
                        type: "post",
                        url: "statistics-ui.aspx/PullQ",
                        data: "{'filterView':'" + filterView + "'}",
                        dataType: "json",
                        contentType: "application/json",
                        success: function (serverData) {
                            data = serverData.d;
                            data = jQuery.parseJSON(data);
                            $.each(data, function (i, o) {
                                $(".table-responsive").append();
                            });

                            $(".theatre").click(function () {
                                $(".modal-body > .chart").html("");
                                $("#questionPlaceholder").text($(this).data("poll-question"));
                                $("#myModalLabel").text($(this).data("poll-title"));
                                
                                pollsPK = $(this).data("poll-id");
                                pollID = $(this).data("poll-id");
                                college_desc = $("#cboCollege").val();
                                course_desc = $("#cboCourse").val();
                                report_desc = $("#filterSurvey").val();

                                $.ajax({
                                    type: "post",
                                    url: "./statistics-ui.aspx/pullPollOptions",
                                    data: "{'optFk' :'" + pollsPK + "','college_desc' :'" + college_desc + "','course_desc' :'" + course_desc + "' }",
                                    dataType: "json",
                                    processData: false,
                                    traditional: true,
                                    contentType: "application/json; charset=utf-8",
                                    success: function (dataOpt) {

                                        optionsArr = dataOpt.d;
                                        optionsArr = jQuery.parseJSON(optionsArr);
                                        var s;

                                        $.each(optionsArr, function (i, pollOpt) {
                                            if (pollOpt.stats_data == 0) {
                                                s = "Zero respondents";
                                            } else {
                                                s = pollOpt.stats_data;
                                            }

                                            console.log(pollOpt.stats_data);
                                            $(".modal-body > .chart").append(
                                                "<li class='current' title='" + pollOpt.option_description + "' >" +
                                                    "<span class='bar' data-number=" + s + "></span>" +
                                                    "<span class='number'>" + s + "</span>" +
                                                "</li>"
                                                );
                                        });
                                        $('.chart').horizBarChart({
                                            selector: '.bar',
                                            speed: 3000
                                        });


                                        console.log(object);

                                    }
                                });


                            });
                        }

                    });
                }
                
            });

            //Stats
            $("#employed_stat").click(function () {
                $(".chart").html("");

                var college_desc = $("#cboCollege").val();
                var course_desc = $("#cboCourse").val();

                $.ajax({
                    type: "post",
                    url: "./statistics-ui.aspx/empstat",
                    data: "{'college_desc':'" + college_desc + "','course_desc':'" + course_desc + "'}",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (dataOpt) {
                        data = dataOpt.d
                        data = jQuery.parseJSON(data)
                        var g;

                        $("#myModalLabel").text("Employment survey statistics.");
                        $("#Modal-College-Info").text("   " + college_desc);
                        $("#Modal-Course-Info").text("   " + course_desc);
                        
                        var empstat_yes;
                        var empstat_no;

                        $.each(data, function (i, o) {
                            var total_respondents;
                            total_respondents = o.Employed + o.Unmployed;
                            $("#Modal-Respondents-Info").text("   Total Number of Respondent(s): " + total_respondents);

                            //Emp Status
                            if (o.Employed == 0) { empstat_yes = "Zero Respondents"; } else { empstat_yes = o.Employed; }
                            if (o.Unmployed == 0) { empstat_no = "Zero Respondents"; } else { empstat_no = o.Unmployed; }

                            //Q1
                            if (o.Q1A == 0) { q1a = "Zero Respondents"; } else { q1a = o.Q1A; }
                            if (o.Q1B == 0) { q1b = "Zero Respondents"; } else { q1b = o.Q1B; }
                            if (o.Q1C == 0) { q1c = "Zero Respondents"; } else { q1c = o.Q1C; }
                            if (o.Q1D == 0) { q1d = "Zero Respondents"; } else { q1d = o.Q1D; }

                            //Q2
                            if (o.Q2A == 0) { q2a = "Zero Respondents" } else { q2a = o.Q2A }
                            if (o.Q2B == 0) { q2b = "Zero Respondents" } else { q2b = o.Q2B }

                            //Q3
                            if (o.Q3A == 0) { q3a = "Zero Respondents" } else { q3a = o.Q3A }
                            if (o.Q3B == 0) { q3b = "Zero Respondents" } else { q3b = o.Q3B }

                            //Q4
                            if (o.Q4A == 0) { q4a = "Zero Respondents" } else { q4a = o.Q4A }
                            if (o.Q4B == 0) { q4b = "Zero Respondents" } else { q4b = o.Q4B }

                            //Q5
                            if (o.Q5A == 0) { q5a = "Zero Respondents" } else { q5a = o.Q5A }
                            if (o.Q5B == 0) { q5b = "Zero Respondents" } else { q5b = o.Q5B }
                            if (o.Q5C == 0) { q5c = "Zero Respondents" } else { q5c = o.Q5C }

                            //Q6
                            if (o.Q6A == 0) { q6a = "Zero Respondents"; } else { q6a = o.Q6A; }
                            if (o.Q6B == 0) { q6b = "Zero Respondents"; } else { q6b = o.Q6B; }
                            if (o.Q6C == 0) { q6c = "Zero Respondents"; } else { q6c = o.Q6C; }
                            if (o.Q6D == 0) { q6d = "Zero Respondents"; } else { q6d = o.Q6D; }

                            //Q7
                            if (o.Q7A == 0) { q7a = "Zero Respondents"; } else { q7a = o.Q7A; }
                            if (o.Q7B == 0) { q7b = "Zero Respondents"; } else { q7b = o.Q7B; }
                            if (o.Q7C == 0) { q7c = "Zero Respondents"; } else { q7c = o.Q7C; }
                            if (o.Q7D == 0) { q7d = "Zero Respondents"; } else { q7d = o.Q7D; }

                            //FS
                            //Q3
                            if (o.FSA == 0) { fsa = "Zero Respondents" } else { fsa = o.FSA }
                            if (o.FSB == 0) { fsb = "Zero Respondents" } else { fsb = o.FSB }

                            //HEA
                            //Q5
                            if (o.HEA1 == 0) { hea1 = "Zero Respondents" } else { hea1 = o.HEA1 }
                            if (o.HEA2 == 0) { hea2 = "Zero Respondents" } else { hea2 = o.HEA2 }
                            if (o.HEA3 == 0) { hea3 = "Zero Respondents" } else { hea3 = o.HEA3 }

                            $(".chart").append(
                                
                                "<li> Are you currently employed?</li>" +
                                "<li class='current' title='Employed' >" +
                                    "<span class='bar' data-number=" + empstat_yes + "></span>" +
                                    "<span class='number'>" + empstat_yes + "</span>" +
                                "</li>"+
                                "<li class='current' title='Unemployed' >" +
                                    "<span class='bar' data-number=" + empstat_no + "></span>" +
                                    "<span class='number'>" + empstat_no  + "</span>" +
                                "</li>" +

                                //Q1
                                "<li>How long did it take to find your First employment? </li>" +
                                "<li class='current' title='1 to 3 months' >" +
                                    "<span class='bar' data-number=" + q1a + "></span>" +
                                    "<span class='number'>" + q1a + "</span>" +
                                "</li>" +
                                "<li class='current' title='4 to 6 months' >" +
                                    "<span class='bar' data-number=" + q1b + "></span>" +
                                    "<span class='number'>" + q1b + "</span>" +
                                "</li>" +
                                "<li class='current' title='7 months to 1 year' >" +
                                    "<span class='bar' data-number=" + q1c + "></span>" +
                                    "<span class='number'>" + q1c + "</span>" +
                                "</li>" +
                                "<li class='current' title='other' >" +
                                    "<span class='bar' data-number=" + q1d + "></span>" +
                                    "<span class='number'>" + q1d + "</span>" +
                                "</li>" +

                                //Q2
                                "<li>Is your current work/job is aligned to your field of education? </li>" +
                                "<li class='current' title='Yes' >" +
                                    "<span class='bar' data-number=" + q2a + "></span>" +
                                    "<span class='number'>" + q2a + "</span>" +
                                "</li>" +
                                "<li class='current' title='No' >" +
                                    "<span class='bar' data-number=" + q2b + "></span>" +
                                    "<span class='number'>" + q2b + "</span>" +
                                "</li>" +

                                //Q3
                                "<li>Location of employment? </li>" +
                                "<li class='current' title='Abroad' >" +
                                    "<span class='bar' data-number=" + q3a + "></span>" +
                                    "<span class='number'>" + q3a + "</span>" +
                                "</li>" +
                                "<li class='current' title='Local' >" +
                                    "<span class='bar' data-number=" + q3b + "></span>" +
                                    "<span class='number'>" + q3b + "</span>" +
                                "</li>" +

                                //Q4
                                "<li>The classification of your company or institution? </li>" +
                                "<li class='current' title='Private' >" +
                                    "<span class='bar' data-number=" + q4a + "></span>" +
                                    "<span class='number'>" + q4a + "</span>" +
                                "</li>" +
                                "<li class='current' title='Public' >" +
                                    "<span class='bar' data-number=" + q4b + "></span>" +
                                    "<span class='number'>" + q4b + "</span>" +
                                "</li>" +

                                //Q5
                                "<li>Nature of appointment? </li>" +
                                "<li class='current' title='Regular' >" +
                                    "<span class='bar' data-number=" + q5a + "></span>" +
                                    "<span class='number'>" + q5a + "</span>" +
                                "</li>" +
                                "<li class='current' title='Probation' >" +
                                    "<span class='bar' data-number=" + q5b + "></span>" +
                                    "<span class='number'>" + q5b + "</span>" +
                                "</li>" +
                                "<li class='current' title='Self-employed' >" +
                                    "<span class='bar' data-number=" + q5c + "></span>" +
                                    "<span class='number'>" + q5c + "</span>" +
                                "</li>" +

                                //Q6
                                "<li>What is your present position?  </li>" +
                                "<li class='current' title='Rank and File' >" +
                                    "<span class='bar' data-number=" + q6a + "></span>" +
                                    "<span class='number'>" + q6a + "</span>" +
                                "</li>" +
                                "<li class='current' title='Supervisory Level' >" +
                                    "<span class='bar' data-number=" + q6b + "></span>" +
                                    "<span class='number'>" + q6b + "</span>" +
                                "</li>" +
                                "<li class='current' title='Managerial Level' >" +
                                    "<span class='bar' data-number=" + q6c + "></span>" +
                                    "<span class='number'>" + q6c + "</span>" +
                                "</li>" +
                                "<li class='current' title='Others' >" +
                                    "<span class='bar' data-number=" + q6d + "></span>" +
                                    "<span class='number'>" + q6d + "</span>" +
                                "</li>" +

                                //Q7
                                "<li>How long have you been working in your current company? </li>" +
                                "<li class='current' title='1 to 6 months' >" +
                                    "<span class='bar' data-number=" + q7a + "></span>" +
                                    "<span class='number'>" + q7a + "</span>" +
                                "</li>" +
                                "<li class='current' title='7 months to 1 year' >" +
                                    "<span class='bar' data-number=" + q7b + "></span>" +
                                    "<span class='number'>" + q7b + "</span>" +
                                "</li>" +
                                "<li class='current' title='1 year to 3 years' >" +
                                    "<span class='bar' data-number=" + q7c + "></span>" +
                                    "<span class='number'>" + q7c + "</span>" +
                                "</li>" +
                                "<li class='current' title='Others' >" +
                                    "<span class='bar' data-number=" + q7d + "></span>" +
                                    "<span class='number'>" + q7d + "</span>" +
                                "</li>" +

                                //FURTHER STUDY
                                "<li>Did you pursue a higher level of Education?</li>" +
                                "<li class='current' title='Yes' >" +
                                    "<span class='bar' data-number=" + fsa + "></span>" +
                                    "<span class='number'>" + fsa + "</span>" +
                                "</li>" +
                                "<li class='current' title='No' >" +
                                    "<span class='bar' data-number=" + fsb + "></span>" +
                                    "<span class='number'>" + fsb + "</span>" +
                                "</li>" +

                                //HIGHEST EDUCATIONAL ATTAINMENT
                                "<li>Highest educational attainment.</li>" +
                                "<li class='current' title='Doctoral' >" +
                                    "<span class='bar' data-number=" + hea1 + "></span>" +
                                    "<span class='number'>" + hea1 + "</span>" +
                                "</li>" +
                                "<li class='current' title='Masteral' >" +
                                    "<span class='bar' data-number=" + hea2 + "></span>" +
                                    "<span class='number'>" + hea2 + "</span>" +
                                "</li>" +
                                "<li class='current' title='Others' >" +
                                    "<span class='bar' data-number=" + hea3 + "></span>" +
                                    "<span class='number'>" + hea3 + "</span>" +
                                "</li>"
                                );

                            $('.chart').horizBarChart({
                                selector: '.bar',
                                speed: 3000
                            });
                        });
                    }
                });
            });


            $(document).ready(function () {
                $('.chart').horizBarChart({
                    selector: '.bar',
                    speed: 3000
                });

                $("#cboCollege").change(function () {
                    $("#cboCourse").empty();
                    var fk = $("#cboCollege option:selected").val();
                    console.log(fk);
                    
                    $.ajax({
                        type: "post",
                        url: "loginpage.aspx/fetchCourseByIdfk",
                        data: "{'collegeFk':'" + fk + "'}",
                        dataType: "json",
                        processData: false,
                        traditional: true,
                        contentType: "application/json; charset=utf-8",
                        success: function (response) {
                            data = response.d;
                            data = jQuery.parseJSON(data);
                            $("#cboCourse").append("<option>" + "ALL COURSES" + " </option>");

                            $.each(data, function (i, o) {
                                $("#cboCourse").append(
                                    "<option>" + o.description + " </option>"
                                    );
                            });
                            console.log(response.d);
                        }

                    });
                });
            });



            function myFunction(a, b, c) {
                if (a == "poll") {
                    $(".modal-body .chart").html("");
                    $(".table-responsive").css("display", "block");
                    $(".genSurvey").css("display", "none");
                    $(".tableDetailsView tbody").html("");

                    $.ajax({
                        type: "post",
                        url: "statistics-ui.aspx/PullQ",
                        data: "{'filterView':'" + a + "','cid':'" + b + "','college_desc':'" + c + "'}",
                        dataType: "json",
                        contentType: "application/json",
                        success: function (serverData) {
                            data = serverData.d;
                            data = jQuery.parseJSON(data);

                            $.each(data, function (i, o) {
                                $(".tableDetailsView tbody").append(
                                    "<tr>" +
                                        "<td>" + o.t + " </td>" +
                                        "<td>" + o.q + "</td>" +
                                        "<td>" + o.c + " </td>" +
                                        "<td style='text-align:right;'>" +
                                            "<div class='btn-group' role='group'>" +
                                                "<a class='btn btn-warning btn-sm theatre' data-poll-id='" + o.pid + "' data-toggle='modal' data-target='#myModal'>View Statistics </a> " +
                                                "<a class='btn btn-danger btn-sm deletePoll' data-poll-id='" + o.pid + "' data-toggle='modal' data-target='.bs-example-modal-sm '>&nbsp;<span class='glyphicon glyphicon-trash'></span></a>" +
                                            "</div>" +
                                        "</td>" +
                                    "</tr>"
                                    );
                            });

                            $(".theatre").click(function () {
                                $(".chart").html("");
                                $("#questionPlaceholder").text($(this).data("poll-question"));
                                $("#myModalLabel").text($(this).data("poll-title"));

                                pollsPK = $(this).data("poll-id");
                                pollID = $(this).data("poll-id");

                                $.ajax({
                                    type: "post",
                                    url: "./statistics-ui.aspx/pullPollOptions",
                                    data: "{'optFk' :'" + pollsPK + "','college_desc' :'" + college_desc + "','course_desc' :'" + course_desc + "' }",
                                    dataType: "json",
                                    processData: false,
                                    traditional: true,
                                    contentType: "application/json; charset=utf-8",
                                    success: function (dataOpt) {

                                        optionsArr = dataOpt.d;
                                        optionsArr = jQuery.parseJSON(optionsArr);
                                        var s;

                                        $.each(optionsArr, function (i, pollOpt) {
                                            if (pollOpt.stats_data == 0) {
                                                s = "Zero respondents";
                                            }
                                            else {
                                                s = pollOpt.stats_data;
                                            }

                                            console.log(pollOpt.stats_data);
                                            $(".chart").append(
                                                "<li class='bar' title='" + pollOpt.option_description + "' >" +
                                                    "<span class='bar' data-number=" + s + "></span>" +
                                                    "<span class='number'>" + s + "</span>" +
                                                "</li>"
                                                );
                                        });

                                        $('.chart').horizBarChart({
                                            selector: '.bar',
                                            speed: 3000
                                        });

                                        console.log(object);
                                    }
                                });
                            });

                            $(".deletePoll").on("click", function () {
                                uid = "";
                                uid = $(this).data("poll-id");
                                $(".del_p").data("uid", uid);
                            });

                            $(".del_p").on("click", function () {
                                $.ajax({
                                    type: "post",
                                    url: "statistics-ui.aspx/deletePoll",
                                    data: "{'poll_id':'" + uid + "'}",
                                    dataType: "json",
                                    processData: false,
                                    traditional: true,
                                    contentType: "application/json; charset=utf-8",
                                    success: function (serverData) {
                                        window.location.reload(true);
                                    }
                                });
                            });
                        }
                    }); 
                }
            }
    </script>
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    