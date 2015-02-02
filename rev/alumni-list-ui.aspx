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
                        <h3 class="page-header"><span class="glyphicon glyphicon-list-alt">&nbsp;</span>List of Alumni</h3>
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-9 placeholder form-group">
                                <h5>Filter view by :</h5>
                                <div class="row">
                                    <div class="col-xs-4">
                                         <asp:DropDownList ID="filterCollege" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="College 1" />
                                             <asp:ListItem Text="College 2" />
                                             <asp:ListItem Text="College 3" />
                                        </asp:DropDownList>
                            
                                    </div>

                                    <div class="col-xs-4">
                                         <asp:DropDownList ID="filterCourse" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="Course 1" />
                                             <asp:ListItem Text="Course 2" />
                                             <asp:ListItem Text="Course 3" />
                                        </asp:DropDownList>
                            
                                    </div>

                                    <div class="col-xs-4">
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
</body>
</html>
