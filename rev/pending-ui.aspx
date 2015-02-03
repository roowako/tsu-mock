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
                        <h3 class="page-header"><span class="glyphicon glyphicon-home">&nbsp;</span>Pending Surveys</h3>
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
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
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
                                "<td>  " + object.survey_idpk + " </td>" +
                                "<td>  " + object.description + " </td>" +
                                "<td>  " + stringify + " </td>" +
                                "<td>   " + "<a class='btn btn-primary btn-sm theatre' id='" + object.survey_idpk + "' data-poll-title='" + object.description + "'  data-survey-id='" + object.survey_idpk + "'  data-toggle='modal' data-target='#myModal'>View Details </a>" + " </td>" +
                                "<td> " + "<a class='btn btn-success btn-sm'>Approve </a> " + "<a class='btn btn-warning btn-sm'>Reject</a> </td>" +
                               "</tr>"
                                );

                        });

                        $(".theatre").click(function () {
                            $("#placeholderOptions").html("");
                            $("#questionPlaceholder").text($(this).data("poll-question"));
                            $("#myModalLabel").text($(this).data("poll-title"));
                            pollsPK = $(this).data("survey-id");
                          
                            alert(pollsPK);
                            $.ajax({
                                type: "post",
                                url: "./pending-ui.aspx/pullSurveyDetails",
                                data: "{'optFk' :'" + pollsPK + "' }",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (dataOpt) {

                                    optionsArr = dataOpt.d;
                                    optionsArr = jQuery.parseJSON(optionsArr);
                                    
                                    $.each(optionsArr, function (i, pollOpt) {

                                     
                                        $("#placeholderOptions").append(
                                        "<li> "+ pollOpt.survey_question +" </li>"+
                                       "<li> "+ pollOpt.survey_option +" </li>"
                                         );

                                    });


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
