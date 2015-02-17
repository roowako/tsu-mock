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
                    <a class="navbar-brand extended-brand " href="./coordinator-custom.aspx">
                        <span class="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="./assets/images/TSULOGO.png" Height="55" Width="55" CssClass="img-float-nav" />
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
                    <div class="col-sm-3 col-md-2 sidebar">  <!--side-bar -->
	                       <ul class="nav nav-sidebar">
		                        <li>
			                        <a href="#" >

				                        <asp:Image ID="Image2" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="75" Width="75" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />          

			                        </a>

		                        </li>
		                        <li><a href="#" class="bolder"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a></li>
		                        <li>
			                        <br />
		                        </li>
		                        <li><a href="./coordinator-custom.aspx" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline</a></li>
		                        <li><a href="./messaging-ui.aspx" ><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Messages</a></li>
		                        <li><a href="./poll-generator-ui.aspx"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Survey</a></li>
		                        <li><a href="./statistics-coordinator.aspx"><span class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;Statistics</a></li>
		                        <li><a href="./token-generator-ui.aspx"><span class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;Tokens</a></li>
		  
		                        <li><a href="#" id="alumni_logout" runat="server"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;Log out</a></li>
                                <li>
                                     <asp:TextBox ID="account_idpk" runat="server"></asp:TextBox>
                                     <asp:TextBox ID="college_idfk" runat="server"></asp:TextBox>
                                </li>
	                        </ul>
                    </div>
                     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                         <h3 class="page-header"><span class="glyphicon glyphicon-star">&nbsp;</span>Generate Tokens</h3>
                         <div class="row placeholders">
                             <br />
                            <!-- start main-content -->
                             <div class="col-xs-10 col-sm-10 placeholder  ">
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
                                                             <td></td>
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
            var status;
            var college_fk = $("#college_idfk").val();
            console.log(college_fk);

            //GENERATE TOKENS
            $("#btn_generate_tokens").click(function (e) {
                e.preventDefault();
                var keyNumber = $("#generate_number_of_tokens").val();
                var college_fk = $("#college_idfk").val();

                try{
                    parseInt(keyNumber)
                }
                catch (err) {
                    alert(err.message)
                }
                finally {
                    $.ajax({
                        type: "post",
                        url: "./token-generator-ui.aspx/generateTokens",
                        data: "{'keyNumber':'" + keyNumber + "','college_idfk':'" + college_fk + "'}",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (r) {
                            alert(r.d);
                            window.location.reload(true);
                        }
                    });
                }                 
            });

            //FETCH TOKENS
            $.ajax({
                type: "post",
                url: "./token-generator-ui.aspx/pullFromServer",
                data:"{'college':'"+ college_fk +"'}",
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
                                "<td class='green'> " + status + " </td>" +
                                "<td><span class='glyphicon glyphicon-ok green'> &nbsp;</span> </td>"+
                            "</tr>"
                            );
                    });
                }
            });
        });
    </script> 

</body>
</html>
