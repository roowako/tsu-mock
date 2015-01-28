<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profile.aspx.vb" Inherits="profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TSU Alumin Tracer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/custom.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
        <nav class="navbar navbar-inverse navbar-fixed-top shadowed default-color"> 
            <div class="container pulled-height ">
            <div class="navbar-header ">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand extended-brand " href="./Default.aspx">
                    <span class="pulled-left">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/images/TSULOGO.png" Height="60" Width="60" CssClass="floating-img-nav" />
                        <h3> &nbsp;&nbsp;Tarlac State University</h3>
                    </span>
                    <div class="clearfix"></div>
                </a>

               
            </div>
            <div id="navbar" class="navbar-collapse collapse" > <!---collapse collapse -->
                        
                    <br />
                <div class="navbar-form navbar-right">
                    <div class="form-group">
                        <div class="col-sm-10">
                        <div class="input-group">
                            <div class="input-group-addon">Search</div>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control res"></asp:TextBox>
                        </div>
                        </div>
                    </div>
                </div>
            </div><!--/.navbar-collapse -->
            </div>
            </nav>-->

            <!--- Content Start -->
            <div class="pulled-down  container">
                <div class="row ">
                    <div class="col-xs-3  max-height">
                       
                        <asp:Image ID="Image2" CssClass="radius-enabled" runat="server" ImageUrl="~/assets/images/default-dp.jpg" Height="180" Width="180" /> 
                        <br />
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="row">
                                    <div class="col-xs-3">
                                        
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="col-xs-8"><h5>Wisdom: The true happiness ends since its started </h5></div>
                                    
                                    
                                </div>

                                 <div class="row">
                                    <div class="col-xs-12"><h5>Name: Karlo Armamento  </h5></div>
                                    
                                </div>

                                <div class="row">
                                    <div class="col-xs-12"><h5>Occupation: Google's Web Master </h5></div>
                                    
                                </div>
                                <div class="row ">
                                    <div class="col-xs-12"><h5>Contact #: 0918-890-3555 </h5></div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-9 left-padded right-padded"  >
                       
                        <div class="row  bg-enabled  border-visible">
                            <div class="col-xs-12  ">
                                <div class="row">
                                    <div class="col-xs-12 show-margin">
                                        <h4>Alumni Director</h4>
                                         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
                                    <div class="row">
                                        <div class="col-xs-12 highlighted-div"></div>
                                    </div>
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 show-margin">
                                        <h4>College Coordinator</h4>
                                         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
                                        <div class="row">
                                            <div class="col-xs-12 highlighted-div"></div>
                                        </div>
                                    </div>
                                </div>
                                
                                 <div class="row">
                                    <div class="col-xs-12 show-margin">
                                        <h4>College Coordinator</h4>
                                         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
                                        <div class="row">
                                            <div class="col-xs-12 highlighted-div"></div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-xs-12 show-margin">
                                        <h4>College Coordinator</h4>
                                         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
                                        <div class="row">
                                            <div class="col-xs-12 highlighted-div"></div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-xs-12 show-margin">
                                        <h4>College Coordinator</h4>
                                         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
                                        <div class="row">
                                            <div class="col-xs-12 highlighted-div"></div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-xs-12 show-margin">
                                        <h4>College Coordinator</h4>
                                         <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
                                        <div class="row">
                                            <div class="col-xs-12 highlighted-div"></div>
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
