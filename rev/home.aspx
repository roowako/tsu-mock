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
                    <a class="navbar-brand extended-brand " href="./home.aspx">
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

           <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3 col-md-2 sidebar">  <!--side-bar -->
	                        <ul class="nav nav-sidebar">
		                        <li>
			                        <a href="#" >
				                        <asp:Image ID="Image2" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="75" Width="75" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />          
			                        </a>
		                        </li>
                            <li>    
                                <a href="./alumni-profile.aspx"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a>
                            </li>
		  		                <li><a href="./home.aspx" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline</a></li>
		                        <li><a href="./messaging-ui-alumni.aspx" ><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Messages</a></li>
		                        <li><a href="#" id="alumni_logout" runat="server"><span class="glyphicon glyphicon-off" ></span>&nbsp;&nbsp;Log out</a></li>
                                <li>
                                    <asp:TextBox ID="account_idpk" runat="server"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:TextBox ID="college_idpk" runat="server"></asp:TextBox>
                                </li>
                                <li>
                                    <asp:TextBox ID="college_desc" runat="server"></asp:TextBox>
                                </li>
                            </ul>
                    </div>

                     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                         <div class="row">
                             <div class="col-xs-4">
                                 <h3 class="page-header"><span class="glyphicon glyphicon-home">&nbsp;</span>Timeline</h3>
                             </div>
                             <div class="col-xs-4">
                                 <div class="form-group">
                                     <input type="text" placeholder="Search for alumni" name=""  class="form-control" id="searching"/>
                                     <div class="resWrapper"></div>
                                 </div>
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
             <button type="button" class="btn btn-success btnPollAns" data-dismiss="modal">Submit</button>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
     <script type="text/javascript" src="./js/home-search.js"></script>
    <script type="text/javascript" src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
    <script>
        var college_id = $("#college_idpk").val();
        var college_desc = $("#college_desc").val();

        var myParam = location.search.split('id=')[1];
        $("#alumni_name").text(myParam);

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

                                    console.log(dataOpt.d);
                                }
                            });

                        });

                        $(".btnPollAns").click(function (e) {
                            e.preventDefault();
                            var pollAns = $("input[name='polloptions']:checked").val();
                            var pollFk = $(this).data("poll-idpk");
                            var account_id = $("#account_idpk").val();
                          
                            $.ajax({
                                type: "post",
                                url: "./home.aspx/pushToPollDataStats",
                                data: "{'poll_idpk' :'" + pollsPK + "','poll_option_idfk':'" + pollAns + "','account_idfk':'" +account_id +"' }",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (dataOpt) {
                                    console.log(dataOpt.d);
                                }

                            });
                            
                        });

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
                            if (object.target_id == 0) {
                                $(".announcementHolder").append(
                                "<div class='row'>" +
                                    "<div class='col-xs-12 border-enabled'>" +
                                        "<h4 class='header-padded'>" + "DIRECTOR" + " </h4>" +
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
                            }
                            else {
                                $(".announcementHolder").append(
                                "<div class='row'>" +
                                    "<div class='col-xs-12 border-enabled'>" +
                                        "<h4 class='header-padded'>" + college_desc + " </h4>" +
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
                            }
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
            
    </form>

     </body>
</html>
