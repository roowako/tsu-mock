<%@ Page Language="VB" AutoEventWireup="false" CodeFile="survey-generator-director-ui.aspx.vb" Inherits="rev_survey_generator_director_ui" %>

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

            <div class="container-fluid">
                <div class="row">
                    <!--#include file="./includes/sidebar-director.inc"-->

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
                                                    <asp:TextBox ID="txtSurveyTitle" runat="server" placeholder="Survey Title" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="txtSurveyQuestionArea" runat="server" TextMode="MultiLine" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                                    <br />
                                                    <br />
                                                    <label class="text-theme">Select where to post</label>
                                                    
                                                </div>
                                                
                                            </div>

                                           
                                        </div>

                                        <div class="row">
                                            <br />
                                            <div class="col-xs-12">
                                                <h4 class="header-padded">Populate Survey Options</h4>
                                                <div class="row">
                                                    <div class="col-xs-12 enable-populate form-group">
                                                        
                                                       
                                                       

                                                    </div>
                                                        
                                                </div>
                                                 <br /><br />
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <asp:HyperLink ID="btnAddOption" runat="server" CssClass="btn btn-primary">Add Option</asp:HyperLink>
                                                        <asp:HyperLink ID="remove_poll_opt" runat="server" CssClass="btn btn-warning">Remove Option</asp:HyperLink>
                                                        <asp:HyperLink ID="remove_all_poll_opt" runat="server" CssClass="btn btn-warning">Remove all option</asp:HyperLink>
                                                        <input id="btnGetTime" type="button" class="btn btn-sm btn-success" value="Submit Survey" onclick = "pushToServer()" />
                                                       
                                                        <br />
                                                        <br />
                                                    </div>
                                                     <br />
                                                     <br />
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
                                  <h5 >&nbsp;List of Surveys </h5>
                                  <div class="row">
                                      <div class="col-xs-12 highlighted-div ">
                                          <div class="table-responsive">
                                                <table class="table table-hover">
                                                    <tr>
                                                       <td><span class="glyphicon glyphicon-th-list"></span></td>  
                                                        <td>Survey Title</td>
                                                        <td>Status</td>
                                                        <td></td>
                                                    </tr>
                                                    
                                                </table>
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
