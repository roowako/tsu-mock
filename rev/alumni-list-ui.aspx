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
                  
                </div><!--/.navbar-collapse -->
                </div>
            </nav>-->

                 <!-- Start content here -->
            <div class="container-fluid">
                <div class="row">
                   <!--#include file="./includes/sidebar-director.inc"-->


                    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                       
                        <div class="row">
                            <div class="col-sm-4"> <h3 class="page-header"><span class="glyphicon glyphicon-list-alt">&nbsp;</span>List of Alumni</h3>
                                 <h5>Color Legend : <a href="#" class="btn btn-success btn-sm" style="height:18px;border-radius:0px;"> </a> &nbsp;Alumni &nbsp;<a href="#" class="btn btn-warning btn-sm" style="height:18px;border-radius:0px;"> </a> Graduating</h5>
                                <br /><br />
                            </div>
                            
                            <div class="col-sm-5">
                                <div class="input-group">
                                    <div class="input-group-addon">Search</div>
                                    <input type="text" name="name" value=" " class="form-control" id="q" autocomplete="off"/>
                                </div>
                                <div class="row" >
                                  
                                    <div class="col-xs-2"></div>
                                    <div class="col-xs-10 resultContainer "></div>
                                </div>
                            </div>
                            <div class="col-xs-3">
                                 <ul class="right-action-buttons form-inline">
                                    
                                   <li><a href="#" ><span class="glyphicon glyphicon-cog"></span> </a></li>
                                   <li><a href="#"><span class="glyphicon glyphicon-home"></span> </a></li>
                                    <li><a href="#">Log out</a></li>
                                    
                                  </ul>
                             </div>
                        </div>
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-6 col-sm-9 placeholder form-group">
                             
                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="input-group">
                                            <div class="input-group-addon">Sort by:</div>
                                             <asp:DropDownList ID="sortBy" runat="server" CssClass="form-control" ClientIDMode="Static">
                                             <asp:ListItem Text="All" Value="all"/>
                                             <asp:ListItem Text="Alumni" Value="alumni"/>
                                             <asp:ListItem Text="Graduating" Value="graduating"/>
                                        </asp:DropDownList>
                                        </div>
                                       
                            
                                    </div>

                                    <div class="col-xs-5">
                                         <asp:DropDownList ID="filterCourse" runat="server" CssClass="form-control">
                                          
                                        </asp:DropDownList>
                            
                                    </div>

                                    <div class="col-xs-2">
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
                               
                                <br />
                                    <div class="table-responsive">
                                        <br />
                                       
                                        <br /><br />
                                        <table class="table table-hover searchableTable" id="searchableTable">
                                            <thead>

                                           
                                            <tr>
                                                <td><span class="glyphicon glyphicon-th-list"></span></td>  
                                                <td>Fullname</td>
                                               
                                                <td>Course</td>
                                                <td>Year Graduated</td>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
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
          //Modal form
   
<div class="modal fade bs-example-modal-lg  fullNamePlaceholder" tabindex="-1" role="dialog" aria-labelledby="ddd" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
        <div class="modal-body">
         <div class="table-responsive">
            <table class="table table-hover" id="accountInfoPlaceholder">
                <thead>
                <tr>
                    <td><span class="glyphicon glyphicon-th-list"></span></td>  
                    <td>Adress</td>
                    <td>Contact Number</td>
                    <td>E-mail Address</td>
                    <td>Birthday</td>
                    <td>Citizenship</td>
                    <td>Religion</td>
                    <td>Marital Status</td>
                    <td>Gender</td>
                </tr>
                </thead>       
                <tbody>

                </tbody>                           
            </table>
        </div>
      </div>
      <div class="modal-footer">
          <div class="container">
              <div class="row">
                  
                  <div class="col-xs-9">
                      <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                  </div>
              </div>
          </div>
        
        
        
      </div>
    </div>
  </div>
