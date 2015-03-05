<%@ Page Language="VB" AutoEventWireup="false" CodeFile="alumni-profile.aspx.vb" Inherits="rev_alumni_profile"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
    <link href="./css/sidebar-theme.css" rel="stylesheet" />
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
                    <a class="navbar-brand extended-brand "  runat="server" id="dyna">
                        <span class="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="./assets/images/TSULOGO.png" Height="55" Width="55" CssClass="img-float-nav" />
                            <h3>&nbsp;&nbsp;&nbsp;Dashboard</h3>
                             <span class="clearfix"></span>
                        </span>
                       
                    </a>

               
                </div>
                <div id="navbar" class="navbar-collapse collapse" > <!---collapse collapse -->
                  
                    <br />
                    <ul class="nav navbar-nav navbar-right extended" style="margin-top:8px;margin-right:100px;">
                        <li>
                            <div class="form-group" style="position:absolute;z-index:40000;">
                                <input type="text" placeholder="Search for alumni" name=""  class="form-control input-sm" id="searching" autocomplete="off"/>
                                <div class="resWrapper">

                                </div>
                            <div class="display"></div>
                            </div>
                        </li>
                    </ul>
                    
                </div><!--/.navbar-collapse -->
                </div>
            </nav>-->

           <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-3 col-md-2 sidebar">  <!--side-bar -->
	                        <ul class="nav nav-sidebar">
		                        <li>
			                        <a href="#">
				                        <asp:Image ID="Image2" runat="server" ImageUrl="./assets/images/default-dp.jpg"  BorderColor="White" BorderStyle="Solid" BorderWidth="3" CssClass="nonmod" />          
			                        </a>
		                        </li>
                            <li>    
                                <a href="./alumni-profile.aspx"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a>
                            </li>
		  		                <li><a  runat="server" id="pointer"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline </a></li>
                                <li><a href="#" id="alumni_logout" runat="server"><span class="glyphicon glyphicon-off" ></span>&nbsp;&nbsp;Log out</a></li>
                                <li>

                                    <asp:TextBox ID="account_idpk" runat="server" ></asp:TextBox>
                                </li>
                            </ul>
                    </div>

                     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background:#fff;">
                         <div class="row">
                             <div class="col-xs-6">
                                 <h3 class="page-header">Profile</h3>
                             </div>
                          
                             <div class="col-xs-2">
                      
                                  <asp:Label ID="responder" runat="server" Text=""></asp:Label>
                             </div>
                             <div class="col-xs-2 " style="text-align:right;position:relative">
                                 <span class="glyphicon glyphicon-camera" style="position:absolute;top:4px;font-size:22px;cursor:pointer;color:#A6635D" id="checker"  runat="server">&nbsp;</span>
                                 <asp:FileUpload ID="uploader" runat="server" CssClass="btnbtn-sm  ipt" style="max-width:250px;cursor:pointer;opacity:0;"/>
                             </div>

                             <div class="col-xs-2">
                                 <asp:Button ID="btnUpload" runat="server" Text="Update" CssClass="btn btn-danger btn-sm" />
                                
                             </div>
                             
                         </div>
                        <div class="row placeholders " >
                            <br />

                            <!-- start main-content -->
                            <div class="col-xs-12 col-sm-12  announcementHolder">
                                <div class="row" >
                                    <div class="col-xs-12">
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <div class=" table">
                                                    <table class="table basic-info" data-toggle="table" >
                                                        <tbody style="text-align:left !important">

                                                        </tbody>
                                                    </table>   
                                                </div>
                                            </div>
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

        </div>
    </form>
    //Modal form
    <div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog ">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel"></h4>
          </div>
          <div class="modal-body ">
              
              <div class="form-group">
                  <input type="text" name="" value=" " placeholder="" id="old_email" class="form-control" disabled/>
                  <br />
                 
                   
              </div> 
              <div class="form-group" id="appendable">

              </div>
          </div>
          <div class="modal-footer">
           
           
            
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script type="text/javascript" src="./js/home-search.js"></script>
     <script type="text/javascript" src="./js/bindDelay.js"></script>
    <script type="text/javascript" src="./js/json2.js"></script>
    


    <script>
        $(document).ready(function () {

           

            var fullname = $("#alumni_name").text();
            var id = $("#account_idpk").val();
            var email;
            var contact;
            var password;
            var newmail;
            var retype;
            $("title").html(fullname);

            //Load user info
            $.ajax({
                type: "post",
                url: "./alumni-profile.aspx/pullInfo",
                data:"{'id':'"+ id +"'}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",

                success: function (r) {

                    console.log(r.d);
                    data = r.d
                    data = jQuery.parseJSON(data)
                    $.each(data, function (i, o) {
                       
                        fullname = o.given_name + " " + o.family_name ;
                        $(".page-header").html("<span class='glyphicon glyphicon-option-vertical'></span>"+fullname);
                        email = o.email_address;
                        contact = o.telephone_number;
                        password = o.password;
                        $(".basic-info tbody").append(
                            "<tr>" +
                                "<td><span><b  class='min'> Address  </b>  </td>" +
                                "<td>" + o.address + " </span> </td>" +
                                "<td> </td>" +
                            "</tr>"+
                             "<tr>" +
                                "<td> <span ><b class='min'> Birthday  </b> </td>" +
                                "<td>" + o.formatedB + " </span> </td>" +
                                "<td> </td>" +
                            "</tr>" +
                            "<tr>" +
                                "<td> <span ><b class='min'> Citizenship  </b> </td>" +
                                "<td>" + o.citizenship + " </span> </td>" +
                                "<td> </td>" +
                            "</tr>"+
                             "<tr>" +
                                "<td><span ><b class='min'> Religion  </b>  </td>" +
                                "<td>" + o.religion + " </span> </td>" +
                                "<td> </td>" +
                            "</tr>"+
                            "<tr>" +
                                "<td><span ><b class='min'> Maritals Status  </b>  </td>" +
                                "<td>" + o.marital_status + " </span> </td>" +
                                "<td> </td>" +
                            "</tr>"+
                            "<tr>" +
                                "<td><span><b  class='min'> Email  </b>  </td>" +
                                "<td>" + email + " </span> </td>" +
                                "<td style='text-align:right;'><button value='Update' id='editMail' class='btn btn-danger btn-sm' data-toggle='modal' data-target='#myModal'> <span class='glyphicon glyphicon-pencil'></span></button></td>" +
                            "</tr>"+
                            "<tr>" +
                                "<td><span><b  class='min'> Contact Number  </b>  </td>" +
                                "<td>" + contact + " </span> </td>" +
                                "<td style='text-align:right;'><button value='Update' id='editContact' class='btn btn-danger btn-sm' data-toggle='modal' data-target='#myModal'> <span class='glyphicon glyphicon-pencil'></span></button></td>" +
                            "</tr>"+
                            "<tr>" +
                                "<td><span><b  class='min'> Password  </b>  </td>" +
                                "<td>Update your password </span></td>" +
                                "<td style='text-align:right;'><button value='Update' id='editPassword' class='btn btn-danger btn-sm' data-toggle='modal' data-target='#myModal'> <span class='glyphicon glyphicon-pencil'></span></button></td>" +
                            "</tr>"
                            );
                    });

                    //Email edit function
                    $("#editMail").click(function (e) {
                        $(".modal-footer").html("");
                        $("#appendable").html("");
                        var filter = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
                        e.preventDefault();
                        $("#old_email").val(email);
                      
                        $(".modal-footer").append(
                            "<div class='btn-group'>"+
                            "<input type='button' class='btn btn-warning btn-sm saveMail' value='Update email' />"+
                             "<button type='button' class='btn btn-danger btn-sm' data-dismiss='modal' id='close'>Cancel</button>"+
                             "</div>"
                            );
                        $("#appendable").append(
                            "<input type=text' name='' value='' placeholder='New email' id='newmail' class='form-control' />"+
                            "<br/>"+
                            "<input type='text' name='' value='' placeholder='Re-type email' id='remail' class='form-control' />"
                            );
                       
                        $(".saveMail").click(function () {
                            newmail = $("#newmail").val();
                            retype = $("#remail").val();
                            if (newmail != retype) {
                                alert("Email didnt' match.");
                            } else if($.trim(newmail).length == 0 || $.trim(retype).length == 0 ) {
                                alert("All fields are required.");
                            } else  if (filter.test(newmail) && filter.test(retype)) {
                                $.ajax({
                                    type: "post",
                                    url: "./alumni-profile.aspx/editMail",
                                    data: "{'id':'" + id + "','newmail':'" + newmail + "'}",
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",

                                    success: function (r) {
                                        alert("Email address info was updated.")
                                        window.location.reload(true);
                                    }
                                });
                            } else {
                                alert("Invalid email");
                            }                         
                        });
                    });

                    //Edit number
                    $("#editContact").click(function (e) {
                        e.preventDefault();
                        $(".modal-footer").html("");
                        $("#appendable").html("");
                        var filter = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
                        e.preventDefault();
                        $("#old_email").val(contact);

                        $(".modal-footer").append(
                            "<div class='btn-group'>" +
                            "<input type='button' class='btn btn-warning btn-sm saveCon' value='Update contact' />" +
                             "<button type='button' class='btn btn-danger btn-sm' data-dismiss='modal' id='close'>Cancel</button>"+
                             "</div>"
                            );
                        $("#appendable").append(
                            "<input type='text' name='' value='' placeholder='New number' id='newnum' class='form-control' />" +
                            "<br/>" +
                            "<input type='text' name='' value='' placeholder='Re-type number' id='renum' class='form-control' />"
                            );

                        $(".saveCon").click(function () {
                            var newpass = $("#newnum").val();
                            var retypePass = $("#renum").val();
                            if (newpass != retypePass) {
                                alert("Contact didn't match.");
                            }
                            else if (newpass == "" || retypePass == "") {
                                alert("All fields are required.");
                            }
                            else if (newpass.length > 11 || retypePass.length > 11) {
                                alert("Length is too much")
                            }
                            else if (newpass.length < 11 || retypePass.length < 11) {
                                alert("Length is too short")
                            }
                            else {
                                $.ajax({
                                    type: "post",
                                    url: "./alumni-profile.aspx/editContact",
                                    data: "{'id':'" + id + "','newContact':'" + newpass + "'}",
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",

                                    success: function (r) {
                                        alert("Contact info was updated.")
                                        window.location.reload(true);
                                    }
                                });
                            }
                        });
                    });

                    //Edit Password
                    $("#editPassword").click(function (e) {
                        e.preventDefault();
                        $("#old_email").val("");
                        $(".modal-footer").html("");
                        $("#appendable").html("");
                        var filter = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
                        e.preventDefault();
                        $("#old_email").attr("enabled", false);

                        $(".modal-footer").append(
                            "<div class='btn-group'>" +
                            "<input type='button' class='btn btn-warning btn-sm savePass' value='Update password' />" +
                             "<button type='button' class='btn btn-danger btn-sm' data-dismiss='modal' id='close'>Cancel</button>"+
                              "</div>"
                            );
                        $("#appendable").append(
                            
                            "<input type='password' name='' value='' placeholder='New password' id='newpass' class='form-control' />" +
                            "<br/>" +
                            "<input type='password' name='' value='' placeholder='Re-type password' id='repass' class='form-control' />"
                           
                            );

                        $(".savePass").click(function () {
                           var newpass = $("#newpass").val();
                            var retypePass = $("#repass").val();
                            if(newpass != retypePass){
                                alert("Password didn't match.");
                            }
                            else if (newpass == "" || retypePass == "") {
                                alert("All fields are required.");
                            }
                            else {
                                $.ajax({
                                    type: "post",
                                    url: "./alumni-profile.aspx/editPassword",
                                    data: "{'id':'" + id + "','newPassword':'" + newpass + "'}",
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",

                                    success: function (r) {
                                        alert("Password was updated.")
                                        window.location = "default.aspx";
                                      
                                    }
                                });
                            }

                        });
                    });
                }
            });

           
        });

        //Email validate
       
    </script>
</body>
</html>
