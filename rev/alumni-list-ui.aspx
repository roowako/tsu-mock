<%@ Page Language="VB" AutoEventWireup="false" CodeFile="alumni-list-ui.aspx.vb" Inherits="rev_alumni_list_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Alumni List</title>
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
		                    <li><a href="#" id="alumni_logout" runat="server"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;Log out</a></li>
                            <li>
                                <asp:TextBox ID="account_idpk" runat="server" ></asp:TextBox>
                            </li>
	                    </ul>
                    </div>


                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                       
                        <div class="row">
                            <div class="col-sm-4"> <h3 class="page-header"><span class="glyphicon glyphicon-list-alt">&nbsp;</span>List of Alumni</h3>
                                 <h5>Color Legend : <a href="#" class="btn btn-success btn-sm" style="height:18px;border-radius:0px;"> </a> &nbsp;Alumni &nbsp;<a href="#" class="btn btn-warning btn-sm" style="height:18px;border-radius:0px;"> </a> Graduating</h5> 
                                <br /><br />
                            </div>
                            <div class="col-sm-1">
                                <div id="loaderImage"></div>
                            </div>
                            <div class="col-sm-5">
                                
                              
                            </div>
                            <div class="col-xs-1">
                                 
                             </div>
                        </div>
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-12 placeholder ">
                             
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="input-group">
                                            <div class="input-group-addon">Sort by:</div>
                                             <asp:DropDownList ID="sortBy" runat="server" CssClass="form-control" ClientIDMode="Static">
                                             <asp:ListItem Text="All" Value="all"/>
                                             <asp:ListItem Text="Alumni" Value="alumni"/>
                                             <asp:ListItem Text="Graduating" Value="graduating"/>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-xs-5">
                                         <asp:DropDownList ID="filterCollege" runat="server" CssClass="form-control">
                                             <asp:ListItem  Text="COLLEGE(ALL)" Value="allColleges" data-id="0"/>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-xs-2">
                                         <asp:DropDownList ID="filterYear" runat="server" CssClass="form-control" ClientIDMode="Static">
                                             <asp:ListItem Text="YEAR(ALL)" Value="all" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                               
                                <div class="row">
                                    <br />
                                    <div class="col-xs-2">
                                         <input id="btnPrintData" type="button" class="btn btn-sm btn-success" value="Print Data"/>
                                    </div>                                
                                </div>

                                <br />
                                    
                                    <div class="table-responsive">
                                        <table class="table table-hover searchableTable" id="searchableTable">
                                            <thead>
                                                <tr>
                                                    <td><span class="glyphicon glyphicon-th-list"></span></td>  
                                                    <td><b>Fullname</b></td>
                                                    <td><b>College</b></td>
                                                    <td><b>Course</b></td>
                                                    <td><b>Graduated</b></td>
                                                    <td></td>
                                                </tr>
                                            </thead>
                                            <tbody>
                                               
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                        <ul class="pagination  pagination-centered" id="myPager"></ul>
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

        </div>
        </div>
    </form>

   
<div class="modal fade bs-example-modal-lg  fullNamePlaceholder" tabindex="-1" role="dialog" aria-labelledby="ddd" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
        <div class="modal-body">
         <div class="table-responsive">
            <table class="table table-hover" id="accountInfoPlaceholder">
                <thead>
                <tr>
                    <td><span class="glyphicon glyphicon-th-list"></span></td>  
                    <td>Student #</td>
                    <td>Adress</td>
                    <td>Contact Number</td>
                    <td>E-mail Address</td>
                    <td>Birthday</td>
                    <td>Citizenship</td>
                    <td>Religion</td>
                    <td>Marital Status</td>
                    <td>Gender</td>
                    <td>Graduated</td>
                </tr>
                </thead>       
                <tbody>

                </tbody>                           
            </table>
        </div>
      </div>
      <div class="modal-footer">
          <div class="container">
              <div class="row">
                  
                  <div class="col-xs-9">
                      <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Close</button>
                  </div>
              </div>
          </div>
      </div>
    </div>
  </div>
