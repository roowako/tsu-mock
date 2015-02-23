<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pending-ui.aspx.vb" Inherits="rev_pending_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pending Survey</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/sidebar-theme.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
</head>
<body onload="pullFromServer()">
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
                        <div class="row">
                            <div class="col-xs-4">
                                 <h3 class="page-header"><span class="glyphicon glyphicon-home">&nbsp;</span>Pending Surveys</h3>
                             </div>
                             <div class="col-xs-2">
                                
                             </div>
                             <div class="col-xs-3">
                                 
                             </div>
                              
                        </div>
                        
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-10 placeholder  ">
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="table-responsive" style="border-top:0px !important;">
                                            <table class="table table-hover" style="border-top:0px !important;" id="surveyPlaceholder" >
                                                <thead>
                                                <tr>
                                                    <td><span class="glyphicon glyphicon-th-list"></span></td>
                                                    <td>Survey Title</td>
                                                
                                                    <td>Current Status</td>
                                                    <td>View Survey Details</td>
                                                    <td></td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                
                                                </tbody>          
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                 
                              
                            
                              
                              
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                            <div class="col-xs-6 col-sm-1 placeholder"> </div>
                             <!-- end spacer -->
                           

                            <!-- start right-side -->
                            
                            <!-- end right-side -->

                        </div>
                    </div>

                </div>
            </div>

            <!-- End content here -->

        </div>
    </form>
    //ModalForm
     <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
          </div>
          <div class="modal-body">
              <ul id="placeholderOptions">
                 
              </ul>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
   <script type="text/javascript" src="./js/bindDelay.js"></script>
    <script type="text/javascript" src="./js/home-search.js"></script>
    <script type="text/javascript" src="./js/json2.js"></script>
    <script>
     

            function pullFromServer() {

                $.ajax({
                    type: "post",
                    url: "./pending-ui.aspx/pullFromServer",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",


                    success: function (r) {
                        //Response from server side 
                        data = r.d
                        console.log(r)
                        data = jQuery.parseJSON(data);
                        $.each(data, function (i, object) {
                            $.ajax({

                            });
                            if (object.status == 1) {
                                var stringify = "Active";
                            } else {
                                stringify = "Pending";
                            }
                            object.status = "active";
                            $("#surveyPlaceholder tbody").append(
                                "<tr>" +
                                "<td>  " + object.polls_idpk + " </td>" +
                                "<td>  " + object.description + " </td>" +
                                "<td>  " + stringify + " </td>" +
                                "<td>   " + "<a class='btn btn-primary btn-sm theatre' id='" + object.polls_idpk + "' data-poll-title='" + object.description + "'  data-survey-id='" + object.polls_idpk + "'  data-toggle='modal' data-target='#myModal'>View Details </a>" + " </td>" +
                                "<td> " + "<a class='btn btn-success btn-sm approveSurvey' data-survey-id='" + object.polls_idpk + "'>Approve </a> " + "<a class='btn btn-warning btn-sm rejectSurvey' data-survey-id='" + object.polls_idpk + "'>Reject</a> </td>" +
                               "</tr>"
                                );

                        });

                        //View Detailss
                        $(".theatre").click(function () {
                            $("#placeholderOptions").html("");
                            $("#questionPlaceholder").text($(this).data("poll-question"));
                            $("#myModalLabel").text($(this).data("poll-title"));
                            pollsPK = $(this).data("survey-id");


                            $.ajax({
                                type: "post",
                                url: "./pending-ui.aspx/pullPollOptions",
                                data: "{'optFk' :'" + pollsPK + "' }",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (dataOpt) {

                                    optionsArrx = dataOpt.d;
                                    optionsArr = jQuery.parseJSON(optionsArrx);

                                    $.each(optionsArr, function (i, pollOpt) {
                                        var replaced = pollOpt.option_description.replace("-", ",");
                                        $("#placeholderOptions").append(
                                      
                                        "<li> " + replaced + " </li>"
                                         );
                                    });


                                    console.log(dataOpt.d);
                                }
                            });

                        });

                        //Approve Survey
                        $(".approveSurvey").click(function () {
                           
                            pollsPK = $(this).data("survey-id");


                            $.ajax({
                                type: "post",
                                url: "./pending-ui.aspx/approveSurvey",
                                data: "{'optFk' :'" + pollsPK + "' }",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (dataOpt) {
                                    alert(dataOpt.d);
                                    window.location.reload(true);
                                    console.log(dataOpt.d);
                                }
                            });

                        });
                        $(".rejectSurvey").click(function () {

                            pollsPK = $(this).data("survey-id");


                            $.ajax({
                                type: "post",
                                url: "./pending-ui.aspx/rejectSurvey",
                                data: "{'optFk' :'" + pollsPK + "' }",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (dataOpt) {
                                    alert(dataOpt.d);
                                    window.location.reload(true);
                                    console.log(dataOpt.d);
                                }
                            });

                        });
                    }
                });
            }
    
    </script>
</body>
</html>
