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

				                    <asp:Image ID="undeditable" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="50" Width="65" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />          

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
                    
                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background:white">
                        <div class="row" >
                             <div class="col-xs-4">
                                 <h3 class="page-header"><span class="glyphicon glyphicon-option-vertical">&nbsp;</span>Messages</h3>
                             </div>
                             <div class="col-xs-3">
                                 
                             </div>
                             <div class="col-xs-3 toFix" >
                                  <div class="form-group">
                                    <input type="text" placeholder="New Message" name=""  class="form-control input-sm" id="searching" autocomplete="off"/>
                                    <div class="resWrapper moded_res" style="width:300px;">

                                    </div>
                                    <div class="display moded_dis" style="width:300px;"></div>
                                  </div>
                             </div>
                         </div>
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-12 placeholder" >
                                <div class="table-responsive">
                                    <table class="table table-condensed" id="messagePlaceholder" style="cursor:pointer;">
                                        <tbody >
                                             
                                        </tbody>
                                    </table>
                                </div>
                                
                                 
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                           
                             <!-- end spacer -->
                           

                            <!-- start right-side -->
                            
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
          <div class="modal-header" >
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel" style="text-transform:capitalize;">Modal title</h4>
          </div>
          <div class="modal-body"> 
              <ul id="messages" >
                 
              </ul>
          </div>
          <div class="modal-footer" style="background:#f5f5f5;">
              <div class="container">
                  <div class="row">
                      <div class="col-xs-6" style="text-align:left;">
                          <textarea class="form-control" rows="1" id="replyMessage" style="resize:none;border-radius:0px;"></textarea> &nbsp;
                          
                      </div>
                      
                  </div>
                  <div class="row ">
                      <div class="col-xs-4 appBtn" style='text-align:left;'>
                           
                     
                      </div>
                  </div>
              </div>
          </div>
        </div>
      </div>
    </div>

