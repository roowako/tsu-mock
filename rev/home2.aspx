<%@ Page Language="VB" AutoEventWireup="false" CodeFile="home2.aspx.vb" Inherits="home" %>

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
                                    <asp:Image ID="Image1" runat="server" ImageUrl="./rev/assets/images/TSULOGO.PNG" Height="55" Width="55" CssClass="img-float-nav" />
                                    <h3>&nbsp;&nbsp;&nbsp;Dashboard</h3><span class="clearfix"></span>
                                </span>
                            </a>
                        </div>
                    </div>
                 </nav>-->

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
                                    <a href="#" id="view_profile" runat="server"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a>
                                </li>
		  		                    <li><a href="#" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline</a></li>
		                            <li><a href="#" ><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Messages</a></li>
		                            <li><a href="#"><span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;SMS Notifications</a></li>
		                            <li><a href="#" ID="alumni_logout" runat="server"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;<asp:Label>Log-Out</asp:Label></a></li>
                                </ul>
                        </div>

                        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                             
                            <div class="row placeholders " >
                                <br />

                                <!-- start main-content -->
                                <div class="col-xs-6 col-sm-6 placeholder announcementHolder">
                              
                                    <iframe id="frame1" runat="server" width="1050" height="450" frameborder="0"></iframe>
                                </div>
                                <!-- end main-content -->
                        
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
            
        </form>
     </body>
</html>
