<%@ Page Language="VB" AutoEventWireup="false" CodeFile="survey-generator-ui.aspx.vb" Inherits="survey_generator_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Survey Generator</title>
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
             <div class="container-fluid">
                <div class="row">
                    <!--#include file="./includes/sidebar-coordinator.inc"-->

                     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                         <h3 class="page-header"><span class="glyphicon glyphicon-th-list">&nbsp;</span>Generate Survey</h3>
                         <div class="row placeholders">
                             <br />
                             <!-- start main-content -->
                             <div class="col-xs-6 col-sm-6 placeholder ">
                              
                                <div class="row">
                                    <div class="col-xs-12 border-enabled">
                                        <h4 class="header-padded ">Survey</h4>
                                        <div class=" row">
                                            <div class="theme-color col-xs-12 highlighted-div">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtSurveyTitle" runat="server" placeholder="Survey Title" CssClass="form-control"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="txtSurveyQuestionArea" runat="server" TextMode="MultiLine" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                                    <br />
                                                    <br />
                                                    <label class="text-theme">Select where to post</label>
                                                    <asp:DropDownList ID="select_to_post_coor" runat="server" CssClass="form-control" ClientIDMode="Static">
                                                        <asp:ListItem Text="" Value="none"/>
                                                        <asp:ListItem Text="College" Value="college-selected"/>
                                                        <asp:ListItem Text="Course" Value="course-selected"/>
                                                    </asp:DropDownList>
                                                    <div class="form-group course-wrap-selector"></div> 
                                                </div>
                                                
                                            </div>

                                           
                                        </div>

                                        <div class="row">
                                            <br />
                                            <div class="col-xs-12">
                                                <h4 class="header-padded">Populate Survey Options</h4>
                                                <div class="row">
                                                    <div class="col-xs-12 enable-populate form-group">
                                                        <asp:TextBox ID="txtSurveyOption" runat="server" CssClass="form-control" placeholder="Survey Option"></asp:TextBox>
                                                        
                                                    </div>
                                                </div>
                                                 <br /><br />
                                                 <div class="row">
                                                     <div class="col-xs-12">
                                                         <asp:ListView ID="ListView1" runat="server">
                                                             
                                                         </asp:ListView>
                                                     
                                                     
                                                     </div>
                                                   
                                                    <br /><br />
                                                </div>
                                            </div>
                                           
                                           
                                        </div>
                                       
                                    </div>
                                </div>
                                <br />
                                
                              
                            </div>


                              <!-- star spacer -->
                              <div class="col-xs-6 col-sm-1 placeholder"> </div>

                              <!-- start right-side -->
                               <div class="col-xs-6 col-sm-5 placeholder border-enabled">
                                  <h5 >&nbsp;List of approved Surveys </h5>
                                  <div class="row">
                                      <div class="col-xs-12 highlighted-div ">
                                          <div class="form-group">
                                              
                                          </div>
                                      </div>
                                  
                                  </div>
                                </div>
                          </div>
                      </div>
                 </div>
            </div>
        </div>
    </form>
</body>
</html>