//Delete modal
         <div class="modal fade bs-example-modal-sm" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="border-radius:3px;">
          <div class="modal-dialog modal-sm" style="width:500px;border-radius:3px;top:100px;">
            <div class="modal-content" style="border-radius:3px;">
              <div class="modal-header" style="background:#F6F7F8;border-radius:3px;padding:8px;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h5 class="modal-title" id="myModalLabel2" style="padding:3px;"><b>Delete Post</b></h5>
              </div>
              <div class="modal-body" style="border-radius:3px;">
                  <p style="border-bottom:thin solid #ccc;padding-bottom:15px;color:#333;">Are you sure you want to delete this?</p>
         
                  <div class="btn-group btn-sm" style="text-align:right;float:right">
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="font-weight:bold;">Cancel</button>
                    <button type="button" class="btn btn-danger btn-sm del_p" style="font-weight:bold;">Delete</button>
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
    <script type="text/javascript" src="./js/json2.js"></script>
    <script type="text/javascript" src="./js/search.js"></script>

      <script>
          $(document).ready(function () {
              var sess_id = $("#account_idpk").val();
              var fullname;
              var account_idfk;
              var name;
              console.log(sess_id);
              var src_;
              var v_src;
              var g_src;
              var uid;
              var dp_r;
              var dp_m;
              var dp_s;

              $.ajax({
                  type: "post",
                  url: "./messaging-ui-alumni.aspx/pullMessages",
                  data: "{'account_id':'" + sess_id + "'}",
                  dataType: "json",
                  contentType: "application/json; charset=utf-8",

                  success: function (r) {

                      
                      data = r.d
                      data = jQuery.parseJSON(data)
                      var last
                      
                      if (r.d == "[]" || r.d == null) {
                          $("#messagePlaceholder").append("No available messages.");
                      } else {
                          $.each(data, function (i, o) {
                             

                              if (o.dp == null) {
                                  src_ = "./assets/images/default-dp.jpg";
                                  dp_m = "<img src='" + src_ + "' style='border-radius:0px;width:35px;height:32px;'/>";
                              } else {
                                  src_ = o.dp;
                                  g_src = o.dp;
                                  dp_s = "<img src='" + g_src + "' style='border-radius:0px;width:35px;height:32px;'/>";
                                 
                              }

                              dp_r = "<img src='" + src_ + "' style='border-radius:0px;width:35px;height:32px;'/>";
                              $("#messagePlaceholder tbody").append(
                              
                              "<tr class=''  style='margin-top:5px;'> " +
                              "<br>" +
                             
                                "<td>" +
                                   dp_r +
                                "</td>"+
                                  "<td> " +
                                      "<div class='sender-name'><b> " + o.u + " </b></div>" +
                                      "</div>" +
                                  "</td>" +
                                  "<td>&nbsp; </td>" +
                                  "<td>&nbsp; </td>" +
                                  "<td> &nbsp;</td>" +
                                   "<td style='text-align:right;'>" +
                                        "<div class='btn-group' role='group'>" +
                                            "<input type='button' style='font-weight:bold;' value='View conversation' data-name='" + o.u + "' class='btn btn-warning btn-sm theatre_m' data-toggle='modal' data-target='#myModal' data-id='" + o.uid + "' data-src='"+ o.dp +"'/>&nbsp;" +
                                            "<a href='#' data-toggle='modal' data-target='.bs-example-modal-sm '  class='btn btn-danger btn-sm delete' data-id='" + o.uid + "'><span class='glyphicon glyphicon-trash'></span></a>" +
                                        "</div>" +
                                    "</td>" +
                                 
                              "</tr>" 
                             
                              );
                          });

                          $(".delete").on("click", function () {
                              uid = "";
                              uid = $(this).data("id");
                              $(".del_p").data("uid", uid);
                          });
                          $(".del_p").on("click", function () {
                              $.ajax({
                                  type: "post",
                                  url: "./messaging-ui-alumni.aspx/deleteMessages",
                                  data: "{'actor_id':'" + sess_id + "','account_id':'" + uid + "'}",
                                  dataType: "json",
                                  processData: false,
                                  traditional: true,
                                  contentType: "application/json; charset=utf-8",
                                  success: function (r) {
                                      console.log(r.d);
                                      window.location.reload(true);
                                  }
                              });
                          });

                          

                          $(".theatre_m").click(function (e) {
                        
                              e.preventDefault();
                           
                              $(".modal-body").css("display", "block");
                              $(".appBtn").html("");
                              $("#messages").html("");
                              $("#myModalLabel").text("");
                            
                              var fn = $(this).data("name");
                              var src = $(this).data("src");
                              $("#myModalLabel").text($(this).data("name"));
                              name = "";
                              dp = "";
                              $(".appBtn").append(
                                  "<div class='btn-group' style='text-align:left;'>"+
                                  "<button type='button' class='btn btn-warning btn-sm reply' ><span class='glyphicon glyphicon-send'></span>&nbsp;&nbsp;Reply&nbsp;</button>" +
                                  "<button type='button' class='btn btn-danger btn-sm' data-dismiss='modal' >Close conversation</button>"+
                                  "</div>");
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
                                          var dp;
                                          if (sess_id == o.sender_idfk) {
                                              name = "Me";
                                              dp_m = $("#undeditable").attr("src");
                                              dp = "<img src='" + dp_m + "' style='border-radius:0px;width:35px;height:30px;'/>";

                                          }
                                          else {
                                              name = fn;
                                              dp = "<img src='" + src + "' style='border-radius:0px;width:35px;height:30px;'/>";
                                          }

                                          $("#messages").append(
                                                  "<li class='messaging'>"+ dp +"<b> " + name + "</b> <span  style='float:right;font-size:12px;color:#333;font-family:Tahoma;' class='glyphicon glyphicon-hourglass'> <span  style='font-size:10px;color:#333;'>" + o.formatedB + " </span></span></li>" +
                                                  "<li class='messaging' style='margin-left:5px;vertical-align:top;'><span >" + o.actor_message + "</span></li>" +
                                                  
                                                  "<br>"
                                          );
                                      });

                                  }
                              });

                              console.log(account_idfk);
                              $(".reply").click(function () {
                                  var message = $("#replyMessage").val();
                                  if (message == "") { alert("Message can't be empty"); }
                                  else
                                  $.ajax({
                                      type: "post",
                                      url: "./messaging-ui-alumni.aspx/pushMessages",
                                      data: "{'message':'" + message + "','actor_id':'" + sess_id + "','send_to':'" + account_idfk + "'}",
                                      dataType: "json",
                                      contentType: "application/json; charset=utf-8",
                                      async: true,
                                      success: function (r) {
                                          $("#replyMessage").val("");
                                          alert("Message Sent.");
                                          window.location.reload(true);
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
