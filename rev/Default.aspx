<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="loginpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log in Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/custom.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contain-fluid">
            <nav class="navbar navbar-inverse navbar-fixed-top shadowed default-theme"> 
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
                                <asp:Image ID="Image1" style="float:left;" runat="server"  ImageUrl="./assets/images/TSULOGO.png" Height="60" Width="60" />
                                <h4 style="float:left;margin-left:30px;margin-top:20px;"> Tarlac State University</h4>
                               </span>

                            <div class="clearfix">
                                
                            </div>
                        </a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse" > <!---collapse collapse -->
                        
                         <br />
                        <div class="navbar-form navbar-right">

                           
                       </div>
                        
                        
                        
                    </div><!--/.navbar-collapse -->
                       
                    </div>
            </nav>

             <div class="container pulled-down">
                <div class="row ">
                    <div class="col-sm-3">
                        <div class="clearfix">
                            <asp:Label runat="server" ID="login_result"></asp:Label>
                        </div>                                  
                    </div>

                    <div class="col-sm-4 pull-me-down">  
                        <div class="form-group">
                            <label>Student ID Number</label>
                            <asp:TextBox ID="txtLog_Username" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <asp:TextBox ID="txtLog_Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnLogin" runat="server" Text="Sign in"  CssClass="btn btn-success btn-sm"/>
                            &nbsp;<a href="./loginpage.aspx" class="btn btn-warning btn-sm">Create account</a>
                            &nbsp; <a href="./password-recovery.aspx">Forgot your password?</a>
                        </div>
                           
                       
                    </div>
                     <div class="col-sm-3">
                        <div class="clearfix">
                            <asp:Label runat="server" ID="Label1"></asp:Label>
                        </div>                                  
                    </div>
            </div>
                 
        </div>
            <div class="container-fluid">
                <div class="row">
                     <div class="col-sm-12" style="background:#fff;position:absolute;bottom:0;padding:30px;border-top:thin solid #eee;">
                         <div class="row">
                             <div class="col-sm-3"></div>
                             <div class="col-sm-6">
                                 <div class="form-group">
                                     <br />
                                     <h5 style="padding-left:10px;">&nbsp;&nbsp;&nbsp;Tarlac State University Alumni Tracer &copy; 2015.&nbsp; All rights reserved.</h5>
                                    
                                 </div>
                                
                             </div>
                             <div class="col-sm-3"></div>
                         </div>

                     </div>
                 </div>
            </div>
    </form>
</body>
</html>