</div>



  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel2" style="text-transform:capitalize;">Modal title</h4>
          </div>
          <div class="modal-body">
             
              
              <ul id="messages">
                 
              </ul>
          </div>
          <div class="modal-footer">
              <div class="container">
                  <div class="row">
                      <div class="col-xs-6">
                          <textarea class="form-control" rows="1" id="replyMessage"></textarea> &nbsp;
                          
                      </div>
                      
                  </div>
                  <div class="row ">
                      <div class="col-xs-2 appBtn">
                           
                     
                      </div>
                  </div>
              </div>
          </div>
        </div>
      </div>
    </div>


    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script type="text/javascript" src="./js/search.js"></script>
    <script type="text/javascript" src="./js/ajax-loader.js"></script>
    <script type="text/javascript" src="./js/paginate.js"></script>
    <script type="text/javascript" src="./js/bindDelay.js"></script>
    <script type="text/javascript" src="./js/home-search.js"></script>
    <script>
        $(document).ready(function () {
            $("#btnPrintData").click(function () {
                var datatoprint = document.getElementById('searchableTable');
                newWin = window.open("");
                newWin.document.write(datatoprint.outerHTML);
                newWin.print();
                newWin.close();
            });
        });
    </script>

    <script>
        $(document).ready(function () {

            sortBy = $("#sortBy option:selected").val();
            var sess_id = $("#account_idpk").val();

            //Fetch colleges
            $.ajax({

                type: "post",
                url: "alumni-list-ui.aspx/pullColleges",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (serverResponse) {
                    data = serverResponse.d;
                    data = jQuery.parseJSON(data);
                    $.each(data, function (i, object) {
                        $("#filterCollege").append(

                            "<option value='" + object.description + "' data-id='" + object.college_idpk + "'> " + object.description + "</option>"
                            );
                        console.log(object.description);
                    });
                }
            });

            var sortColleges;

            //Fetch all dropdown list colleges on load
            if (sortBy == "all") {
                $("#accountInfoPlaceholder tbody ").html("");
                // Parameter onload : ALL RECORDS
                $.ajax({
                    type: "post",
                    url: "alumni-list-ui.aspx/pullAll",
                    data: "{'sortBy':'" + sortBy + "'}",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {

                        $("#loaderImage").hide();

                        data = response.d;
                        data = jQuery.parseJSON(data);
                        p = data.length - 2;
                        console.log(p);

                        $.each(data, function (i, o) {
                          var fn =  o.given_name + "  " + o.middle_name + " " + o.family_name ;
                            if (o.userlevel_idfk == 1) {
                                var mod = ("<tr class='success'>" +
                                                "<td> " + o.account_idpk + " </td>" +
                                                "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                                "<td> " + o.collegeDes + " </td>" +
                                                "<td>" + o.courseDes + " </td>" +
                                                "<td>"+ o.year_graduated +"</td>" +
                                                "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'> View info </a> </td>" +
                                                "<td> <a class='btn btn-primary btn-sm uid' data-toggle='modal' data-id='" + o.account_idpk + "' data-target='#myModal' data-name='" + fn + "' > Message </a> </td>" +
                                            "</tr>");
                            } else {
                                var mod = ("<tr class='warning'>" +
                                                "<td> " + o.account_idpk + " </td>" +
                                                "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                                "<td> " + o.collegeDes + " </td>" +
                                                "<td>" + o.courseDes + " </td>" +
                                                "<td>" + o.year_graduated + "</td>" +
                                                "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'> View info </a> </td>" +
                                                "<td> <a class='btn btn-primary btn-sm uid' data-toggle='modal' data-id='" + o.account_idpk + "' data-target='#myModal' data-name='" + fn + "' > Message </a> </td>" +
                                            "</tr>");
                            }
                            

                            $(".searchableTable tbody").append(
                                    mod
                                );
                        });
                        $(".viewAccountInfo").click(function () {
                            $(".modal-body").css("display", "block");
                            accId = $(this).data("account-id");
                            $("#accountInfoPlaceholder tbody ").html("");
                            $.ajax({
                                type: "post",
                                url: "alumni-list-ui.aspx/fetchAccountInfo",
                                data: "{'accId':'" + accId + "'}",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (approvalResponse) {
                                    response = approvalResponse.d;
                                    response = jQuery.parseJSON(response);
                                    $.each(response, function (i, o) {
                                        console.log(o.student_id);


                                        $("#myModalLabel").text(o.given_name + "  " + o.middle_name + " " + o.family_name);


                                        $(".update-sudnumber").attr("data-id", o.account_idpk);
                                        if (o.student_id == "") {
                                            $("#studNumberPlacer").removeAttr("disabled");
                                            $(".update-sudnumber").removeAttr("disabled");
                                        } else {
                                            $(".update-sudnumber").attr("disabled", "disabled");
                                            $("#studNumberPlacer").attr("disabled", "disabled");
                                            $("#studNumberPlacer").val(o.student_id);
                                        }
                                        $("#accountInfoPlaceholder tbody").append(
                                                "<tr>" +
                                                    "<td> " + o.account_idpk + " </td>" +
                                                    "<td> " + o.student_id + " </td>" +
                                                    "<td> " + o.address + " </td>" +
                                                    "<td> " + o.telephone_number + " </td>" +
                                                    "<td> " + o.email_address + " </td>" +
                                                    "<td> " + o.formatedB + " </td>" +
                                                    "<td> " + o.citizenship + " </td>" +
                                                    "<td> " + o.religion + " </td>" +
                                                    "<td> " + o.marital_status + " </td>" +
                                                    "<td> " + o.gender + " </td>" +
                                                    "<td> " + o.year_graduated + " </td>" +
                                                "</tr>"
                                            );
                                    });
                                }
                            });
                        });

                        $(".uid").click(function () {                                                   
                            $(".resWrapper").html("");
                            $(".resWrapper").removeClass("revealWrap");
                            $(".display").css("visibility", "hidden");                           
                            $(".appBtn").html("");
                            $("#messages").html("");
                            $("#myModalLabel2").text("");
                            $("#myModalLabel2").text($(this).data("name"));
                            $(".modal-body").css("display", "none");

                            name = "";

                            $(".appBtn").append(
                                    '<button type="button" class="btn btn-success btn-sm send" id="btnSend" style="float:left;">Send</button>' +
                                    '<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal" style="float:right;margin-right:50px;">Close</button>')
                            var sess_id = $("#account_idpk").val();
                            account_idfk = $(this).data("id");
                         
                            $("#btnSend").click(function (e) {
                                e.preventDefault();
                                var sess_id = $("#account_idpk").val();
                                var message = $("#replyMessage").val();
                                var sendTo = account_idfk;

                                $.ajax({
                                    type: "post",
                                    url: "./messaging-ui-alumni.aspx/pushMessages",
                                    data: "{'message':'" + message + "','actor_id':'" + sess_id + "','send_to':'" + sendTo + "'}",
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    async: true,
                                    success: function (r) {
                                        $("#actor-message").val("");
                                        $("#searching").val("");
                                        alert("Message sent.");
                                        window.location.reload(true);
                                    }
                                });
                            });
                            console.log(account_idfk);
                        });
                        console.log(response.d);
                    }
                });
            }

            $("#sortBy").change(function () {
                sortBy = $("#sortBy option:selected").val();
                $("#accountInfoPlaceholder tbody ").html("");
                $("#filterCollege").html();
                $("#filterCollege").val($("#filterCollege option:first").val());
                $("#filterYear").val($("#filterYear option:first").val());
                var legend;

                if (sortBy == "alumni") {
                    $("#filterCollege").html();
                    $("#filterCollege").val($("#filterCollege option:first").val());
                    $("#filterYear").val($("#filterYear option:first").val());
                    console.log(sortColleges);
                    $("#accountInfoPlaceholder tbody ").html("");

                    legend = "success";
                } else if (sortBy == "graduating") {
                    $("#filterCollege").html();
                    $("#filterCollege").val($("#filterCollege option:first").val());
                    $("#filterYear").val($("#filterYear option:first").val());
                    $("#accountInfoPlaceholder tbody ").html("");
                    legend = "warning";
                } else {
                    $("#accountInfoPlaceholder tbody ").html("");
                }

                $("#searchableTable tbody").html("");
                console.log(sortBy);
                $.ajax({
                    type: "post",
                    url: "alumni-list-ui.aspx/pullAll",
                    data: "{'sortBy':'" + sortBy + "'}",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {

                        data = response.d;
                        data = jQuery.parseJSON(data);

                        p = data.length - 2;

                        $.each(data, function (i, o) {
                            var fn = o.given_name + "  " + o.middle_name + " " + o.family_name;
                            if (o.userlevel_idfk == 1) {
                                var mod = ("<tr class='success'>" +
                                                "<td> " + o.account_idpk + " </td>" +
                                                "<td> " + fn + " </td>" +
                                                "<td> " + o.collegeDes + " </td>" +
                                                "<td>" + o.courseDes + "</td>" +
                                                "<td>"+ o.year_graduated+"</td>" +
                                                "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg' > View info </a> </td>" +
                                                "<td> <a class='btn btn-primary btn-sm uid' data-toggle='modal' data-id='" + o.account_idpk + "' data-target='#myModal' data-name='" + fn + "' > Message </a> </td>" +

                                            "</tr>");

                            } else {
                                var mod = ("<tr class='warning'>" +
                                            "<td> " + o.account_idpk + " </td>" +
                                            "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                            "<td> " + o.collegeDes + " </td>" +
                                            "<td>" + o.courseDes + "</td>" +

                                            "<td>" + o.year_graduated + "</td>" +
                                            "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg' > View info </a> </td>" +
                                             "<td> <a class='btn btn-primary btn-sm uid' data-toggle='modal' data-id='" + o.account_idpk + "' data-target='#myModal' data-name='" + fn + "' > Message </a> </td>" +
                                        "</tr>");
                            }
                            

                            $(".searchableTable tbody").append(
                                    mod
                                );
                        });
                        $(".viewAccountInfo").click(function () {
                            $(".modal-body").css("display", "block");
                            accId = $(this).data("account-id");
                            $("#accountInfoPlaceholder tbody ").html("");
                            $.ajax({
                                type: "post",
                                url: "alumni-list-ui.aspx/fetchAccountInfo",
                                data: "{'accId':'" + accId + "'}",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (approvalResponse) {
                                    response = approvalResponse.d;
                                    response = jQuery.parseJSON(response);
                                    $.each(response, function (i, o) {
                                        console.log(o.student_id);


                                        $("#myModalLabel").text(o.given_name + "  " + o.middle_name + " " + o.family_name);


                                        $(".update-sudnumber").attr("data-id", o.account_idpk);
                                        if (o.student_id == "") {
                                            $("#studNumberPlacer").removeAttr("disabled");
                                            $(".update-sudnumber").removeAttr("disabled");
                                        }
                                        else {
                                            $(".update-sudnumber").attr("disabled", "disabled");
                                            $("#studNumberPlacer").attr("disabled", "disabled");
                                            $("#studNumberPlacer").val(o.student_id);
                                        }

                                        $("#accountInfoPlaceholder tbody").append(

                                                "<tr>" +
                                                    "<td> " + o.account_idpk + " </td>" +
                                                    "<td> " + o.student_id + " </td>" +
                                                    "<td> " + o.address + " </td>" +
                                                    "<td> " + o.telephone_number + " </td>" +
                                                    "<td> " + o.email_address + " </td>" +
                                                    "<td> " + o.formatedB + " </td>" +
                                                    "<td> " + o.citizenship + " </td>" +
                                                    "<td> " + o.religion + " </td>" +
                                                    "<td> " + o.marital_status + " </td>" +
                                                    "<td> " + o.gender + " </td>" +
                                                    "<td> " + o.year_graduated + "</td>" +
                                                "</tr>"
                                            );
                                    });
                                }
                            });
                        });

                        $(".uid").click(function () {
                            $(".resWrapper").html("");
                            $(".resWrapper").removeClass("revealWrap");
                            $(".display").css("visibility", "hidden");

                            $(".appBtn").html("");
                            $("#messages").html("");
                            $("#myModalLabel2").text("");
                            $("#myModalLabel2").text($(this).data("name"));
                            $(".modal-body").css("display", "none");
                            name = "";
                            $(".appBtn").append(
                                    '<button type="button" class="btn btn-success btn-sm send" id="btnSend" style="float:left;">Send</button>' +
                                    '<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal" style="float:right;margin-right:50px;">Close</button>')
                            var sess_id = $("#account_idpk").val();
                            account_idfk = $(this).data("id");

                            $("#btnSend").click(function (e) {
                                e.preventDefault();
                                var sess_id = $("#account_idpk").val();
                                var message = $("#replyMessage").val();
                                var sendTo = account_idfk;
                                $.ajax({
                                    type: "post",
                                    url: "./messaging-ui-alumni.aspx/pushMessages",
                                    data: "{'message':'" + message + "','actor_id':'" + sess_id + "','send_to':'" + sendTo + "'}",
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    async: true,
                                    success: function (r) {
                                        $("#actor-message").val("");
                                        $("#searching").val("");
                                        alert("Message sent.");
                                        window.location.reload(true);
                                    }
                                });
                            });
                            console.log(account_idfk);
                        });
                        console.log(response.d);
                    }
                });
            });


            //Bind search function on keyup
            $("#q").bind("keyup", function (event) {
                $(this).search(event);
            });
        });


    </script>
    <script>
        //Filter by college
        $("#filterCollege").change(function () {
            var sortColleges = $("#filterCollege option:selected").attr("data-id");
            sortBy = $("#sortBy option:selected").val();
            $("#filterYear").val($("#filterYear option:first").val());
            $(".searchableTable tbody").html("");


            $.ajax({
                type: "post",
                url: "alumni-list-ui.aspx/filterView",
                data: "{'sortBy':'" + sortBy + "','college_id':'" + sortColleges + "'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    if (response.d == "[]") { $(".searchableTable tbody").html("No result."); }
                    data = response.d;
                    data = jQuery.parseJSON(data);
                    $.each(data, function (i, o) {
                        var fn = o.given_name + "  " + o.middle_name + " " + o.family_name;
                        if (o.userlevel_idfk == 1) {
                            var mod = ("<tr class='success'>" +
                                            "<td> " + o.account_idpk + " </td>" +
                                            "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                            "<td> " + o.collegeDes + " </td>" +
                                            "<td>" + o.courseDes + "</td>" +
                                            "<td>" + o.year_graduated + "</td>" +
                                            "<td></td>" +
                                            "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg' > View info </a> </td>" +
                                            "<td> <a class='btn btn-primary btn-sm uid' data-toggle='modal' data-id='" + o.account_idpk + "' data-target='#myModal' data-name='" + fn + "' > Message </a> </td>" +

                                       "</tr>");

                        } else {
                            var mod = ("<tr class='warning'>" +
                                        "<td> " + o.account_idpk + " </td>" +
                                        "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                        "<td> " + o.collegeDes + " </td>" +
                                        "<td>" + o.courseDes + "</td>" +
                                        "<td>" + o.year_graduated + "</td>" +
                                        "<td></td>" +
                                        "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg' > View info </a> </td>" +
                                         "<td> <a class='btn btn-primary btn-sm uid' data-toggle='modal' data-id='" + o.account_idpk + "' data-target='#myModal' data-name='" + fn + "' > Message </a> </td>" +

                                    "</tr>");
                        }

                        $(".searchableTable tbody").append(
                                        mod
                                    );

                    });

                    //Theatre
                    $(".viewAccountInfo").click(function () {
                        $(".modal-body").css("display", "block");
                        accId = $(this).data("account-id");
                        $("#accountInfoPlaceholder tbody ").html("");
                        $.ajax({
                            type: "post",
                            url: "alumni-list-ui.aspx/fetchAccountInfo",
                            data: "{'accId':'" + accId + "'}",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (approvalResponse) {
                                response = approvalResponse.d;
                                response = jQuery.parseJSON(response);
                                $.each(response, function (i, o) {
                                    console.log(o.student_id);


                                    $("#myModalLabel").text(o.given_name + "  " + o.middle_name + " " + o.family_name);


                                    $(".update-sudnumber").attr("data-id", o.account_idpk);
                                    if (o.student_id == "") {
                                        $("#studNumberPlacer").removeAttr("disabled");
                                        $(".update-sudnumber").removeAttr("disabled");
                                    } else {
                                        $(".update-sudnumber").attr("disabled", "disabled");
                                        $("#studNumberPlacer").attr("disabled", "disabled");
                                        $("#studNumberPlacer").val(o.student_id);
                                    }
                                    $("#accountInfoPlaceholder tbody").append(

                                            "<tr>" +

                                                "<td> " + o.account_idpk + " </td>" +
                                                "<td> " + o.student_id + " </td>" +
                                                "<td> " + o.address + " </td>" +
                                                "<td> " + o.telephone_number + " </td>" +
                                                "<td> " + o.email_address + " </td>" +
                                                "<td> " + o.formatedB + " </td>" +
                                                "<td> " + o.citizenship + " </td>" +
                                                "<td> " + o.religion + " </td>" +
                                                "<td> " + o.marital_status + " </td>" +
                                                "<td> " + o.gender + " </td>" +
                                                "<td> " + o.year_graduated + " </td>" +
                                            "</tr>"


                                        );
                                });
                            }, error: function (response) {
                                console.log("Opps something went wrong.");
                            }
                        });

                    });
                    $(".uid").click(function () {


                        $(".resWrapper").html("");
                        $(".resWrapper").removeClass("revealWrap");
                        $(".display").css("visibility", "hidden");

                        $(".appBtn").html("");
                        $("#messages").html("");
                        $("#myModalLabel2").text("");
                        $("#myModalLabel2").text($(this).data("name"));
                        $(".modal-body").css("display", "none");
                        name = "";
                        $(".appBtn").append(
                                '<button type="button" class="btn btn-success btn-sm send" id="btnSend" style="float:left;">Send</button>' +
                                '<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal" style="float:right;margin-right:50px;">Close</button>')
                        var sess_id = $("#account_idpk").val();
                        account_idfk = $(this).data("id");

                        $("#btnSend").click(function (e) {
                            e.preventDefault();
                            var sess_id = $("#account_idpk").val();
                            var message = $("#replyMessage").val();
                            var sendTo = account_idfk;
                            $.ajax({
                                type: "post",
                                url: "./messaging-ui-alumni.aspx/pushMessages",
                                data: "{'message':'" + message + "','actor_id':'" + sess_id + "','send_to':'" + sendTo + "'}",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                async: true,
                                success: function (r) {
                                    $("#actor-message").val("");
                                    $("#searching").val("");
                                    alert("Message sent.");
                                    window.location.reload(true);
                                }
                            });
                        });
                        console.log(account_idfk);
                    });
                }
            });
        });

        //Filter by year

        $("#filterYear").change(function () {
            sortBy = $("#sortBy option:selected").val();
            var sortColleges = $("#filterCollege option:selected").attr("data-id");
            var y = $(this).val();
            $(".searchableTable tbody").html("");

            $.ajax({
                type: "post",
                url: "alumni-list-ui.aspx/filterByYear",
                data: "{'sortBy':'" + sortBy + "','college_id':'" + sortColleges + "','year':'"+ y +"'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    if (response.d == "[]") { $(".searchableTable tbody").html("No result."); }
                    data = response.d;
                    data = jQuery.parseJSON(data);
                    $.each(data, function (i, o) {
                        var fn = o.given_name + "  " + o.middle_name + " " + o.family_name;
                        if (o.userlevel_idfk == 1) {
                            var mod = ("<tr class='success'>" +
                                            "<td> " + o.account_idpk + " </td>" +

                                            "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                            "<td> " + o.collegeDes + " </td>" +
                                            "<td>" + o.courseDes + "</td>" +
                                             "<td>" + o.year_graduated + "</td>" +
                                          
                                            "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg' > View info </a> </td>" +
                                            "<td> <a class='btn btn-primary btn-sm uid' data-toggle='modal' data-id='" + o.account_idpk + "' data-target='#myModal' data-name='" + fn + "' > Message </a> </td>" +

                                       "</tr>");

                        } else {
                            var mod = ("<tr class='warning'>" +
                                        "<td> " + o.account_idpk + " </td>" +
                                        "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                        "<td> " + o.collegeDes + " </td>" +
                                        "<td>" + o.courseDes + "</td>" +
                                         "<td>" + o.year_graduated + "</td>" +
                                     
                                        "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg' > View info </a> </td>" +
                                         "<td> <a class='btn btn-primary btn-sm uid' data-toggle='modal' data-id='" + o.account_idpk + "' data-target='#myModal' data-name='" + fn + "' > Message </a> </td>" +

                                    "</tr>");
                        }

                        $(".searchableTable tbody").append(
                                        mod
                                    );

                    });

                    //Theatre
                    $(".viewAccountInfo").click(function () {
                        $(".modal-body").css("display", "block");
                        accId = $(this).data("account-id");
                        $("#accountInfoPlaceholder tbody ").html("");
                        $.ajax({
                            type: "post",
                            url: "alumni-list-ui.aspx/fetchAccountInfo",
                            data: "{'accId':'" + accId + "'}",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (approvalResponse) {
                                response = approvalResponse.d;
                                response = jQuery.parseJSON(response);
                                $.each(response, function (i, o) {
                                    console.log(o.student_id);


                                    $("#myModalLabel").text(o.given_name + "  " + o.middle_name + " " + o.family_name);


                                    $(".update-sudnumber").attr("data-id", o.account_idpk);
                                    if (o.student_id == "") {
                                        $("#studNumberPlacer").removeAttr("disabled");
                                        $(".update-sudnumber").removeAttr("disabled");
                                    } else {
                                        $(".update-sudnumber").attr("disabled", "disabled");
                                        $("#studNumberPlacer").attr("disabled", "disabled");
                                        $("#studNumberPlacer").val(o.student_id);
                                    }
                                    $("#accountInfoPlaceholder tbody").append(
                                            "<tr>" +
                                                "<td> " + o.account_idpk + " </td>" +
                                                "<td> " + o.student_id + " </td>" +
                                                "<td> " + o.address + " </td>" +
                                                "<td> " + o.telephone_number + " </td>" +
                                                "<td> " + o.email_address + " </td>" +
                                                "<td> " + o.formatedB + " </td>" +
                                                "<td> " + o.citizenship + " </td>" +
                                                "<td> " + o.religion + " </td>" +
                                                "<td> " + o.marital_status + " </td>" +
                                                "<td> " + o.gender + " </td>" +
                                                "<td> " + o.year_graduated + " </td>" +
                                            "</tr>"
                                        );
                                });
                            }, error: function (response) {
                                console.log("Opps something went wrong.");
                            }
                        });

                    });
                    $(".uid").click(function () {
                        $(".resWrapper").html("");
                        $(".resWrapper").removeClass("revealWrap");
                        $(".display").css("visibility", "hidden");
                        $(".appBtn").html("");
                        $("#messages").html("");
                        $("#myModalLabel2").text("");
                        $("#myModalLabel2").text($(this).data("name"));
                        $(".modal-body").css("display", "none");
                        name = "";
                        $(".appBtn").append(
                                '<button type="button" class="btn btn-success btn-sm send" id="btnSend" style="float:left;">Send</button>' +
                                '<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal" style="float:right;margin-right:50px;">Close</button>')
                        var sess_id = $("#account_idpk").val();
                        account_idfk = $(this).data("id");

                        $("#btnSend").click(function (e) {
                            e.preventDefault();
                            var sess_id = $("#account_idpk").val();
                            var message = $("#replyMessage").val();
                            var sendTo = account_idfk;
                            $.ajax({
                                type: "post",
                                url: "./messaging-ui-alumni.aspx/pushMessages",
                                data: "{'message':'" + message + "','actor_id':'" + sess_id + "','send_to':'" + sendTo + "'}",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                async: true,
                                success: function (r) {
                                    $("#actor-message").val("");
                                    $("#searching").val("");
                                    alert("Message sent.");
                                    window.location.reload(true);
                                }
                            });
                        });
                        console.log(account_idfk);
                    });
                }
            });
        });
    </script>
</body>
</html>
