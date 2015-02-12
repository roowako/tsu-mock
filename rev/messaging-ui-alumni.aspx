﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="messaging-ui-alumni.aspx.vb" Inherits="rev_messaging_ui_alumni" %>

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
            <!-- Start content here -->
            <div class="container-fluid">
                <div class="row">
                     <div class="col-sm-3 col-md-2 sidebar">  <!--side-bar -->
	                        <ul class="nav nav-sidebar">
		                        <li>
			                        <a href="#" >
				                        <asp:Image ID="Image2" runat="server" ImageUrl="~/rev/assets/images/default-dp.jpg" Height="75" Width="75" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />          
			                        </a>
		                        </li>
                            <li>    
                                <a href="./alumni-profile.aspx"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a>
                            </li>
		  		                <li><a href="./home.aspx" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline</a></li>
		                        <li><a href="./messaging-ui-alumni.aspx" ><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Messages</a></li>
		                        <li><a href="#" id="alumni_logout" runat="server"><span class="glyphicon glyphicon-off" ></span>&nbsp;&nbsp;Log out</a></li>
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
                                            <input type="text" name="name" value=" " placeholder="Search for alumni" class="form-control"/>
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
    </form>

    
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
          
            console.log(sess_id);
            $.ajax({
                type: "post",
                url: "./messaging-ui-alumni.aspx/pullMessages",
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
                            fullname =  o.given_name + " " + o.family_name ;
                                $("#messagePlaceholder tbody").append(
                                "<tr class='warning'> " +
                                    "<td> " +
                                        "<div class='sender-name'><b> "+ fullname +  " </b></div>" +
                                        "</div>" +
                                    "</td>" +
                                    "<td>" +
                                        "<input type='button' value='View conversation' class='btn btn-success btn-sm theatre' data-toggle='modal' data-target='#myModal' data-id='" + o.account_idpk + "'/>&nbsp;" +
                                       
                                        "<input type='button' value='Delete conversation' class='btn btn-warning btn-sm theatre' data-toggle='modal' data-target='#myModal' data-id='"+ o.account_idpk +"'/>" +
                                    "</td>"+
                                "</tr>" + "<br>");
                        });

                        $(".theatre").click(function () {
                            $("#messages").html("");
                            $("#myModalLabel").text(fullname);
                            var sess_id = $("#account_idpk").val();
                             account_idfk = $(this).data("id");
                            sendTo = $(this).data("id");
                            $.ajax({
                                type: "post",
                                url: "./messaging-ui-alumni.aspx/pullConversation",
                                data: "{'account_id':'" + sess_id + "','account_idfk':'"+ account_idfk +"'}",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                async: true,
                                success: function (r) {
                                    data = r.d
                                    data = jQuery.parseJSON(data)
                                    $.each(data, function (i, o) {
                                        var name;

                                        if (sess_id == o.sender_idfk){
                                            name = "Me";
                                        }
                                        else{
                                            name = fullname;
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
                $.ajax({
                    type: "post",
                    url: "./messaging-ui-alumni.aspx/pushMessages",
                    data:"{'message':'"+ message +"','actor_id':'"+ sess_id +"','send_to':13}",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    async: true,
                    success: function (r) {

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

            function a() {
              
                $("#myModalLabel").text(fullname);
                var sess_id = $("#account_idpk").val();
                
                sendTo = $(this).data("id");
                $.ajax({
                    type: "post",
                    url: "./messaging-ui-alumni.aspx/pullConversation",
                    data: "{'account_id':'" + sess_id + "','account_idfk':'" + account_idfk + "'}",
                    dataType: "json",
                    async:true,
                    contentType: "application/json; charset=utf-8",

                    success: function (r) {
                        data = r.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i, o) {
                            var name;

                            if (sess_id == o.sender_idfk) {
                                name = "Me";
                            }
                            else {
                                name = fullname;
                            }

                            $("#messages").append(
                                    "<li class='messaging'><b> " + name + "</b>: " + o.actor_message + " </li>"
                            );
                        });

                    }
                });
                console.log(account_idfk);
            }
           
     });
    </script>
</body>
</html>