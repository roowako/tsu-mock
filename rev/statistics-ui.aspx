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
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/rev/assets/images/TSULOGO.png" Height="55" Width="55" CssClass="img-float-nav" />
                            <h3>&nbsp;&nbsp;&nbsp;Dashboard</h3>
                             <span class="clearfix"></span>
                        </span>
                       
                    </a>

               
                </div>
                <div id="navbar" class="navbar-collapse collapse" > <!---collapse collapse -->
                  
                     <ul class="nav navbar-nav navbar-right">
                          
                        <li>
                            <a href="#">
                                <h4>
                                    <span class="glyphicon glyphicon-home"></span>
                                </h4>
                            

                            </a>

                        </li>
                        <li>
                            <a href="#">
                                <h4>
                                    <span class="glyphicon glyphicon-cog"></span>
                                </h4>
                            

                            </a>

                        </li>
                       
                      </ul>
                    
                </div><!--/.navbar-collapse -->
                </div>
            </nav>-->

            <!-- Start content here -->
            <div class="container-fluid">
                <div class="row">
                    <!--#include file="./includes/sidebar-director.inc"-->

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
                                                 <asp:ListItem Text="All Colleges" />
                                                 <asp:ListItem Text="College 1" />
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
                                                                <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" /></td>                               

                                                            </tr>
                                                                <tr>
                                                                <td><span>3</span></td>
                                                               
                                                                    <td> Is your current work/job is aligned to your field of education?  </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" /></td>                               

                                                                </tr>
                                                                <tr>
                                                                <td><span>4</span></td>
                                                               
                                                                    <td>Location of employment:  </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" /></td>                               

                                                                </tr>
                                                                <tr>
                                                                <td><span>5</span></td>
                                                               
                                                                    <td>The classification of your company or institution:  </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" /></td>                               

                                                                </tr>
                                                                <tr>
                                                                <td><span>6</span></td>
                                                               
                                                                    <td> Nature of Appointment:  </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" /></td>                               

                                                                </tr>
                                                                 <tr>
                                                                <td><span>7</span></td>
                                                               
                                                                    <td> What is your Present Position?   </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" /></td>                               

                                                                </tr>
                                                                 <tr>
                                                                <td><span>8</span></td>
                                                               
                                                                    <td> Further Study : Did you pursue a higher level of Education?  </td>
                                                                    <td><input type="button" class="btn btn-primary btn-sm" value="View statistics" /></td>                               

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
                                
                                $(".table-responsive").append(
                                        
                                    );
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
                $("#myModalLabel").text("Employment Status");
                $(".chart").html("");
                $.ajax({
                    type: "post",
                    url: "./statistics-ui.aspx/empstat",
                   
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (dataOpt) {
                        data = dataOpt.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i,o) {
                            console.log(o.Employed);
                            console.log(o.Unmployed);
                            $(".chart").append(
                                "<li class='current' title='Employed' >" +
                                    "<span class='bar' data-number=" + o.Employed + "></span>" +
                                    "<span class='number'>" + o.Employed + "</span>" +
                                "</li>"+
                                "<li class='current' title='Unemployed' >" +
                                    "<span class='bar' data-number=" + o.Unmployed + "></span>" +
                                    "<span class='number'>" + o.Unmployed + "</span>" +
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
                
            });
    </script>
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    