</div>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script>
        $(document).ready(function () {
            var sortBy = $("#sortBy option:selected").val();
           
            $.ajax({
                type: "post",
                url: "alumni-list-ui.aspx/pullAll",
                data: "{'sortBy':'" + sortBy + "'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    data = response.d;
                    data = jQuery.parseJSON(data);
                    $.each(data, function (i, o) {
                        if (o.userlevel_idfk == 2) {
                            var mod = ("<tr class='success'>" +
                                "<td> " + o.account_idpk + " </td>" +
                                "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                "<td> " + o.description + " </td>" +
                                "<td></td>" +
                                "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'> View info </a> </td>" +
                            "</tr>");
                        } else {
                            var mod = ("<tr class='warning'>" +
                                "<td> " + o.account_idpk + " </td>" +
                                "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                "<td> " + o.description + " </td>" +
                                "<td></td>" +
                                "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'> View info </a> </td>" +
                            "</tr>");
                        }
                        $(".searchableTable tbody").append(
                                mod
                            );
                    });
                    $(".viewAccountInfo").click(function () {

                        accId = $(this).data("account-id");
                        $("#accountInfoPlaceholder tbody ").html("");
                        $.ajax({
                            type: "post",
                            url: "alumni-list-ui.aspx/fetchAccountInfo",
                            data: "{'accId':'" + accId + "'}",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (approvalResponse) {
                                response = approvalResponse.d;
                                response = jQuery.parseJSON(response);
                                $.each(response, function (i, o) {
                                    console.log(o.student_id);


                                    $("#myModalLabel").text(o.given_name + "  " + o.middle_name + " " + o.family_name);


                                    $(".update-sudnumber").attr("data-id", o.account_idpk);
                                    if (o.student_id == "") {
                                        $("#studNumberPlacer").removeAttr("disabled");
                                        $(".update-sudnumber").removeAttr("disabled");
                                    } else {
                                        $(".update-sudnumber").attr("disabled", "disabled");
                                        $("#studNumberPlacer").attr("disabled", "disabled");
                                        $("#studNumberPlacer").val(o.student_id);
                                    }
                                    $("#accountInfoPlaceholder tbody").append(

                                            "<tr>" +

                                                "<td> " + o.account_idpk + " </td>" +
                                                "<td> " + o.address + " </td>" +
                                                "<td> " + o.telephone_number + " </td>" +
                                                "<td> " + o.email_address + " </td>" +
                                                "<td> " + o.birthday + " </td>" +
                                                "<td> " + o.citizenship + " </td>" +
                                                "<td> " + o.religion + " </td>" +
                                                "<td> " + o.marital_status + " </td>" +
                                                "<td> " + o.gender + " </td>" +
                                            "</tr>"


                                        );
                                });
                            }
                        });
                    });
                    console.log(response.d);
                }
            });
            $("#sortBy").change(function () {
                var sortBy = $("#sortBy option:selected").val();
                var legend;
                if (sortBy == "alumni") {
                    legend = "success";
                } else if(sortBy == "graduating"){
                    legend = "warning"
                }
                $("#searchableTable tbody").html("");
                console.log(sortBy);
                $.ajax({
                    type: "post",
                    url: "alumni-list-ui.aspx/pullAll",
                    data: "{'sortBy':'" + sortBy + "'}",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        data = response.d;
                        data = jQuery.parseJSON(data);
                        $.each(data, function (i, o) {
                            if(o.userlevel_idfk == 2){
                                var mod = ("<tr class='success'>" +
                                    "<td> " + o.account_idpk + " </td>" +
                                    "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                    "<td> " + o.description + " </td>" +
                                    "<td></td>" +
                                    "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'> View info </a> </td>" +
                                "</tr>");
                            } else {
                                var mod = ("<tr class='warning'>" +
                                    "<td> " + o.account_idpk + " </td>" +
                                    "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                    "<td> " + o.description + " </td>" +
                                    "<td></td>" +
                                    "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg' > View info </a> </td>" +
                                "</tr>");
                            }
                            $(".searchableTable tbody").append(
                                    mod
                                );
                        });
                        $(".viewAccountInfo").click(function () {

                            accId = $(this).data("account-id");
                            $("#accountInfoPlaceholder tbody ").html("");
                            $.ajax({
                                type: "post",
                                url: "alumni-list-ui.aspx/fetchAccountInfo",
                                data: "{'accId':'" + accId + "'}",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (approvalResponse) {
                                    response = approvalResponse.d;
                                    response = jQuery.parseJSON(response);
                                    $.each(response, function (i, o) {
                                        console.log(o.student_id);


                                        $("#myModalLabel").text(o.given_name + "  " + o.middle_name + " " + o.family_name);


                                        $(".update-sudnumber").attr("data-id", o.account_idpk);
                                        if (o.student_id == "") {
                                            $("#studNumberPlacer").removeAttr("disabled");
                                            $(".update-sudnumber").removeAttr("disabled");
                                        } else {
                                            $(".update-sudnumber").attr("disabled", "disabled");
                                            $("#studNumberPlacer").attr("disabled", "disabled");
                                            $("#studNumberPlacer").val(o.student_id);
                                        }
                                        $("#accountInfoPlaceholder tbody").append(

                                                "<tr>" +

                                                    "<td> " + o.account_idpk + " </td>" +
                                                    "<td> " + o.address + " </td>" +
                                                    "<td> " + o.telephone_number + " </td>" +
                                                    "<td> " + o.email_address + " </td>" +
                                                    "<td> " + o.birthday + " </td>" +
                                                    "<td> " + o.citizenship + " </td>" +
                                                    "<td> " + o.religion + " </td>" +
                                                    "<td> " + o.marital_status + " </td>" +
                                                    "<td> " + o.gender + " </td>" +
                                                "</tr>"


                                            );
                                    });
                                }
                            });
                        });
                       
                        console.log(response.d);
                    }
                });
            });

            $("#q").bind("keyup", function (event) {
                $(this).search(event);
            });
            
        });

        $.fn.search =function(event){
            var ESC = 27;
            var SPACE = 32;
            var BACKSPAE = 8;
            event.preventDefault();
            var key = event.which || event.keyCode;
            var input = $(this).val().trim();
            var f = input.match(/^[a-zA-Z\s]+$/);
           
            if (key !== ESC && key !== BACKSPAE) {
                $(".resultContainer").html("");
                $("#searchableTable tbody").html("");
                
                $.ajax({
                    type: "post",
                    url: "alumni-list-ui.aspx/searchQ",
                    data: "{'q':'" +f + "'}",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                 
                        if (response.d == "[]") {
                            $(".resultContainer").addClass("animateOnDisplay");
                            $(".resultContainer").append("<br>"+"No results found for "+"<span>"+ input+" </span>");
                           
                                
                            }else {
                                data = response.d;
                                data = jQuery.parseJSON(data);
                                $.each(data, function (i, o) {
                                    
                                    var last = data.length;
                                    $(".resultContainer").html("");
                                    $(".resultContainer").append("<br>" + "Found " + "<span>" + last + " result(s) for "+ input +" </span>");
                                 
                                    
                                    var mod = ("<tr class='warning'>" +
                                    "<td> " + o.account_idpk + " </td>" +
                                    "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                    "<td> " + o.description + " </td>" +
                                    "<td></td>" +
                                    "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'> View info </a> </td>" +
                                     "</tr>");
                                    $(".resultContainer").addClass("animateOnDisplay");
                                  
                                    $(".searchableTable tbody").append(
                                       mod
                                   );
                                });

                                $(".viewAccountInfo").click(function () {

                                    accId = $(this).data("account-id");
                                    $("#accountInfoPlaceholder tbody ").html("");
                                    $.ajax({
                                        type: "post",
                                        url: "pending-reg-ui.aspx/fetchAccountInfo",
                                        data: "{'accId':'" + accId + "'}",
                                        dataType: "json",
                                        processData: false,
                                        traditional: true,
                                        contentType: "application/json; charset=utf-8",
                                        success: function (approvalResponse) {
                                            response = approvalResponse.d;
                                            response = jQuery.parseJSON(response);
                                            $.each(response, function (i, o) {
                                                console.log(o.student_id);


                                                $("#myModalLabel").text(o.given_name + "  " + o.middle_name + " " + o.family_name);


                                                $(".update-sudnumber").attr("data-id", o.account_idpk);
                                                if (o.student_id == "") {
                                                    $("#studNumberPlacer").removeAttr("disabled");
                                                    $(".update-sudnumber").removeAttr("disabled");
                                                } else {
                                                    $(".update-sudnumber").attr("disabled", "disabled");
                                                    $("#studNumberPlacer").attr("disabled", "disabled");
                                                    $("#studNumberPlacer").val(o.student_id);
                                                }
                                                $("#accountInfoPlaceholder tbody").append(

                                                        "<tr>" +

                                                            "<td> " + o.account_idpk + " </td>" +
                                                            "<td> " + o.address + " </td>" +
                                                            "<td> " + o.telephone_number + " </td>" +
                                                            "<td> " + o.email_address + " </td>" +
                                                            "<td> " + o.birthday + " </td>" +
                                                            "<td> " + o.citizenship + " </td>" +
                                                            "<td> " + o.religion + " </td>" +
                                                            "<td> " + o.marital_status + " </td>" +
                                                            "<td> " + o.gender + " </td>" +
                                                        "</tr>"


                                                    );
                                            });
                                        }
                                    });
                                });
                            }
                            
                        
                    }

                });
            } else if (key == BACKSPAE) {
                if(input == ""){
                    $("#searchableTable tbody").loadDef();
                }
                $(".resultContainer").removeClass("animateOnDisplay");
               
            }
            

        }

        $.fn.loadDef = function (event) {
           
            var sortBy = $("#sortBy option:selected").val();
            var legend;
            if (sortBy == "alumni") {
                legend = "success";
            } else if (sortBy == "graduating") {
                legend = "warning"
            }
            $("#searchableTable tbody").html("");
            console.log(sortBy);
            $.ajax({
                type: "post",
                url: "alumni-list-ui.aspx/pullAll",
                data: "{'sortBy':'" + sortBy + "'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    data = response.d;
                    data = jQuery.parseJSON(data);
                    $.each(data, function (i, o) {
                        if (o.userlevel_idfk == 2) {
                            var mod = ("<tr class='success'>" +
                                "<td> " + o.account_idpk + " </td>" +
                                "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                "<td> " + o.description + " </td>" +
                                "<td></td>" +
                                "<td> <a class='btn btn-primary btn-sm' viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'> View info </a> </td>" +
                            "</tr>");
                        } else {
                            var mod = ("<tr class='warning'>" +
                                "<td> " + o.account_idpk + " </td>" +
                                "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                "<td> " + o.description + " </td>" +
                                "<td></td>" + 
                                "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'> View info </a> </td>" +
                            "</tr>");
                        }
                        $(".searchableTable tbody").append(
                                mod
                            );
                    });
                    $(".viewAccountInfo").click(function () {

                        accId = $(this).data("account-id");
                        $("#accountInfoPlaceholder tbody ").html("");
                        $.ajax({
                            type: "post",
                            url: "alumni-list-ui.aspx/fetchAccountInfo",
                            data: "{'accId':'" + accId + "'}",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (approvalResponse) {
                                response = approvalResponse.d;
                                response = jQuery.parseJSON(response);
                                $.each(response, function (i, o) {
                                    console.log(o.student_id);


                                    $("#myModalLabel").text(o.given_name + "  " + o.middle_name + " " + o.family_name);


                                    $(".update-sudnumber").attr("data-id", o.account_idpk);
                                    if (o.student_id == "") {
                                        $("#studNumberPlacer").removeAttr("disabled");
                                        $(".update-sudnumber").removeAttr("disabled");
                                    } else {
                                        $(".update-sudnumber").attr("disabled", "disabled");
                                        $("#studNumberPlacer").attr("disabled", "disabled");
                                        $("#studNumberPlacer").val(o.student_id);
                                    }
                                    $("#accountInfoPlaceholder tbody").append(

                                            "<tr>" +

                                                "<td> " + o.account_idpk + " </td>" +
                                                "<td> " + o.address + " </td>" +
                                                "<td> " + o.telephone_number + " </td>" +
                                                "<td> " + o.email_address + " </td>" +
                                                "<td> " + o.birthday + " </td>" +
                                                "<td> " + o.citizenship + " </td>" +
                                                "<td> " + o.religion + " </td>" +
                                                "<td> " + o.marital_status + " </td>" +
                                                "<td> " + o.gender + " </td>" +
                                            "</tr>"


                                        );
                                });
                            }
                        });
                    });
                    console.log(response.d);
                }
            });
        }
    </script>
</body>
</html>
