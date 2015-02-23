<%@ Page Language="VB" AutoEventWireup="false" CodeFile="viewprofile.aspx.vb" Inherits="viewprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
    <link href="./css/sidebar-theme.css" rel="stylesheet" />
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
                    <a class="navbar-brand extended-brand"  runat="server" id="dyna">
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
                    <div class="col-sm-3 col-md-2 sidebar">  <!--side-bar -->
	                        <ul class="nav nav-sidebar">
		                        <li>
			                        <a>
				                        <asp:Image ID="Image2" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="75" Width="75" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />          
			                        </a>
		                        </li>
                            <li>    
                                <a  href="#" ><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a>
                            </li>
		  		                <li> <a runat="server" id="pointer"> <span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline </a> </li>
                                <li>
                                    <asp:TextBox ID="acc_id" runat="server" style="display:none;"></asp:TextBox>
                                    <asp:TextBox ID="account_idpk" runat="server" ></asp:TextBox>
                                    <asp:Label ID="sName" runat="server" Text=""></asp:Label>
                                    
                                </li>
                            </ul>
                    </div>

                     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                         <div class="row">
                             <div class="col-xs-1 ">
                                 <asp:Image ID="Image3" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="65" Width="65" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />

                             </div>
                             <div class="col-xs-4" style="vertical-align:bottom;">
                                 <br />
                                 <h3 class="page-header" style="vertical-align:bottom;" >Profile </h3>
                                
                             </div>
                             <div class="col-xs-4"></div>

                             <div class="col-xs-3">
                                 <br />
                                 &nbsp; <span><input type="button" data-toggle='modal' data-target='#myModal'  value="Message" class="btn btn-warning btn-sm viewMessaging" style="width:150px;"/></span>
                             </div>

                         </div>
                        <div class="row placeholders " >
                            <br />

                            <!-- start main-content -->
                            <div class="col-xs-12 col-sm-12 placeholder announcementHolder">
                                <div class="row" >
                                    <div class="col-xs-12">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="basic-info table" style="text-transform:capitalize;">
                                                    <table class="table borderless" data-toggle="table">
                                                        <tbody>

                                                        </tbody>
                                                    </table>   
                                                </div>
                                            </div>
                                        </div>
                                        
                                      
                                    </div>
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
             
              
             
          </div>
          <div class="modal-footer">
              <div class="container">
                  <div class="row">
                      <div class="col-xs-6">
                          <textarea class="form-control" rows="1" id="mailer"></textarea> &nbsp;
                          
                      </div>
                      
                  </div>
                  <div class="row ">
                      <div class="col-xs-2 appBtn">
                           <button type="button" class="btn btn-success btn-sm send" style="float:left;">Send</button>
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
    <script type="text/javascript" src="./js/home-search.js"></script>
     <script type="text/javascript" src="./js/bindDelay.js"></script>
    <script type="text/javascript" src="./json2.js"></script>
    <script>
        $(document).ready(function () {
            var fullname = $("#sname").text();
            var id = $("#acc_id").val();
            var globalName;
            var aid = $("#account_idpk").val();
            $(document).attr('title',$(document).attr('title').toUpperCase());        
       
        

            //Load user info
            $.ajax({
                type: "post",
                url: "./viewprofile.aspx/pullInfo",
                data: "{'id':'" + id + "'}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",

                success: function (r) {

                    console.log(r.d);
                    data = r.d
                    data = jQuery.parseJSON(data)
                    $.each(data, function (i, o) {
                        if(o.u == null){
                            globalName = o.u1;
                            $(".page-header").text(o.u1);
                        }else{
                            globalName = o.u;
                            $(".page-header").text(o.u1);
                        }
                        
                        if( o.ul == 3){
                            $(".basic-info tbody").html("Confidential.");
                            $(".page-header").text(o.u);
                        } else {
                            $("title").text($(".page-header").text());

                            email = o.m;
                            contact = o.c;

                            $(".basic-info tbody").append(
                                "<tr>" +
                                    "<td><span class='glyphicon glyphicon-map-marker dim'></span> &nbsp;" + o.a + "  </td>" +
                                    "<td> </td>" +
                                    "<td> </td>" +
                                "</tr>" +
                                 "<tr>" +
                                    "<td> <span class='glyphicon glyphicon-gift dim'></span> &nbsp;" + o.formatedB + " </td>" +
                                    "<td> </td>" +
                                    "<td> </td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td> <span class='glyphicon glyphicon-flag dim'></span> &nbsp;" + o.ct + "  </td>" +
                                    "<td> </td>" +
                                    "<td> </td>" +
                                "</tr>" +
                                 "<tr>" +
                                    "<td><span class='glyphicon glyphicon-certificate dim'></span> &nbsp;" + o.r + "  </td>" +
                                    "<td></td>" +
                                    "<td> </td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td><span class='glyphicon glyphicon-heart dim'></span> &nbsp;" + o.ms + "  </td>" +
                                    "<td></td>" +
                                    "<td> </td>" +
                                "</tr>" +

                                "<tr>" +
                                    "<td><span class='glyphicon glyphicon-book dim'></span> &nbsp;" + o.cd + "    </td>" +
                                    "<td></td>" +
                                    "<td> </td>" +
                                "</tr>" + "<tr>" +
                                    "<td><span class='glyphicon glyphicon-book dim'></span> &nbsp;" + o.ccd + "   </td>" +
                                    "<td></td>" +
                                    "<td> </td>" +
                                "</tr>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td><span class='glyphicon glyphicon-calendar dim'></span> &nbsp;" + o.yg + " </td>" +
                                    "<td> </td>" +
                                    "<td> </td>" +
                                "</tr>"

                                );
                        }
                     
                        
                    });

                }
            });

            //Message 
            $(".viewMessaging").click(function (e) {
                e.preventDefault();
                $("#myModalLabel").text(globalName);
                console.log(globalName);
                
            });

            $(".send").click(function () {
                var m = $("#mailer").val();
                $.ajax({
                    type: "post",
                    url: "./messaging-ui-alumni.aspx/pushMessages",
                    data: "{'message':'" + m + "','actor_id':'" + aid + "','send_to':'" + id + "'}",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    async: true,
                    success: function (r) {
                        $("#actor-message").val("");
                        alert("Message sent.");
                        window.location.reload(true);
                    }
                });
            });
        });

        
    </script>
</body>
</html>
