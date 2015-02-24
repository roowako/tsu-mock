<%@ Page Language="VB" AutoEventWireup="false" CodeFile="password-recovery.aspx.vb" Inherits="rev_password_recovery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Password Recovery</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/custom.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
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
                         <a href="./Default.aspx" class="btn btn-success btn-sm">Sign in</a>
                          <a href="./loginpage.aspx" class="btn btn-warning btn-sm">Create account</a>
                          
                       </div> 
                       
                    </div><!--/.navbar-collapse -->
                       
                    </div>
            </nav>-->

            <!-- Content -->
            <div class="container pulled-down">
                <br /><br /><br /><br />
                <div class="row ">
                    <div class="col-sm-8 ">
                        <div class="row">
                            <div class="col-xs-5"></div>
                            <div class="col-xs-7">
                                <h4> Find your account.</h4>
                                <div class="form-group">
                                    <input type="text" placeholder="" class="form-control" id="mail" />
                                </div>
                                <div class="form-group">
                                    <p>Email, Phone, Student ID or Fullname.</p>
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <input type="button"  class="btn btn-primary btn-sm"  value="Search account" id="getMail"/>
                                        </div>
                                        
                                        
                                        <div class="col-sm-7 " style="text-align:right">
                                            <asp:Button ID="trigger" runat="server" Text="Button" ClientIDMode="Static" OnClick="sendResetTemplate" />
                                        </div>
                                    </div>
                                    
                                    
                                  
                                    
                                </div>
                                <div class="form-group">
                                    <br />
                                    <div id="resultMailer" class="form-control"></div>
                                </div>
                            </div>
                        </div>                                
                    </div>

                 



                     
            </div>
               
                </div>
        </div>
        <div class="container-fluid">
                <div class="row">
                     <div class="col-sm-12" style="background:#fff;position:absolute;bottom:0;padding:30px;border-top:thin solid #eee;">
                         <div class="row">
                             <div class="col-sm-4"></div>
                             <div class="col-sm-4">
                                 
                                     <br />
                                     <h5>Tarlac State University Alumni Tracer &copy; 2015.&nbsp; All rights reserved.</h5>
                               
                                
                             </div>
                             <div class="col-sm-4"></div>
                         </div>

                     </div>
                 </div>
            </div>
    </form>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {

            $("#getMail").click(function (e) {
              
                var mail = $("#mail").val();
                console.log(mail);
              
                    $.ajax({
                    type: "post",
                    url: "./password-recovery.aspx/pullMail",
                    data: "{'r':'" + mail + "'}",
                    dataType: "json",
                    async:true,
                    contentType: "application/json; charset=utf-8",

                    success: function (r) {
                        console.log(r.d);
                        if (r.d == "None") {
                            $("#resultMailer").removeClass("btn-success");
                            $("#resultMailer").addClass("btn-warning");
                            $("#resultMailer").fadeIn('slow').delay(4000).fadeOut('slow');
                            $("#resultMailer").html("Please try again with other information.");
                        } else {
                            $("#resultMailer").removeClass("btn-warning");
                            $("#resultMailer").addClass("btn-success");
                            $("#resultMailer").fadeIn('slow').delay(3500).fadeOut('slow');
                            $("#resultMailer").html("Please check your email for further instructions. Thank you.");
                            $("#trigger").click();
                        }
                    }
                    });
               
            });
        });
    </script>
</body>
</html>
