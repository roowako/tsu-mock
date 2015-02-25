<%@ Page Language="VB" AutoEventWireup="false" CodeFile="reset-password.aspx.vb" Inherits="reset_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
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

                           
                    </div>
                        
                        
                        
                </div><!--/.navbar-collapse -->
                       
                </div>
            </nav>


             <div class="container pulled-down">
                <br /><br /><br /><br />
                <div class="row ">
                    <div class="col-sm-8 ">
                        <div class="row">
                         
                            <div class="col-xs-5"></div>
                            <div class="col-xs-7">
                                <div class="form-group">
                                   <span><b style="font-size:16px;">Hello <asp:Label ID="u" runat="server" Text=""></asp:Label>,</b>&nbsp; <span>one more step to go.</span></span> 
                                </div>
                                 
                               
                                <div class="form-group">
                                    <input type="password" placeholder="Please enter your new password" class="form-control" id="u_one"/>
                                </div>
                                <span></span>
                                <div class="form-group">
                                    <input type="password" placeholder="Confirm your new password" class="form-control" " id="u_two"/>
                                </div>
                                <div class="form-group">
                                    <span>Password must be atleast 8 characters long.</span>
                                    <div class="row">
                                        
                                        <div class="col-sm-5">
                                            <br />
                                            <input type="button"  class="btn btn-primary btn-sm"  value="Reset my password" id="btnReset"/>
                                            
                                        </div>
                                        
                                        
                                        <div class="col-sm-7 " style="text-align:right">
                                            <asp:Label ID="uid_u" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="umail" runat="server" Text=""></asp:Label>
                                            <asp:Button ID="trigger" runat="server" Text="Button" ClientIDMode="Static" />
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
        var uid = $("#uid_u").text();
        var umail = $("#umail").text();
        $("#btnReset").click(function () {
            var p1 = $("#u_one").val(),
                p2 = $("#u_two").val();
            if (p1 == "" || p2 == "") {
                $("#resultMailer").addClass("btn-danger");
                $("#resultMailer").html("All fields are required.").fadeIn('slow').delay(2000).fadeOut('slow');
            } else if (p1 != p2) {
                $("#resultMailer").removeClass("btn-danger");
                $("#resultMailer").addClass("btn-info");
                $("#resultMailer").html("Password didn't match.").fadeIn('slow').delay(2000).fadeOut('slow');
            } else {

                if (p1.length < 8 ) {
                    $("#resultMailer").removeClass("btn-danger");
                    $("#resultMailer").addClass("btn-info");
                    $("#resultMailer").html("Password must be atleast 8 characters long.").fadeIn('slow').delay(2000).fadeOut('slow');
                } else if( p2.length > p1.length){
                    $("#resultMailer").removeClass("btn-danger");
                    $("#resultMailer").addClass("btn-info");
                    $("#resultMailer").html("Password didn't match.").fadeIn('slow').delay(2000).fadeOut('slow');
                }else if(p2.length == p1.length && p2 == p1) {
                
                    $("#resultMailer").removeClass("btn-info");
                    $("#resultMailer").addClass("btn-success");
                    $.ajax({
                        type: "post",
                        url: "./reset-password.aspx/update",
                        data: "{'uid':'" + uid + "','p':'" + p1 + "','umail':'" + umail + "'}",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (r) {
                            $("#resultMailer").removeClass("btn-info");
                            $("#resultMailer").addClass("btn-success");
                           
                            $("#resultMailer").html(r.d).fadeIn('slow').delay(3000).fadeOut('slow');
                            $("#trigger").click();
                            p1 == ""
                            p2 == ""
                            console.log(r.d);
                            
                        }

                    });
                }
            }
        });
    </script>
</body>
</html>
