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
                    <!--#include file="./includes/sidebar-director.inc"-->
                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                        <div class="row">
                             <div class="col-xs-4">
                                 <h3 class="page-header"><span class="glyphicon glyphicon-home">&nbsp;</span>Messages</h3>
                             </div>
                             <div class="col-xs-2">
                                 
                             </div>
                             <div class="col-xs-3">
                                 
                             </div>
                              <div class="col-xs-3">
                                 <ul class="right-action-buttons">
                                   <li><a href="#"><span class="glyphicon glyphicon-cog"></span> </a></li>
                                   <li><a href="#"><span class="glyphicon glyphicon-home"></span> </a></li>
                                    <li><a href="#">Log out</a></li>
                                  </ul>
                             </div>
                         </div>
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-6 placeholder announcementHolder" >
                              <div class="form-group">
                                     <textarea rows="5" class="form-control"></textarea>
                                 </div>
                              
                              
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                            <div class="col-xs-6 col-sm-1 placeholder"> </div>
                             <!-- end spacer -->
                           

                            <!-- start right-side -->
                            <div class="col-xs-6 col-sm-5 placeholder border-enabled">
                              <h4 class="header-padded"><span class="glyphicon glyphicon-pencil minified"></span></h4>
                              
                            </div>
                            <!-- end right-side -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
