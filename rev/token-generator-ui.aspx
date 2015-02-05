<%@ Page Language="VB" AutoEventWireup="false" CodeFile="token-generator-ui.aspx.vb" Inherits="token_generator_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Tokens</title>
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
                    <!--#include file="./includes/sidebar-coordinator.inc"-->
                     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                         <h3 class="page-header"><span class="glyphicon glyphicon-star">&nbsp;</span>Generate Tokens</h3>
                         <div class="row placeholders">
                             <br />
                            <!-- start main-content -->
                             <div class="col-xs-6 col-sm-6 placeholder  ">
                                 <div class="row">
                                     <div class="col-xs-12 ">
                                         <h4 class="header-padded "></h4>
                                         <div class="row">
                                             <div class="col-xs-4 ">
                                                 <div class="form-group">
                                                    
                                                     <asp:TextBox ID="generate_number_of_tokens" runat="server" CssClass="form-control" placeholder="Input number"></asp:TextBox>
                                                 </div>
                                            </div>

                                             <div class="col-xs-4">
                                                 <div class="form-group">
                                                     <asp:Button ID="btn_generate_tokens" runat="server" Text="Generate Tokens" CssClass="form-control btn btn-success" />
                                                 </div>
                                             </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class="form-group">
                                                    <h5>List of tokens</h5>
                                                </div>
                                            </div>
                                        </div>

                                         <div class="row">
                                             <div class="col-xs-12">
                                                 <div class="table-responsive">
                                                     <table class="table table-hover" id="tokenHolder">
                                                         <tr>
                                                             <td><span class="glyphicon glyphicon-th-list"></span></td>
                                                             <td>Token</td>
                                                             <td>Status</td>
                                                         </tr>
                                                       
                                                     </table>
                                                 </div>
                                             </div>
                                         </div>
                                    </div>

                                </div>
                             </div>
                              
                             <div class="col-xs-1 ">
                               
                             </div>

                             <div class="col-xs-5">
                                 <div class="row">
                                    <div class="col-xs-12">
                                        <div class="form-group">
                                            <h5>Used Tokens</h5>
                                        </div>
                                    </div>
                                </div>
                                  <div class="row">
                                      
                                        <div class="col-xs-12">
                                            <div class="table-responsive">
                                                <table class="table table-hover" >
                                                    <tr>
                                                        <td><span class="glyphicon glyphicon-th-list"></span></td>
                                                        <td>Token</td>
                                                        <td>Token granted for  </td>
                                                    </tr>
                                                   <tbody>

                                                   </tbody>
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
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script type="text/javascript" src="./js/horizBarChart.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
    <script>
        $(document).ready(function () {
            $("#btn_generate_tokens_wew").click(function (e) {
                e.preventDefault();
                var keyNumber = $("#generate_number_of_tokens").val();
                $.ajax({
                    type: "post",
                    url: "token-generator-ui.aspx/generateTokens",
                    data: "{ 'numKey':'" +keyNumber+"'}",
                    contentType: "application/json; charset=utf-8",
                    processData: false,
                    traditional: true,
                    success: function (genResponse) {
                        console.log(genResponse.d);
                    }
                })
            });

            var status;
            $.ajax({

                type: "post",
                url: "./token-generator-ui.aspx/pullFromServer",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (r) {
                   
                    data = r.d
                    data = jQuery.parseJSON(data)
                    $.each(data, function (i,o) {
                        if (o.status == 0) {
                            status = "Active";
                        } else {
                            status = "Granted";
                        }

                        $("#tokenHolder tbody").append(
                            
                           
                            "<tr>" +
                                "<td class='green'> " + o.token_idpk + " </td>" +
                                "<td class='green'> " + o.description + " </td>" +
                                "<td class='green'> " + status + " <span class='glyphicon glyphicon-ok green'> &nbsp;</span></td>" +
                            "</tr>"
                            );
                    });
                }
            });
        });
    </script> 

</body>
</html>
