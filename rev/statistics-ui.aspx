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
				                    <asp:Image ID="Image2" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="75" Width="75" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />          
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
	                    </ul>
                    </div>

                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                        <h3 class="page-header"><span class="glyphicon glyphicon-signal">&nbsp;</span>Statistics</h3>
                        <div class="row placeholders">
                            <br />
                            <!-- start main-content -->
                             <div class="col-xs-6 col-sm-12 placeholder ">

                                 <div class="row">
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
                                 <div class="row">
                                     <div class="col-xs-12 ">
                                         <h4 class="header-padded "></h4>
                                         <div class="row">
                                             <div class="col-xs-12 ">

                                                <div class="table-responsive" >
                                                    <table class="table table-hover tableDetailsView" style="border-top:0px !important;" id="pendingPlaceholder">
                                                        <thead>
                                                        <tr>
                                                            <td><span class="glyphicon glyphicon-th-list"></span></td>
                                                            <td></td>
                                                            <td><b>Title</b></td>
                                                            <td><b>Question</b></td>                                   
                                                            <td><b>College</b></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                               
                                                        </tbody>          
                                                    </table>
                                                </div>

                                                 <div class="row">
                                                     <div class="col-xs-12">
                                                         <div class="genSurvey table-responsive" style="display:none;"> 
                                                          <table class="table table-hover" style="border-top:0px !important;">
                                                            <thead>
                                                                <tr>
                                                                    <td><span class="glyphicon glyphicon-th-list"></span></td>
                                                                    <td><b>Survey</b></td>
                                                                    <td><b></b></td>                                   
                                                                </tr>
                                                            </thead>
                                                            
                                                            <tbody>
                                                                <tr>
                                                                    <td><span>1</span></td>
                                                                    <td>General Employment Survey</td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" id="employed_stat" data-toggle='modal' data-target='#myModal' /></td>                               
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

          <div class="modal-footer">
              <button type="button" class="btn btn-success btn-sm" data-dismiss="modal" id="director_print">Print Statistics</button>
              <button type="button" class="btn btn-warning btn-sm" data-dismiss="modal" id="close">Close</button>
          </div>

        </div>
      </div>
    </div>

    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script type="text/javascript" src="./js/horizBarChart.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>

    <script type="text/javascript">
        $("#close").click(function () {
            $(".modal-body .chart").html("");
        });

        $("#director_print").click(function () {
            var college_desc = $("#cboCollege").val();
            var course_desc = $("#cboCourse").val();

            window.open("./director-report.aspx?college_desc="+college_desc+"&course_desc="+course_desc);
        });

        $('.chart').horizBarChart({
            selector: '.bar',
            speed: 3000
        });

        var object =[];
        var param1 =[];

            var filterView = "poll";
            var collegeView;

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
                                "<td> " + o.polls_idpk + " </td>" +
                                "<td> </td>" +
                                "<td> " + o.description + " </td>" +
                                "<td> " + o.question + "</td>" +
                                "<td> </td>"+
                                "<td> <a class='btn btn-primary btn-sm theatre' data-poll-id='" + o.polls_idpk + "' data-toggle='modal' data-target='#myModal'>View Statistics </a>&nbsp; </td>" +
                                "<td> <a class='btn btn-warning btn-sm deletePoll' data-poll-id='" + o.polls_idpk + "'>Delete Survey </a></td>" +
                            "</tr>"
                            );
                        console.log(o.polls_idpk);
                    });

                    $(".theatre").click(function () {

                        $(".chart").html("");
                        $("#questionPlaceholder").text($(this).data("poll-question"));
                        $("#myModalLabel").text($(this).data("poll-title"));
                        pollsPK = $(this).data("poll-id");
                        console.log(pollsPK);

                        $.ajax({
                            type: "post",
                            url: "./statistics-ui.aspx/pullPollOptions",
                            data: "{'optFk' :'" + pollsPK + "' }",
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

                    $(".deletePoll").click(function (e) {
                        e.preventDefault();
                        var pollId = $(this).data("poll-id");
                        $.ajax({
                            type: "post",
                            url: "statistics-ui.aspx/deletePoll",
                            data: "{'poll_id':'" + pollId + "'}",
                            dataType: "json",
                            contentType: "application/json",
                            success: function (serverData) {
                                alert(serverData.d);
                                window.location.reload(true);
                            }
                        });
                    });
                }
            });
            
            $(".filterView").change(function () {
              filterView =  $(".filterView option:selected").val();
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
                                        "<td> " + o.polls_idpk + " </td>" +
                                        "<td> </td>" +
                                        "<td> " + o.description + " </td>" +
                                        "<td> " + o.question + "</td>" +
                                        "<td> <a class='btn btn-primary btn-sm theatre' data-poll-id='" + o.polls_idpk + "' data-toggle='modal' data-target='#myModal'>View Statistics </a>&nbsp; <a class='btn btn-warning btn-sm'>Delete Poll </a></td>" +

                                    "</tr>"
                                    );
                                console.log(o.polls_idpk);
                            });

                            $(".theatre").click(function () {
                                $(".chart").html("");
                                $("#questionPlaceholder").text($(this).data("poll-question"));
                                $("#myModalLabel").text($(this).data("poll-title"));
                                pollsPK = $(this).data("poll-id");
                                console.log(pollsPK);

                                $.ajax({
                                    type: "post",
                                    url: "./statistics-ui.aspx/pullPollOptions",
                                    data: "{'optFk' :'" + pollsPK + "' }",
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
                                console.log(pollsPK);

                                $.ajax({
                                    type: "post",
                                    url: "./statistics-ui.aspx/pullPollOptions",
                                    data: "{'optFk' :'" + pollsPK + "' }",
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
                        $("#Modal-Respondents-Info").text("   Total Number of Respondent(s): " + data.length);
                        console.log(data.length);
                        var empstat_yes;
                        var empstat_no;
                        $.each(data, function (i, o) {
                            //Emp Status
                            if (o.Employed == 0) { empstat_yes = "Zero Respondents"; } else { empstat_yes = o.Employed; }
                            if(o.Unmployed  == 0){empstat_no = "Zero Respondents";} else{empstat_no = o.Unmployed;}

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
    </script>
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    