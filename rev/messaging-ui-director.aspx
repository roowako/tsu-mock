<%@ Page Language="VB" AutoEventWireup="false" CodeFile="messaging-ui-director.aspx.vb" Inherits="rev_messaging_ui_director" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Messages</title>
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
                             <div class="col-xs-4">
                                 <h3 class="page-header"><span class="glyphicon glyphicon-home">&nbsp;</span>Messages</h3>
                             </div>
                             <div class="col-xs-2">
                                 
                             </div>
                             <div class="col-xs-3">
                                 
                             </div>
                         </div>
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-6 placeholder" >
                                <div class="table-responsive">
                                    <table class="table table-condensed" id="messagePlaceholder">
                                        <tbody>
                                             
                                        </tbody>
                                    </table>
                                </div>
                                
                                 
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                            <div class="col-xs-6 col-sm-1 placeholder"> </div>
                             <!-- end spacer -->
                           

                            <!-- start right-side -->
                            <div class="col-xs-6 col-sm-5 placeholder ">
                              <h5 class="header-padded"><span class="glyphicon glyphicon-pencil minified"></span>&nbsp;Search for alumni</h5>
                                <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <input type="text" id="qAlumni" name="name" value=" " placeholder="Search for alumni" class="form-control" autocomplete="off"/>
                                            <input type="hidden" name="name" value=" " id="hidId" />
                                         </div>

                                        <div class="form-group">
                                             <textarea rows="5" class="form-control" id="actor-message"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <asp:Button Text="Send message" runat="server" class="btn btn-success btn-sm" ID="btnSend"/>
                                        </div>
                                    </div>
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
            <h4 class="modal-title" id="myModalLabel" style="text-transform:capitalize;">Modal title</h4>
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
                  <div class="row">
                      <div class="col-xs-2">
                           <button type="button" class="btn btn-success btn-sm reply" style="float:left;">Reply</button>
                           <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal" style="float:right;margin-right:50px;">Close</button>
                     
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
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
    <script>
        $(document).ready(function () {
            var sess_id = $("#account_idpk").val();
            var fullname;
            var account_idfk;
            var name;
            $("#myModalLabel").text("");
            console.log(sess_id);
            $.ajax({
                type: "post",
                url: "./messaging-ui-director.aspx/pullMessages",
                data:"{'account_id':'"+ sess_id +"'}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",

                success: function (r) {
                    data = r.d
                    data = jQuery.parseJSON(data)
                    var last

                    if (r.d == "[]") {
                        $("#messagePlaceholder").append("No available messages.");
                        console.log("a");
                    } else{
                        $.each(data, function (i, o) {
                            $("#myModalLabel").html("");
                            fullname =  o.given_name + " " + o.family_name ;
                                $("#messagePlaceholder tbody").append(
                                "<tr class='warning'> " +
                                    "<td> " +
                                        "<div class='sender-name'><b> "+ fullname +  " </b></div>" +
                                        "</div>" +
                                    "</td>" +
                                    "<td>" +
                                        "<input type='button' data-name='" + fullname + "' value='View conversation' class='btn btn-success btn-sm theatre' data-toggle='modal' data-target='#myModal' data-id='" + o.account_idpk + "'/>&nbsp;" +
                                       
                                        "<input type='button'  value='Delete conversation' class='btn btn-warning btn-sm' data-toggle='modal' data-target='#myModal' data-id='"+ o.account_idpk +"'/>" +
                                    "</td>"+
                                "</tr>" + "<br>");
                        });

                        $(".theatre").click(function () {
                            $("#messages").html("");
                            $("#myModalLabel").text("");
                            var fn = $(this).data("name");
                            $("#myModalLabel").text($(this).data("name"));
                            name = "";
                           
                           console.log(fullname);
                            var sess_id = $("#account_idpk").val();
                             account_idfk = $(this).data("id");
                            sendTo = $(this).data("id");
                            $.ajax({
                                type: "post",
                                url: "./messaging-ui-director.aspx/pullConversation",
                                data: "{'account_id':'" + sess_id + "','account_idfk':'"+ account_idfk +"'}",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                async: true,
                                success: function (r) {
                                  
                                    data = r.d
                                    data = jQuery.parseJSON(data)
                                    $.each(data, function (i, o) {
                                  
                                        

                                        if (sess_id == o.sender_idfk){
                                            name = "Me";
                                        }
                                        else{
                                            name =fn;
                                        }
                                       
                                        $("#messages").append(
                                                "<li class='messaging'><b> " + name + "</b>: " + o.actor_message + " </li>" +
                                                "<li style=font-size:10px;color:#333;> " + "  - " + o.formatedB +" </li>" +
                                                "<br>"
                                        );
                                     });

                                }
                            });
                            console.log(account_idfk);
                        });
            }
                }

            });

            $("#btnSend").click(function (e) {
                e.preventDefault();
                var sess_id = $("#account_idpk").val();
                var message = $("#actor-message").val();
                var sendTo = $("#hidId").val();
                $.ajax({
                    type: "post",
                    url: "./messaging-ui-alumni.aspx/pushMessages",
                    data:"{'message':'"+ message +"','actor_id':'"+ sess_id +"','send_to':'"+ sendTo +"'}",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    async: true,
                    success: function (r) {
                        $("#actor-message").val("");
                        $("#qAlumni").val("");
                    }
                });


            });

            $(".reply").click(function () {
              
                var message = $("#replyMessage").val();
                
                $.ajax({
                    type: "post",
                    url: "./messaging-ui-alumni.aspx/pushMessages",
                    data: "{'message':'" + message + "','actor_id':'" + sess_id + "','send_to':'"+ account_idfk +"'}",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    async: true,
                    success: function (r) {
                        $("#replyMessage").val("");
                        window.location.reload(true);
                    }
                });
            });

            $('#modal').on('shown', function () {
                $('#modal-body').stop().animate({
                    scrollTop: $("#modal-body")[0].scrollHeight
                }, 2000);
               
            });

          


            $("#qAlumni").on("keyup", function (event) {
                $(this).search(event);
            });


            $.fn.search = function (event) {
                var ESC = 27;
                var SPACE = 32;
                var BACKSPAE = 8;
                event.preventDefault();
                var key = event.which || event.keyCode;
                var input = $(this).val().trim();
                var f = input.match(/^[a-zA-Z\s]+$/);

                if (key !== ESC && key !== BACKSPAE) {
                    $(".resultContainer").html("");
                    $("#searchableTable tbody").html("");

                    $.ajax({
                        type: "post",
                        url: "alumni-list-ui.aspx/searchQ",
                        data: "{'q':'" + f + "'}",
                        dataType: "json",
                        processData: false,
                        traditional: true,
                        contentType: "application/json; charset=utf-8",
                        success: function (response) {

                            if (response.d == "[]") {
                                $(".resultContainer").addClass("animateOnDisplay");
                                $(".resultContainer").append("<br>" + "No results found for " + "<span>" + input + " </span>");


                            } else {
                                data = response.d;
                                data = jQuery.parseJSON(data);
                                $.each(data, function (i, o) {
                                    $("#qAlumni").val(o.given_name + " " + o.family_name);
                                    $("#qAlumni").focus().select();
                                    $("#hidId").val(o.account_idpk);
                                    var last = data.length;
                                    $(".resultContainer").html("");
                                    $(".resultContainer").append("<br>" + "Found " + "<span>" + last + " result(s) for " + input + " </span>");



                                    var mod = ("<tr class='warning'>" +
                                    "<td> " + o.account_idpk + " </td>" +
                                    "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                    "<td> " + o.description + " </td>" +
                                    "<td></td>" +
                                    "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'> View info </a> </td>" +
                                     "</tr>");
                                    $(".resultContainer").addClass("animateOnDisplay");

                                    $(".searchableTable tbody").append(
                                       mod
                                   );
                                });

                                $(".viewAccountInfo").click(function () {

                                    accId = $(this).data("account-id");
                                    $("#accountInfoPlaceholder tbody ").html("");
                                    $.ajax({
                                        type: "post",
                                        url: "pending-reg-ui.aspx/fetchAccountInfo",
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
                                                            "<td> " + o.address + " </td>" +
                                                            "<td> " + o.telephone_number + " </td>" +
                                                            "<td> " + o.email_address + " </td>" +
                                                            "<td> " + o.birthday + " </td>" +
                                                            "<td> " + o.citizenship + " </td>" +
                                                            "<td> " + o.religion + " </td>" +
                                                            "<td> " + o.marital_status + " </td>" +
                                                            "<td> " + o.gender + " </td>" +
                                                        "</tr>"


                                                    );
                                            });
                                        }
                                    });
                                });
                            }


                        }

                    });
                } else if (key == BACKSPAE) {
                    if (input == "") {
                       
                    }
                    $(".resultContainer").removeClass("animateOnDisplay");

                }


            }
           
     });
    </script>
</body>
</html>
