<%@ Page Language="VB" AutoEventWireup="false" CodeFile="survey-gen-director.aspx.vb" Inherits="rev_survey_gen_director" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Survey Generator</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/sidebar-theme.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
</head>
<body onload="pullFromServer()">
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

            <!-- Start content here -->
            <div class="container-fluid">
                <div class="row">
                    <<div class="col-sm-3 col-md-2 sidebar">
	                    <ul class="nav nav-sidebar">
		                    <li>
			                    <a href="#" >

				                    <asp:Image ID="Image2" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="75" Width="75" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />          

			                    </a>

		                    </li>
		                    <li><a href="#" class="bolder"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;<asp:Label id="alumni_name" runat="server"></asp:Label></a></li>
		  
		                    <li><a href="./director-ui.aspx" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline</a></li>
		                    <li><a href="./messaging-ui-director.aspx" ><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Messages</a></li>
		                    <li><a href="./notification-center-ui.aspx"><span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;Notification Center</a></li>
                        <li>
                          <a href="./pending-reg-ui.aspx">
                            <span class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;Pending Registration
                          </a>
                        </li>
                        <li><a href="./pending-ui.aspx"><span class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;Pending Surveys</a></li>
                        <li>
                          <a href="./survey-gen-director.aspx">
                            <span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;Surveys
                          </a>
                        </li>
		                    <li><a href="./statistics-ui.aspx"><span class="glyphicon glyphicon-signal"></span>&nbsp;&nbsp;Statistics</a></li>
			                  <li><a href="./director-list-ui.aspx"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;List of Coordinators</a></li>
			                  <li><a href="./alumni-list-ui.aspx"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;List of Registered users</a></li>
                        <li>
                          <a href="#" id="alumni_logout" runat="server">
                            <span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;Log out
                          </a>
                        </li>
                        <li>
                          <asp:TextBox ID="account_idpk" runat="server" ></asp:TextBox>
                        </li>
	                    </ul>

                    </div>

                     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                         <h3 class="page-header"><span class="glyphicon glyphicon-list-alt">&nbsp;</span>Generate Survey Questions</h3>
                         <div class="row placeholders">
                             <br />
                             <!-- start main-content -->
                             <div class="col-xs-6 col-sm-6 placeholder ">
                              
                                <div class="row">
                                    <div class="col-xs-12 border-enabled">
                                        <h4 class="header-padded ">Survey Question</h4>
                                        <div class=" row">
                                            <div class="theme-color col-xs-12 highlighted-div">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPollTitle" runat="server" placeholder="Survey Title" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="txtPollQuestionArea" runat="server" placeholder="Survey Details" TextMode="MultiLine" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>  
                                                </div>   
                                            </div>                                          
                                        </div>

                                        <div class="row">
                                            <br />
                                            <div class="col-xs-12">
                                                <h4 class="header-padded">Populate Survey Options</h4>
                                                <div class="row">
                                                    <div class="col-xs-12 enable-populate form-group">
                                                        <asp:HiddenField ID="counterPart" runat="server" />                                                     
                                                    </div>
                                                </div>
                                                 <br /><br />
                                                 <div class="row">
                                                     <div class="col-xs-12">
                                                         
                                                         <asp:Button ID="btnAddOption" runat="server" Text="Add Option" CssClass="btn btn-primary btn-sm"/>
                                                         <asp:Button ID="remove_poll_opt" runat="server" Text="Remove Option" CssClass="btn btn-warning btn-sm"/>
                                                         <asp:Button ID="remove_all_poll_opt" runat="server" Text="Remove all Option" CssClass="btn btn-warning btn-sm"/>
                                                         <input id="btnGetTime" type="button" class="btn btn-sm btn-success" value="Submit Survey" onclick = "pushToServer()" />
                                                         <br /><br />
                                                     </div>
                                                   
                                                    <br /><br />
                                                </div>
                                            </div>                                      
                                        </div>                                     
                                    </div>
                                </div>
                                <br />                                
                            </div>

                              <!-- star spacer -->
                              <div class="col-xs-6 col-sm-1 placeholder"> </div>

                              <!-- start right-side -->
                               <div class="col-xs-6 col-sm-5 placeholder border-enabled">
                                  <h5 >&nbsp; Active Surveys</h5>
                                  <div class="row">
                                      <div class="col-xs-12 highlighted-div ">
                                          <div class="table-responsive">
                                                <table class="table table-hover">
                                                    <tr>
                                                       <td><span class="glyphicon glyphicon-th-list"></span></td>  
                                                        <td>Survey Title</td>
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
                 </div>
            </div>
       </div>
    </form>
    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/custom.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script type="text/javascript" src="./js/json2.js"></script>
    <script type="text/javascript" src="./js/bindDelay.js"></script>
    <script type="text/javascript" src="./js/home-search.js"></script>
   
    <script type="text/javascript">
        
        function pullFromServer() {
            $.ajax({
                type: "post",
                url: "./survey-gen-director.aspx/pullFromServer",
                dataType: "json",
                contentType: "application/json; charset=utf-8",

                success: function (r) {
                    //Response from server side 
                    data = r.d
                    console.log(r)
                    data = jQuery.parseJSON(data);
                    $.each(data, function (i, object) {
                        var stat;
                        if (object.status == 0) {
                            stat = "pending";
                        } else if(object.status == 1) {
                            stat = "active";
                        } else{
                            stat = "rejected";
                        }
                        object.status = "active";
                        $(".table").append(
                            "<tr>" +
                            "<td>  " + object.polls_idpk + " </td>" +
                            "<td>  " + object.description + " </td>" +
                            "<td>  " + stat + " </td>" +
                            "<td>   " + "<a class='btn btn-success btn-sm theatre' id='" + object.polls_idpk + "' data-poll-title='" + object.description + "' data-poll-question='" + object.question + "' data-poll-id='" + object.polls_idpk + "' data-toggle='modal' data-target='#myModal'>View Details </a>" + " </td>" +
                            "<td>   " + "<a class='btn btn-success btn-sm delete-survey' id='" + object.polls_idpk + "' data-poll-title='" + object.description + "' data-poll-question='" + object.question + "' data-poll-id='" + object.polls_idpk + "'>Delete</a>" + " </td>" +
                           "</tr>"
                            );
                    });

                    $(".delete-survey").click(function () {
                        var id = $(this).data("poll-id");
                       
                        $.ajax({
                            type: "post",
                            url: "./survey-gen-director.aspx/delete_survey",
                            data: "{'id' :'" + id + "' }",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (dataOpt) {
                                alert(dataOpt.d);
                                window.location.reload(true);
                            }
                        });
                    });

                    $(".theatre").click(function () {
                        $("#placeholderOptions").html("");
                        $("#questionPlaceholder").text($(this).data("poll-question"));
                        $("#myModalLabel").text($(this).data("poll-title"));
                        pollsPK = $(this).data("poll-id");

                        $.ajax({
                            type: "post",
                            url: "./survey-gen-director.aspx/pullPollOptions",
                            data: "{'optFk' :'" + pollsPK + "' }",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (dataOpt) {

                                optionsArr = dataOpt.d;
                                optionsArr = jQuery.parseJSON(optionsArr);

                                $.each(optionsArr, function (i, pollOpt) {

                                    var replaced = pollOpt.option_description.replace("-", ",");
                                    $("#placeholderOptions").append(
                                     "<li> " + replaced + " </li>"
                                     );

                                });
                            }
                        });

                    });

                }
            });
        }

        function pushToServer() {
            var g = $("#counterPart").val();//Counter for textbox added
            var pollTitle = $("#txtPollTitle").val(); //Poll Title
            var pollTarget = $("#select_to_post_coor option:selected").val();// Dropdown List value
            var pollQ = $("#txtPollQuestionArea").val();// Poll Question
            var pollOptArr = [];//Array variable for dynamic textboxes

            //Get the values of dynamically added textbox
            $(".populatedOpt").each(function () {
                pollOptArr.push($(this).val().replace(",", "-"));//Replace every(,) in every textbox. Replace with(-)
                console.log(pollOptArr);
            });

            if (pollTitle == "" || pollQ == "" || pollOptArr == "") {
                //Check all fields for empty value
                alert("All fields are required.");

            }
            else {

                //Push to server using jquery Ajax
                $.ajax({
                    type: "POST",
                    url: "./survey-gen-director.aspx/PushToDatabase",
                    data: "{'pollOptArr':  '" + pollOptArr + "','pollTitle': '" + pollTitle + "','pollQ': '" + pollQ + "' }",

                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        //Response from server side weather fail or successful
                      

                        $("#txtPollTitle").val("");
                        $("#txtPollQuestionArea").val("");
                        pollTarget == "none";
                        $(container).empty();
                        $(container).remove();
                        $('#btSubmit').remove(); iCnt = 0;
                        $('#btAdd').removeAttr('disabled');
                        $('#btAdd').attr('class', 'bt');
                        console.log(response.d);
                        alert("Survey has been made and now active. Thank you.");   
                        window.location.reload(true);
                    }
                });
            }
        }

        var iCnt = 0;

        var container = $(document.createElement('div')).attr('class', 'col-sm-12');//Div container for dynamic textboxes

        $("#select_to_post_coor").change(function () {

            // Function for course dropdown 
            var a = $("#select_to_post_coor option:selected").val();
            console.log(a);
            if (a == "college-selected") {
                $(".removable").remove();

            } else if (a == "none") {
                $(".removable").remove();
            } else {
                $(".course-wrap-selector").append("<br class='removable'>" +
                                                  "<select  class='form-control removable'>" +
                                                  "<optgroup>" +
                                                  "<option> Course 1 </option>" +
                                                  "<option> Course 2 </option>" +
                                                  "<option> Course 3 </option>" +
                                                  "<option> Course 4 </option>" +
                                                  "<option> Course 5 </option>" +
                                                  "</optgroup>" +
                                                  "</select>");
            }


        });

        $("#btnAddOption").click(function (e) {
            //Function for adding dynamic textboxes
            e.preventDefault();
            if (iCnt <= 30) {

                iCnt = iCnt + 1;
                var g = $("#counterPart").val(iCnt);

                //Appending textboxes to the container
                $(container).append('<br/>' + '<input type="text" class="input form-control populatedOpt" id=tb' + iCnt + ' ' +
                                'placeholder="Option ' + iCnt + '" />');


                $('.enable-populate').after(container);   // ADD BOTH THE DIV ELEMENTS TO THE "main" CONTAINER.
            }
            else {      // AFTER REACHING THE SPECIFIED LIMIT, DISABLE THE "ADD" BUTTON. (20 IS THE LIMIT WE HAVE SET)
                $(container).append('<label>Reached the limit</label>');
                $('#btAdd').attr('class', 'bt-disable');
                $('#btAdd').attr('disabled', 'disabled');
            }


        });

        $("#remove_poll_opt").click(function (e) {
            e.preventDefault();
            if (iCnt != 0) { $('#tb' + iCnt).remove(); iCnt = iCnt - 1; }
            if (iCnt == 0) {
                $(container).empty();
                $(container).remove();
                $('#btSubmit').remove();
                $('#btAdd').removeAttr('disabled');
                $('#btAdd').attr('class', 'bt')
            }
        });

        $('#remove_all_poll_opt').click(function (e) {    // REMOVE ALL THE ELEMENTS IN THE CONTAINER.
            e.preventDefault();
            $(container).empty();
            $(container).remove();
            $('#btSubmit').remove(); iCnt = 0;
            $('#btAdd').removeAttr('disabled');
            $('#btAdd').attr('class', 'bt');
        });
    </script>

    //Modal form
     <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
          </div>
          <div class="modal-body">
              <h4>Survey Question</h4>
              <p id="questionPlaceholder"></p>
           
              <br />
              <h4>Survey Options</h4>
              <ul id="placeholderOptions">
                 
              </ul>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
            
          </div>
        </div>
      </div>
    </div>
</body>
</html>
