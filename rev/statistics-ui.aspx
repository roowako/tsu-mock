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
                                     <div class="col-xs-3">
                                         <div class="input-group">
                                             <div class="input-group-addon">Filter by :</div>
                                             <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control filterView" >
                                                 <asp:ListItem Text="Poll Questions" Value="poll"/>
                                                 <asp:ListItem Text="Survey Questions" Value="survey" />
                                             </asp:DropDownList>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="row">
                                     <div class="col-xs-12 ">
                                         <h4 class="header-padded "></h4>
                                         <div class="row">
                                             <div class="col-xs-12 table-responsive">

                                                  <div class="table-responsive" >
                                                    <table class="table table-hover tableDetailsView" style="border-top:0px !important;" id="pendingPlaceholder">
                                                        <thead>
                                                        <tr>
                                                            <td><span class="glyphicon glyphicon-th-list"></span></td>
                                                            <td></td>
                                                            <td><b>Title</b></td>
                                                            <td><b>Question</b></td>                                   

                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                               
                                                         </tbody>          
                                                    </table>
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
            var filterView = "poll";
            $(".filterView").change(function () {
               
                filterView = $(this).val();
                $.ajax({
                    type: "post",
                    url: "statistics-ui.aspx/PullQ",
                    data: "{'filterView':'" + filterView + "'}",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (serverData) {
                        data = serverData.d;
                        data = jQuery.parseJSON(data);
                        $.each(data, function (i, o) {
                            console.log(data);
                        });
                    }

                });
            });
            
            $.ajax({
                type: "post",
                url: "statistics-ui.aspx/PullQ",
                data:"{'filterView':'"+ filterView +"'}",
                dataType:"json",
                contentType: "application/json",
                success: function (serverData) {
                    data = serverData.d;
                    data = jQuery.parseJSON(data);
                    $.each(data, function (i, o) {
                        $(".tableDetailsView tbody").append(
                            "<tr>" +
                                "<td> " + o.polls_idpk + " </td>" +
                                "<td> </td>" +
                                "<td> " + o.description + " </td>" +
                                "<td> "+ o.question +"</td>"+
                                "<td> <a class='btn btn-primary btn-sm'>View Statistics </a> </td>"+
                            "</tr>"
                            );
                    });
                }

            });
        });
    </script>
</body>
</html>
