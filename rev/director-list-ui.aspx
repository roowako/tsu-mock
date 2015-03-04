<%@ Page Language="VB" AutoEventWireup="false" CodeFile="director-list-ui.aspx.vb" Inherits="rev_director_list_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Coordinator List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
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
		                    <li><a href="#" id="alumni_logout" runat="server"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;Log out</a></li>
                            <li>
                                <asp:TextBox ID="account_idpk" runat="server" ></asp:TextBox>
                            </li>
	                    </ul>
                    </div>
                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background:#fff;">
                        
                        <div class="row">
                            <div class="col-xs-4">
                                  <h3 class="page-header"><span class="glyphicon glyphicon-option-vertical">&nbsp;</span>List of College Coordinators</h3>
                                 
                             </div>
                             <div class="col-xs-3">
                                <div id="loaderImage"  class="ajax-loader"></div>
                             </div>
                             
                        </div>

                         <div class="row placeholders">
                             
                             <br />
                             <!-- start main-content -->
                             <div class="col-xs-12 col-sm-12  ">
                                 <div class="row" >
                                     <div class="col-xs-12 table-responsive">
                                               
                                        <table class="table" id="accountTable" style="cursor:pointer;">
                                            <thead>
                                            <tr>
                                                <th>College</th>
                                                <th>Coordinator's Userame</th>
                                                <th>Password</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                             </div>
                              
                           


                     </div>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script type="text/javascript" src="./js/bindDelay.js"></script>
    <script type="text/javascript" src="./js/home-search.js"></script>
    <script type="text/javascript" src="./js/json2.js"></script>
    <script>
        $(document).ready(function () {
            var id;

                 $.ajax({
                    
                     type: "post",
                     url: "director-list-ui.aspx/pullColleges",
                     processData: false,
                     traditional: true,
                     contentType: "application/json; charset=utf-8",
                     success: function (serverResponse) {
                         data = serverResponse.d;
                         data = jQuery.parseJSON(data);
                         $.each(data, function (i, object) {
                             $("#defaultUsername ").append(
                                 "<option value='"+ object.description + "' data-id='"+ object.college_idpk +"'> " + object.description +  "</option>"
                                 );
                             console.log(object.description);
                         });
                     }
                 });

                $.ajax({
                    type: "post",
                    url: "director-list-ui.aspx/pullUsers",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (serverResponse) {
                        data = serverResponse.d;
                        data = jQuery.parseJSON(data);

                        $.each(data, function (i, object) {
                            var accStatus = object.account_status;
                            var mod = object.password;

                            if (accStatus == "0") {
                                var ext = ("<tr class=''>" +
                                            "<td> " + object.student_id + "  </td>" +
                                            "<td> " + object.student_id + "  </td>" +
                                            "<td> " + mod + "  </td>" +
                                            "<td style='text-align:right;'>" +
                                                "<div class='btn-group' role='group'>" +
                                                    "<button class='btn btn-success btn-sm activate_coordinator' value='Activate Account' data-id='" + object.account_idpk + "'> Activate &nbsp;<span class='glyphicon glyphicon-ok-circle'></span></button>" +
                                                    "<button class='btn btn-danger btn-sm default_coordinator' value='Restore Default' data-id='" + object.account_idpk + "'> Restore &nbsp;<span class='glyphicon glyphicon-repeat'></span></button>" +
                                                "</div>" +
                                            "</td>" +

                                            "</tr>");
                            }
                            else {
                                var ext = ("<tr class=''>" +
                                            "<td> " + object.student_id + "  </td>" +
                                            "<td> " + object.student_id + "  </td>" +
                                            "<td > " + mod + "  </td>" +
                                            "<td style='text-align:right;'>" +
                                                "<div class='btn-group' role='group'>" +
                                                    "<button class='btn btn-warning btn-sm deactivate_coordinator' value='Deactivate Account ' data-id='" + object.account_idpk + "'>Deactivate &nbsp;<span class='glyphicon glyphicon-ban-circle'></span></button>" +
                                                   "<button class='btn btn-danger btn-sm default_coordinator' value='Restore Default' data-id='" + object.account_idpk + "'>Restore &nbsp;<span class='glyphicon glyphicon-repeat'></span></button>" +
                                                "</div>" +
                                            "</td>" +
                                            
                                            "</tr>");        
                            }

                            $("#accountTable tbody").append(
                                  ext +
                                "</tbody>"
                             );
                        });

                        //functions
                        $(".activate_coordinator").click(function (e) {
                            e.preventDefault();
                            id = $(this).data("id");
                            console.log(id);
                            $.ajax({
                                type: "post",
                                url: "director-list-ui.aspx/activate_coordinator",
                                data: "{'id':'" + id + "'}",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (serverResponse) {
                                    alert(serverResponse.d);
                                    window.location.reload(true);
                                }
                            });
                        });

                        $(".deactivate_coordinator").click(function (e) {
                            e.preventDefault();
                            id = $(this).data("id");
                            console.log(id);
                            $.ajax({
                                type: "post",
                                url: "director-list-ui.aspx/deactivate_coordinator",
                                data: "{'id':'" + id + "'}",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (serverResponse) {
                                    alert(serverResponse.d);
                                    window.location.reload(true);
                                }
                            });
                        });

                        $(".default_coordinator").click(function (e) {
                            e.preventDefault();
                            id = $(this).data("id");

                            $.ajax({
                                type: "post",
                                url: "director-list-ui.aspx/default_coordinator",
                                data: "{'id':'" + id + "'}",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (serverResponse) {
                                    alert(serverResponse.d);
                                    window.location.reload(true);
                                }
                            });
                        });

                    }
                });            
        });
    </script>
</body>
</html>
