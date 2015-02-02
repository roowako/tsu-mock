<%@ Page Language="VB" AutoEventWireup="false" CodeFile="statistics-ui.aspx.vb" Inherits="statistics_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Statistics</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/horizBarChart.css" rel="stylesheet" />
    <link href="./css/chart.css" rel="stylesheet" />
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
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/rev/assets/images/TSULOGO.png" Height="55" Width="55" CssClass="img-float-nav" />
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
                    <!--#include file="./includes/sidebar-director.inc"-->

                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                        <h3 class="page-header"><span class="glyphicon glyphicon-signal">&nbsp;</span>Statistics</h3>
                        <div class="row placeholders">
                            <br />
                            <!-- start main-content -->
                             <div class="col-xs-6 col-sm-12 placeholder ">

                                 <div class="row">
                                     <div class="col-xs-12 ">
                                         <h4 class="header-padded "></h4>
                                         <div class="row">
                                             <div class="col-xs-12 ">
                                                  <div class="chart-horiz clearfix">
                                                      <!-- Actual bar chart -->
                                                      <ul class="chart">
                                                        <li class="golden title" ></li>
                                                     
        		                                        <li class="current" title="Label 1"><span class="bar" data-number="38000"></span><span class="number">38,000</span></li>
        		                                        <li class="current" title="Label 2"><span class="bar" data-number="28500"></span><span class="number">28,500</span></li>
                                                        <li class="current" title="Label 3"><span class="bar" data-number="18500"></span><span class="number">18,500</span></li>
        		                                        <li class="current" title="Label 4"><span class="bar" data-number="8000"></span><span class="number">8,000</span></li>
        		                                        <li class="current" title="Label 5"><span class="bar" data-number="14000"></span><span class="number">14,000</span></li>
                                                        <li class="current" title="Label 6"><span class="bar" data-number="24000"></span><span class="number">24,000</span></li>
                                                        <li class="current" title="Label 7"><span class="bar" data-number="34000"></span><span class="number">34,000</span></li>
                                                        <li class="current" title="Label 8"><span class="bar" data-number="12000"></span><span class="number">12,000</span></li>
                                                        <li class="current" title="Label 9"><span class="bar" data-number="14000"></span><span class="number">14,000</span></li>
        	                                            </ul>
                                                    </div>
                                                 <br />
                                             </div>
                                         </div>
                                       

                                     </div>
                                 </div>
                                 <br />
                            </div>

                             <!-- star spacer -->
                           

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
    <script type="text/javascript" src="./js/horizBarChart.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.chart').horizBarChart({
                selector: '.bar',
                speed: 1000
            });
        });
    </script>
</body>
</html>
