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
                           <a href="./loginpage.aspx" class="btn btn-warning btn-sm">Create account</a>
                           <a href="./Default.aspx" class="btn btn-success btn-sm">Sign in</a>
                       </div> 
                       
                    </div><!--/.navbar-collapse -->
                       
                    </div>
            </nav>-->

            <!-- Content -->
            <div class="container pulled-down">
                <div class="row ">
                    <div class="col-sm-8 ">
                        <div class="row">
                            <div class="col-xs-8">
                                <h5> Please provide your email address used in your registration to reset your password.</h5>
                                <div class="form-group">
                                    <input type="text" placeholder="Email Address" class="form-control" id="mail" />
                                </div>
                                <div class="form-group">
                                    <input type="button"  class="btn btn-success btn-sm"  value="Reset password" id="getMail"/>
                                </div>
                                <div class="form-group">
                                    <div id="resultMailer"></div>
                                </div>
                            </div>
                        </div>                                
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
                    data: "{'recoveryMail':'" + mail + "'}",
                    dataType: "json",
                    async:true,
                    contentType: "application/json; charset=utf-8",

                    success: function (r) {
                        console.log(r.d);
                        if (r.d == "[]") {
                            $("#resultMailer").html("Sorry we can't seem to find the email address you've provided.");
                        } else {
                            console.log("s");
                        }
                    }
                    });
               
            });
        });
    </script>
</body>
</html>
