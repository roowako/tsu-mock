<%@ Page Language="VB" AutoEventWireup="false" CodeFile="messaging-ui.aspx.vb" Inherits="messaging_ui" %>

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
        <div class="container-fluid  ">
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
                    <ul class="nav navbar-nav navbar-left extended" style="margin-top:8px;">
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
                  
                    <div class="container-fluid">
                <div class="row">
                     <div class="col-sm-3 col-md-2 sidebar">  <!--side-bar -->
	                       <ul class="nav nav-sidebar">
		                        <li>
			                        <a href="#" >
				                        <asp:Image ID="Image2" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="75" Width="75" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />          
			                        </a>

		                        </li>
		                        <li><a href="#" class="bolder"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a></li>
		                        <li>
			                        <br />
		                        </li>
		                        <li><a href="./coordinator-custom.aspx" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline</a></li>
		                        <li><a href="./messaging-ui.aspx" ><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Messages</a></li>
		                        <li><a href="./poll-generator-ui.aspx"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Survey</a></li>
		                        <li><a href="./statistics-coordinator.aspx"><span class="glyphicon glyphicon-signal"></span>&nbsp;&nbsp;Statistics</a></li>
		                        <li><a href="./token-generator-ui.aspx"><span class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;Tokens</a></li>
		  
		                        <li><a href="#" id="alumni_logout" runat="server"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;Log out</a></li>
                                <li>
                                    <asp:TextBox ID="account_idpk" runat="server" ></asp:TextBox>
                                </li>
	                        </ul>
                    </div>

                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                        <div class="row">
                             <div class="col-xs-4">
                                 <h3 class="page-header"><span class="glyphicon glyphicon-comment">&nbsp;</span>Messages</h3>
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
                              
                            </div>
                            <!-- end right-side -->

                        </div>
                    </div>
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
                  <div class="row ">
                      <div class="col-xs-2 appBtn">
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
    <script type="text/javascript" src="./js/search.js"></script>
    <script type="text/javascript" src="./js/bindDelay.js"></script>
    <script type="text/javascript" src="./js/json2.js"></script>
    <script>
        $(document).ready(function () {
            var sess_id = $("#account_idpk").val();
            var fullname;
            var account_idfk;
            var name;
            console.log(sess_id);
            $.ajax({
                type: "post",
                url: "./messaging-ui.aspx/pullMessages",
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
                           
                                $("#messagePlaceholder tbody").append(
                                "<tr class='warning'> " +
                                    "<td> " +
                                        "<div class='sender-name'><b> "+ o.u +  " </b></div>" +
                                        "</div>" +
                                    "</td>" +
                                    "<td>" +
                                        "<input type='button' value='View conversation' data-name='" + o.u + "' class='btn btn-success btn-sm theatre' data-toggle='modal' data-target='#myModal' data-id='" + o.uid + "'/>&nbsp;" +
                                        "<input type='button' value='Delete conversation' class='btn btn-warning btn-sm theatre' data-toggle='modal' data-target='#myModal' data-id='"+ o.uid +"'/>" +
                                    "</td>"+
                                "</tr>" + "<br>");
                        });

                        $(".theatre").click(function () {
                            $(".appBtn").html("");
                            $("#messages").html("");
                            $("#myModalLabel").text("");
                            var fn = $(this).data("name");
                            $("#myModalLabel").text($(this).data("name"));
                            name = "";
                            $(".appBtn").append(
                                '<button type="button" class="btn btn-success btn-sm reply" style="float:left;">Reply</button>' +
                                '<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal" style="float:right;margin-right:50px;">Close</button>');
                            var sess_id = $("#account_idpk").val();
                            account_idfk = $(this).data("id");
                            sendTo = $(this).data("id");

                            $.ajax({
                                type: "post",
                                url: "./messaging-ui-alumni.aspx/pullConversation",
                                data: "{'account_id':'" + sess_id + "','account_idfk':'" + account_idfk + "'}",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                async: true,
                                success: function (r) {
                                    data = r.d
                                    data = jQuery.parseJSON(data)
                                    $.each(data, function (i, o) {
                                        var name;

                                        if (sess_id == o.sender_idfk) {
                                            name = "Me";
                                        }
                                        else {
                                            name = fn;
                                        }

                                        $("#messages").append(
                                                "<li class='messaging'><b> " + name + "</b> </li>" +
                                                "<li class='messaging'>" + o.actor_message + " </li>" +
                                                "<li style=font-size:10px;color:#333;> " + "  - " + o.formatedB + " </li>" +
                                                "<br>"
                                        );
                                    });

                                }
                            });

                            console.log(account_idfk);
                            $(".reply").click(function () {
                                var message = $("#replyMessage").val();

                                $.ajax({
                                    type: "post",
                                    url: "./messaging-ui-alumni.aspx/pushMessages",
                                    data: "{'message':'" + message + "','actor_id':'" + sess_id + "','send_to':'" + account_idfk + "'}",
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    async: true,
                                    success: function (r) {
                                        $("#replyMessage").val("");
                                        alert("Reply Sent.");
                                    }
                                });
                            });
                        });
            }
                }

            });

            $('#modal').on('shown', function () {
                $('#modal-body').stop().animate({
                    scrollTop: $("#modal-body")[0].scrollHeight
                }, 2000);
               
            });  
     });
    </script>
</body>
</html>
