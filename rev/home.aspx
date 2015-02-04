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

           <div class="container-fluid">
                <div class="row">
                   <!--#include file="./includes/sidebar-home.inc"-->
                     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                        
                         <div class="row">
                             <div class="col-xs-4">
                                 <h3 class="page-header"><span class="glyphicon glyphicon-home">&nbsp;</span>Timeline</h3>
                             </div>
                             <div class="col-xs-4">
                                
                             </div>
                             <div class="col-xs-2">
                                 
                             </div>
                              <div class="col-xs-2">
                                 <ul class="right-action-buttons">
                                   <li><a href="#"><span class="glyphicon glyphicon-cog"></span> </a></li>
                                   <li><a href="#"><span class="glyphicon glyphicon-home"></span> </a></li>
                                  </ul>
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
                              <h4 class="header-padded"><span class="glyphicon glyphicon-pencil minified"></span>&nbsp; Poll Questions</h4>
                              <div class="row">
                                  <table class="table table-hover">
                                        <tr>
                                            <td><span class="glyphicon glyphicon-th-list"></span></td>  
                                            <td>Poll Title</td>
                                            <td>Status</td>
                                            <td></td>
                                        </tr>
                                                    
                                    </table>
                                  
                              </div>
                            </div>
                            <!-- end right-side -->

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>

     //Modal form
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
          </div>
          <div class="modal-body">
              <h4>Poll Question</h4>
              <p id="questionPlaceholder"></p>
           
              <br />
              <h4>Poll Options</h4>
              <ul id="placeholderOptions" class="bulletsNone">
                 
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
                    url: "./home.aspx/pullFromServer",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",


                    success: function (r) {
                        //Response from server side 
                        data = r.d
                        console.log(r)
                        data = jQuery.parseJSON(data);
                        $.each(data, function (i, object) {


                            object.status = "active";
                            $(".table").append(
                                "<tr>" +
                                "<td>  " + object.polls_idpk + " </td>" +
                                "<td>  " + object.description + " </td>" +
                                "<td>  " + object.status + " </td>" +
                                "<td>   " + "<a class='btn btn-success btn-sm theatre' id='" + object.polls_idpk + "' data-poll-title='" + object.description + "' data-poll-question='" + object.question + "' data-poll-id='" + object.polls_idpk + "' data-toggle='modal' data-target='#myModal'>View Details and participate </a>" + " </td>" +
                                "</tr>"
                                );

                        });

                        $(".theatre").click(function () {
                            $("#placeholderOptions").html("");
                            $("#questionPlaceholder").text($(this).data("poll-question"));
                            $("#myModalLabel").text($(this).data("poll-title"));
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
                                         "<li><input type='radio' name='polloptions + "+ pollOpt.polls_idfk +"' value=" + replaced + "> &nbsp; " + replaced + " </li>"
                                         );

                                    });


                                    console.log(dataOpt.d);
                                }
                            });

                        });

                    }
                });
            }

        
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
                    } else {
                        data = announceReturn.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i, object) {

                            $(".announcementHolder").append(

                                "<div class='row'>" +
                                    "<div class='col-xs-12 border-enabled'>" +
                                        "<h4 class='header-padded'>" + object.account_idfk + " </h4>" +
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
            $.ajax({
                type: "post",
                url: "home.aspx/pullPoll",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (pollResponse) {


                }
            });
      
    </script>
</body>
</html>
