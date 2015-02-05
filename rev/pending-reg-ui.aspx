<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pending-reg-ui.aspx.vb" Inherits="rev_pending_reg_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <<title>Pending Registrations</title>
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
                   <!--#include file="./includes/sidebar-director.inc"-->


                    <div class="col-sm-12 col-sm-offset-3 col-md-10 col-md-offset-2 main ">
                        <h3 class="page-header"><span class="glyphicon glyphicon-home">&nbsp;</span>Pending Registrations</h3>
                        <div class="row placeholders " >
                            <br />
                            <!-- start main-content -->
                            <div class="col-xs-12 col-sm-12 placeholder  ">
                                <div class="row">
                                    <div class="col-xs-12 table-responsive">
                                        <div class="" style="border-top:0px !important;">
                                            <table class="table table-hover pagination" style="border-top:0px !important;" id="pendingPlaceholder">
                                                <thead>
                                                <tr>
                                                    <td><span class="glyphicon glyphicon-th-list"></span></td>
                                                   
                                                    <td>Fullname</td>
                                                    <td>College</td>
                                                    <td>Course</td>
                                              

                                                </tr>
                                                </thead>
                                                <tbody>
                                               
                                                 </tbody>          
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                 
                              
                            
                              
                              
                            </div>
                            <!-- end main-content -->

                            <!-- star spacer -->
                            
                             <!-- end spacer -->
                           

                            <!-- start right-side -->
                            
                            <!-- end right-side -->

                        </div>
                    </div>

                </div>
            </div>

            <!-- End content here -->
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
                  <div class="col-xs-3">
                      <input type="text" name="name" value=" " class="form-control numberPlacer" id="studNumberPlacer" placeholder="Please provide student number."/>
                     
                  </div>
                  <div class="col-xs-2">
                      
                       <input type="button" name="name" value="Update Student Number" class="btn btn-success update-sudnumber"/>
                  </div>
                  <div class="col-xs-4">
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
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
   

    <script type="text/javascript">
        $(document).ready(function () {
         
            $.ajax({
                type: "post",
                url: "./pending-reg-ui.aspx/pullFromServer",
                dataType:"json",
                contentType: "application/json; charset=utf-8",
              
            
                success: function (r) {
                    console.log(r.d);
                    data = r.d;
                    data = jQuery.parseJSON(data);

                    $.each(data, function (i, o) {
                        var name = o.given_name +  " " + o.family_name;
                      
                        $("#pendingPlaceholder tbody").append(
                            "<tr id='" + o.account_idpk +"' class='success'>" +
                                "<td> " + o.account_idpk + "  </td>" +
                                "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                "<td> College of Engineering </td>" +
                                "<td> Somewhere down the road </td>" +
                                "<td> <a class='btn btn-primary btn-sm viewAccountInfo' id='viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'>Vew info</a> </td>" +
                                "<td>  <a class='btn btn-success btn-sm btnApproveAccount' id='btnApproveAccount' data-acc-id='"+ o.account_idpk +"' data-email='" + o.email_address + "' data-name='" + name + "' data-stud-id='" + o.student_id + "'>Approve</a> <a class='btn btn-warning btn-sm' id='btnRejectAccount' data-acc-id='"+ o.account_idpk +"'>Reject</a></td>" +
                               
                            "</tr>"
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
                                        $("#studNumberPlacer").attr("disabled","disabled");
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
                    $(".btnApproveAccount").click(function () {
                        var accId = $(this).data("acc-id");
                        var email = $(this).data("email");
                        var name = $(this).data("name");
                        var id = $(this).data("stud-id");
                        console.log(accId);
                        if( id == ""){
                            alert("Please provide a student number.");
                        } else{

                
                       
                        $.ajax({
                            type: "post",
                            url: "pending-reg-ui.aspx/approveAccount",
                            data: "{'accId':'" + accId + "','emailAdd' :'"+ email +"','name':'" + name + "','id':'" + id + "'}",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (approvalResponse) {
                              
                                alert("Account Approved");
                                window.location.reload(true);
                                console.log(o.account_idpk);
                               
                              
                            }
                                });
                        }
                    });

                    $("#btnRejectAccount").click(function () {
                        var accId = $(this).data("acc-id");
                        console.log(accId);
                        $.ajax({
                            type: "post",
                            url: "pending-reg-ui.aspx/rejectAccount",
                            data: "{'accIdTobeRejected':'" + accId + "'}",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (approvalResponse) {

                                alert("Account Rejected");
                               

                            }
                        });
                    });

                }

            });

            $(".update-sudnumber").click(function (e) {
                e.preventDefault();
                var studNumber = $("#studNumberPlacer").val();
                var accountId = $(this).data("id");
                $.ajax({
                    type: "post",
                    url: "pending-reg-ui.aspx/updateStudentNumber",
                    data: "{'studNmber':'" + studNumber + "','accId':'"+ accountId +"'}",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (approvalResponse) {

                        alert("Updated!");
                        window.location.reload(true);

                    }
                });
            });
        });
    </script>
</body>
</html>
