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
                        <li>
                          <asp:TextBox ID="account_idpk" runat="server" ></asp:TextBox>
                        </li>
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
                                                              
                                                                <td><b>Question</b></td>
                                                                <td><b></b></td>                                   

                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                             <tr>
                                                                <td><span>1</span></td>
                                                               
                                                                 <td>Employment Status</td>
                                                                 <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" id="employed_stat" data-toggle='modal' data-target='#myModal' /></td>                               

                                                             </tr>
                                                            <tr>
                                                                <td><span>2</span></td>
                                                               
                                                                <td> How long did it take to find your First employment? </td>
                                                                <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" id="q1" data-toggle='modal' data-target='#myModal'/></td>                               

                                                            </tr>
                                                                <tr>
                                                                <td><span>3</span></td>
                                                               
                                                                    <td> Is your current work/job is aligned to your field of education?  </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" id="q2" data-toggle='modal' data-target='#myModal'/></td>                               

                                                                </tr>
                                                                <tr>
                                                                <td><span>4</span></td>
                                                               
                                                                    <td>Location of employment:  </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" id="q3" data-toggle='modal' data-target='#myModal'/></td>                               

                                                                </tr>
                                                                <tr>
                                                                <td><span>5</span></td>
                                                               
                                                                    <td>The classification of your company or institution:  </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" id="q4" data-toggle='modal' data-target='#myModal'/></td>                               

                                                                </tr>
                                                                <tr>
                                                                <td><span>6</span></td>
                                                               
                                                                    <td> Nature of Appointment:  </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" id="q5" data-toggle='modal' data-target='#myModal'/></td>                               

                                                                </tr>
                                                                 <tr>
                                                                <td><span>7</span></td>
                                                               
                                                                    <td> What is your Present Position?   </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" id="q6" data-toggle='modal' data-target='#myModal' /></td>                               

                                                                </tr>
                                                                <tr>
                                                                <td><span>8</span></td>
                                                               
                                                                    <td> How long have you been working in your current company?  </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" id="q7" data-toggle='modal' data-target='#myModal'/></td>                               

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
            <h4 class="modal-title" id="myModalLabel">Poll Statistics</h4>
          </div>
          <div class="modal-body ">
              
           
              
              <div class="chart-horiz">

                <ul class="chart">
                 
                  </ul>
              </div>
              
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-warning" data-dismiss="modal" id="close">Close</button>
            
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
                                "<td> <a class='btn btn-primary btn-sm theatre' data-poll-id='" + o.polls_idpk + "' data-toggle='modal' data-target='#myModal'>View Statistics </a>&nbsp; <a class='btn btn-warning btn-sm deletePoll' data-poll-id='" + o.polls_idpk + "'>Delete Poll </a></td>" +
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


                                        console.log(object);

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

            $("#cboCollege").click(function()  {
               
            });

        //Stats
            $("#employed_stat").click(function () {
                $("#myModalLabel").text("Employment survey statistics.");
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

                        $.each(data, function (i,o) {
                            $(".chart").append(
                                "<li class='current' title='Employed' >" +
                                    "<span class='bar' data-number=" + o.Employed + "></span>" +
                                    "<span class='number'>" + o.Employed + "</span>" +
                                "</li>"+
                                "<li class='current' title='Unemployed' >" +
                                    "<span class='bar' data-number=" + o.Unmployed + "></span>" +
                                    "<span class='number'>" + o.Unmployed + "</span>" +
                                "</li>" +

                                //Q1
                                "<ul>qwe</ul>" +
                                "<li class='current' title='1 to 3 months' >" +
                                    "<span class='bar' data-number=" + o.opt1 + "></span>" +
                                    "<span class='number'>" + o.opt1 + "</span>" +
                                "</li>" +
                                "<li class='current' title='4 to 6 months' >" +
                                    "<span class='bar' data-number=" + o.opt2 + "></span>" +
                                    "<span class='number'>" + o.opt2 + "</span>" +
                                "</li>" +
                                "<li class='current' title='7 months to 1 year' >" +
                                    "<span class='bar' data-number=" + o.opt3 + "></span>" +
                                    "<span class='number'>" + o.opt3 + "</span>" +
                                "</li>" +
                                "<li class='current' title='other' >" +
                                    "<span class='bar' data-number=" + o.opt4 + "></span>" +
                                    "<span class='number'>" + o.opt4 + "</span>" +
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

            $("#q1").click(function () {
                $("#myModalLabel").text("How long did it take to find your First employment?");
                $(".chart").html("");
                $.ajax({
                    type: "post",
                    url: "./statistics-ui.aspx/q1",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (dataOpt) {
                        data = dataOpt.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i, o) {
                            console.log(o.opt1);
                            console.log(o.opt2);
                            console.log(o.opt3);
                            console.log(o.opt4);
                            $(".chart").append(
                                "<li class='current' title='1 to 3 months' >" +
                                    "<span class='bar' data-number=" + o.opt1 + "></span>" +
                                    "<span class='number'>" + o.opt1 + "</span>" +
                                "</li>" +
                                "<li class='current' title='4 to 6 months' >" +
                                    "<span class='bar' data-number=" + o.opt2 + "></span>" +
                                    "<span class='number'>" + o.opt2 + "</span>" +
                                "</li>" +
                                "<li class='current' title='7 months to 1 year' >" +
                                    "<span class='bar' data-number=" + o.opt3 + "></span>" +
                                    "<span class='number'>" + o.opt3 + "</span>" +
                                "</li>" +
                                "<li class='current' title='other' >" +
                                    "<span class='bar' data-number=" + o.opt4 + "></span>" +
                                    "<span class='number'>" + o.opt4 + "</span>" +
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

            $("#q2").click(function () {
                $("#myModalLabel").text("Is your current work/job is aligned to your field of education? ");
                $(".chart").html("");
                $.ajax({
                    type: "post",
                    url: "./statistics-ui.aspx/q2",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (dataOpt) {
                        data = dataOpt.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i, o) {
                            console.log(o.opt1);
                            console.log(o.opt2);
                            $(".chart").append(
                                "<li class='current' title='Yes' >" +
                                    "<span class='bar' data-number=" + o.opt1 + "></span>" +
                                    "<span class='number'>" + o.opt1 + "</span>" +
                                "</li>" +
                                "<li class='current' title='No' >" +
                                    "<span class='bar' data-number=" + o.opt2 + "></span>" +
                                    "<span class='number'>" + o.opt2 + "</span>" +
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

            $("#q3").click(function () {
                $("#myModalLabel").text("Location of employment.");
                $(".chart").html("");
                $.ajax({
                    type: "post",
                    url: "./statistics-ui.aspx/q3",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (dataOpt) {
                        data = dataOpt.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i, o) {
                            console.log(o.opt1);
                            console.log(o.opt2);
                            $(".chart").append(
                                "<li class='current' title='Abroad' >" +
                                    "<span class='bar' data-number=" + o.opt1 + "></span>" +
                                    "<span class='number'>" + o.opt1 + "</span>" +
                                "</li>" +
                                "<li class='current' title='Local' >" +
                                    "<span class='bar' data-number=" + o.opt2 + "></span>" +
                                    "<span class='number'>" + o.opt2 + "</span>" +
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

            $("#q4").click(function () {
                $("#myModalLabel").text("The classification of your company or institution.");
                $(".chart").html("");
                $.ajax({
                    type: "post",
                    url: "./statistics-ui.aspx/q4",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (dataOpt) {
                        data = dataOpt.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i, o) {
                            console.log(o.opt1);
                            console.log(o.opt2);
                            $(".chart").append(
                                "<li class='current' title='Private' >" +
                                    "<span class='bar' data-number=" + o.opt1 + "></span>" +
                                    "<span class='number'>" + o.opt1 + "</span>" +
                                "</li>" +
                                "<li class='current' title='Public' >" +
                                    "<span class='bar' data-number=" + o.opt2 + "></span>" +
                                    "<span class='number'>" + o.opt2 + "</span>" +
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

            $("#q5").click(function () {
                $("#myModalLabel").text("Nature of appointment.");
                $(".chart").html("");
                $.ajax({
                    type: "post",
                    url: "./statistics-ui.aspx/q5",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (dataOpt) {
                        data = dataOpt.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i, o) {
                            console.log(o.opt1);
                            console.log(o.opt2);
                            console.log(o.opt3);
                            $(".chart").append(
                                "<li class='current' title='Regular' >" +
                                    "<span class='bar' data-number=" + o.opt1 + "></span>" +
                                    "<span class='number'>" + o.opt1 + "</span>" +
                                "</li>" +
                                "<li class='current' title='Probation' >" +
                                    "<span class='bar' data-number=" + o.opt2 + "></span>" +
                                    "<span class='number'>" + o.opt2 + "</span>" +
                                "</li>" +
                                "<li class='current' title='Self-employed' >" +
                                    "<span class='bar' data-number=" + o.opt3 + "></span>" +
                                    "<span class='number'>" + o.opt3 + "</span>" +
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

            $("#q6").click(function () {
                $("#myModalLabel").text("What is your present position.");
                $(".chart").html("");
                $.ajax({
                    type: "post",
                    url: "./statistics-ui.aspx/q6",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (dataOpt) {
                        data = dataOpt.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i, o) {
                            console.log(o.opt1);
                            console.log(o.opt2);
                            console.log(o.opt3);
                            console.log(o.opt4);
                            $(".chart").append(
                                "<li class='current' title='Rank and File' >" +
                                    "<span class='bar' data-number=" + o.opt1 + "></span>" +
                                    "<span class='number'>" + o.opt1 + "</span>" +
                                "</li>" +
                                "<li class='current' title='Supervisory Level' >" +
                                    "<span class='bar' data-number=" + o.opt2 + "></span>" +
                                    "<span class='number'>" + o.opt2 + "</span>" +
                                "</li>" +
                                "<li class='current' title='Managerial Level' >" +
                                    "<span class='bar' data-number=" + o.opt3 + "></span>" +
                                    "<span class='number'>" + o.opt3 + "</span>" +
                                "</li>" +
                                "<li class='current' title='Others' >" +
                                    "<span class='bar' data-number=" + o.opt4 + "></span>" +
                                    "<span class='number'>" + o.opt4 + "</span>" +
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

            $("#q7").click(function () {
                $("#myModalLabel").text("How long have you been working in your current company?");
                $(".chart").html("");
                $.ajax({
                    type: "post",
                    url: "./statistics-ui.aspx/q7",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (dataOpt) {
                        data = dataOpt.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i, o) {
                            console.log(o.opt1);
                            console.log(o.opt2);
                            console.log(o.opt3);
                            console.log(o.opt4);
                            $(".chart").append(
                                "<li class='current' title='1 to 6 months' >" +
                                    "<span class='bar' data-number=" + o.opt1 + "></span>" +
                                    "<span class='number'>" + o.opt1 + "</span>" +
                                "</li>" +
                                "<li class='current' title='7 months to 1 year' >" +
                                    "<span class='bar' data-number=" + o.opt2 + "></span>" +
                                    "<span class='number'>" + o.opt2 + "</span>" +
                                "</li>" +
                                "<li class='current' title='1 year to 3 years' >" +
                                    "<span class='bar' data-number=" + o.opt3 + "></span>" +
                                    "<span class='number'>" + o.opt3 + "</span>" +
                                "</li>" +
                                "<li class='current' title='Others' >" +
                                    "<span class='bar' data-number=" + o.opt4 + "></span>" +
                                    "<span class='number'>" + o.opt4 + "</span>" +
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    