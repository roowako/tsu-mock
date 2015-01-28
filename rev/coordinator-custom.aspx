﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="coordinator-custom.aspx.vb" Inherits="coordinator_custom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
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
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/images/TSULOGO.png" Height="55" Width="55" CssClass="img-float-nav" />
                            <h3>&nbsp;&nbsp;&nbsp;Dashboard</h3>
                             <span class="clearfix"></span>
                        </span>
                       
                    </a>

               
                </div>
                <div id="navbar" class="navbar-collapse collapse" > <!---collapse collapse -->
                  
                     <ul class="nav navbar-nav navbar-right">
                          
                        <li>
                            <a href="#">
                                <h4>
                                    <span class="glyphicon glyphicon-home"></span>
                                </h4>
                            

                            </a>

                        </li>
                        <li>
                            <a href="#">
                                <h4>
                                    <span class="glyphicon glyphicon-cog"></span>
                                </h4>
                            

                            </a>

                        </li>
                       
                      </ul>
                    
                </div><!--/.navbar-collapse -->
                </div>
            </nav>-->
           
            <!-- Start content here -->
            <div class="container-fluid">
                <div class="row">
                   <!--#include file="./includes/sidebar-coordinator.inc"-->


                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                        <h3 class="page-header"><span class="glyphicon glyphicon-home">&nbsp;</span>Timeline</h3>
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-6 placeholder ">
                              
                               <div class="row">
                                  <div class="col-xs-12 border-enabled">
                                      <h4 class="header-padded">Alumni Director</h4>
                                      <div class=" row">
                                          <div class="theme-color col-xs-3 highlighted-div">
                                              <p>Something else</p> 

                                          </div>
                                      </div>
                                       
                                  </div>
                               </div>
                               <br />
                              <div class="row">
                                  <div class="col-xs-12 border-enabled">
                                      <h4 class="header-padded">College Coordinator</h4>
                                      <div class=" row">
                                          <div class="theme-color col-xs-3 highlighted-div">
                                              <p>Something else</p> 

                                          </div>
                                      </div>
                                       
                                  </div>
                               </div>
                              
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                            <div class="col-xs-6 col-sm-1 placeholder"> </div>
                             <!-- end spacer -->
                           

                            <!-- start right-side -->
                            <div class="col-xs-6 col-sm-5 placeholder border-enabled">
                              <h4 class="header-padded"><span class="glyphicon glyphicon-pencil minified"></span>&nbsp; Post Announcement</h4>
                              <div class="row">
                                  <div class="col-xs-12 highlighted-div ">
                                      <div class="form-group">
                                          <asp:TextBox ID="txtPostAnnouncementCoor" runat="server" TextMode="MultiLine" placeholder="" CssClass="form-control"></asp:TextBox>
                                          <br />
                                          <asp:Button ID="btnPostAnnouncementCoor" runat="server" Text="Post Announcement" CssClass="btn btn-warning" type="button" />
                                      </div>
                                  </div>
                                  
                              </div>
                            </div>
                            <!-- end right-side -->

                        </div>
                    </div>

                </div>
            </div>

            <!-- End content here -->
        </div>



    </form>
    
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
   
</body>
</html>