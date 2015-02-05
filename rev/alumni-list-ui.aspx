<%@ Page Language="VB" AutoEventWireup="false" CodeFile="alumni-list-ui.aspx.vb" Inherits="rev_alumni_list_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Alumni List</title>
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
                       
                        <div class="row">
                            <div class="col-sm-4"> <h3 class="page-header"><span class="glyphicon glyphicon-list-alt">&nbsp;</span>List of Alumni</h3></div>
                            <div class="col-sm-1"></div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">Search alumni</div>
                                         <input type="text" name="name" value=" " id="qString"  class="form-control"/>
                                        <br />
                                      
                                    </div>
                                     <span id="resultMsg"></span>
                                </div>
                            </div>
                        </div>
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-9 placeholder form-group">
                             
                                <div class="row">
                                    <div class="col-xs-5">
                                        <div class="input-group">
                                            <div class="input-group-addon">View:</div>
                                              <asp:DropDownList ID="filterCollege" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="College 1" />
                                             <asp:ListItem Text="College 2" />
                                             <asp:ListItem Text="College 3" />
                                        </asp:DropDownList>
                                        </div>
                                       
                            
                                    </div>

                                    <div class="col-xs-5">
                                         <asp:DropDownList ID="filterCourse" runat="server" CssClass="form-control">
                                          
                                        </asp:DropDownList>
                            
                                    </div>

                                    <div class="col-xs-2">
                                         <asp:DropDownList ID="filterYear" runat="server" CssClass="form-control">
                                           <asp:ListItem Text="1970" />
                                            <asp:ListItem Text="1971" />
                                            <asp:ListItem Text="1972" />
                                            <asp:ListItem Text="1973" />
                                            <asp:ListItem Text="1974" />
                                            <asp:ListItem Text="1975" />
                                            <asp:ListItem Text="1976" />
                                            <asp:ListItem Text="1977" />
                                            <asp:ListItem Text="1978" />
                                            <asp:ListItem Text="1979" />
                                            <asp:ListItem Text="1980" />
                                            <asp:ListItem Text="1981" />
                                            <asp:ListItem Text="1982" />
                                            <asp:ListItem Text="1983" />
                                            <asp:ListItem Text="1984" />
                                            <asp:ListItem Text="1985" />
                                            <asp:ListItem Text="1986" />
                                            <asp:ListItem Text="1987" />
                                            <asp:ListItem Text="1988" />
                                            <asp:ListItem Text="1989" />
                                            <asp:ListItem Text="1990" />
                                            <asp:ListItem Text="1991" />
                                            <asp:ListItem Text="1992" />
                                            <asp:ListItem Text="1993" />
                                            <asp:ListItem Text="1994" />
                                            <asp:ListItem Text="1995" />
                                            <asp:ListItem Text="1997" />
                                            <asp:ListItem Text="1998" />
                                            <asp:ListItem Text="1999" />
                                            <asp:ListItem Text="2000" />
                                        </asp:DropDownList>
                            
                                    </div>
                                </div>
                               
                                <br />
                                    <div class="table-responsive">
                                        <table class="table table-hover" id="searchableTable">
                                            <thead>

                                           
                                            <tr>
                                                <td><span class="glyphicon glyphicon-th-list"></span></td>  
                                                <td>Fullname</td>
                                                <td>College</td>
                                                <td>Course</td>
                                                <td>Year Graduated</td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                             <tr>
                                                 <td></td>
                                                 <td>Karlo Armamento</td>
                                                 <td>CCS</td>
                                                 <td>IT</td>
                                                 <td>2000</td>
                                                 <td><a href="#" class="btn btn-primary btn-sm">View info</a></td>
                                             </tr>
                                            </tbody>
                                        </table>
                                    </div>
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                            <div class="col-xs-6 col-sm-1 placeholder"> </div>
                             <!-- end spacer -->
                           

                            <!-- start right-side -->
                           
                            <!-- end right-side -->

                        </div>
                    </div>

                </div>
            </div>

        </div>
    </form>

    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script>
        $(document).ready(function () {

            $("#qString").bind("keyup", function (event) {
                $(this).search(event);
            });
            $("#filterCollege").change(function () {
                $("#filterCourse").empty();
                var fk = $("#filterCollege option:selected").val();
                $.ajax({
                    type: "post",
                    url: "Default.aspx/fetchCourseByIdfk",
                    data: "{'collegeFk':'" + fk + "'}",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        data = response.d;
                        data = jQuery.parseJSON(data);
                        $.each(data, function (i, o) {


                            $("#filterCourse").append(
                                "<option>" + o.description + " </option>"
                                );
                        });
                        console.log(response.d);
                    }

                });

            });
        });

        $.fn.search =function(event){
            var ESC = 27;
            var SPACE = 32;

            var key = event.which || event.keyCode;
            var input = $(this).val().trim();

            

        }
    </script>
</body>
</html>
