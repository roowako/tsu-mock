<%@ Page Language="VB" AutoEventWireup="false" CodeFile="poll-generator-ui.aspx.vb" Inherits="UI_poll_generator_ui" %>

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
                <div class="navbar-header " >
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
                                
                                <li> <asp:TextBox ID="account_idpk" runat="server" ></asp:TextBox> </li>
                                <li> <asp:TextBox ID="college_idpk" runat="server"></asp:TextBox> </li>
	                        </ul>
                    </div>

                     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="background:#fff;">
                         <h3 class="page-header"><span class="glyphicon glyphicon-option-vertical">&nbsp;</span>Generate Survey Questions</h3>
                         <div class="row placeholders">
                             <br />
                             <!-- start main-content -->
                             <div class="col-xs-6 col-sm-5 placeholder ">
                              
                                <div class="row">
                                    <div class="col-xs-12 border-enabled">
                                        <h4 class="header-padded ">Survey Question</h4>
                                        <div class=" row">
                                            <div class="theme-color col-xs-12 highlighted-div">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtPollTitle" runat="server" placeholder="Survey Title" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="txtPollQuestionArea" runat="server" placeholder="Survey Question" TextMode="MultiLine" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                                 
                                                </div>
                                                
                                            </div>

                                           
                                        </div>

                                        <div class="row">
                                            <br />
                                            <div class="col-xs-12">
                                                <h4 class="header-padded">Populate Survey Answers</h4>
                                                <div class="row">
                                                    <div class="col-xs-12 enable-populate form-group">
                                                        <asp:HiddenField ID="counterPart" runat="server" />
                                                                                                               
                                                    </div>
                                                </div>
                                                 <br /><br />
                                                 <div class="row">
                                                     <div class="col-xs-12">
                                                         <div class="btn-group">
                                                              <asp:Button ID="btnAddOption" runat="server" Text="Add Option" CssClass="btn btn-danger btn-sm"/>
                                                             <asp:Button ID="remove_poll_opt" runat="server" Text="Remove Option" CssClass="btn btn-danger btn-sm"/>
                                                             <asp:Button ID="remove_all_poll_opt" runat="server" Text="Remove all answers" CssClass="btn btn-danger btn-sm"/>
                                                             <input id="btnGetTime" type="button" class="btn btn-sm btn-warning" value="Submit" onclick = "pushToServer()" />
                                                         </div>
                                                        
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
                               <div class="col-xs-6 col-sm-6 placeholder border-enabled" style="background:#fff;">
                                  <h5 >&nbsp; Active Surveys</h5>
                                  <div class="row">
                                      <div class="col-xs-12">
                                          <div class="table-responsive" style="border-top:thin solid #eee;">
                                                <table class="table" style="cursor:pointer;">
                                                    <tr>
                                                        <th>Survey Title</th>
                                                        <th>Status</th>
                                                        <th></th>
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

    //Modal form
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header" style="border:0px solid #eee ;">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
          </div>
          <div class="modal-body">
              <h4 style="border-top:1px solid #eee;padding-top:15px;">Survey Question</h4>
              <p id="questionPlaceholder"></p>
           
              <br />
              <h4>Survey Answers</h4>
              <ul id="placeholderOptions">
                 
              </ul>
          </div>
          <div class="modal-footer" style="background:#f5f5f5;">
            <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Close</button>
            
          </div>
        </div>
      </div>
    </div>

    //Delete modal
    <div class="modal fade bs-example-modal-sm" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" style="border-radius:3px;">
  <div class="modal-dialog modal-sm" style="width:500px;border-radius:3px;top:100px;">
    <div class="modal-content" style="border-radius:3px;">
      <div class="modal-header" style="background:#F6F7F8;border-radius:3px;padding:8px;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h5 class="modal-title" id="myModalLabel2" style="padding:3px;"><b>Delete Post</b></h5>
      </div>
      <div class="modal-body" style="border-radius:3px;">
          <p style="border-bottom:thin solid #ccc;padding-bottom:15px;color:#333;">Are you sure you want to delete this post?</p>
         
          <div class="btn-group btn-sm" style="text-align:right;float:right">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-danger btn-sm del_p">Confirm</button>
        </div>
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
    <script type="text/javascript">

        function pullFromServer() {
            var college_id = $("#college_idpk").val();
            var uid;
            $.ajax({
                type: "post",
                url: "./poll-generator-ui.aspx/pullFromServer",
                data: "{'college_id' :'" + college_id + "' }",
                dataType:"json",
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
                        } else if (object.status == 1) {
                            stat = "active";
                        } else {
                            stat = "rejected";
                        }

                        object.status = "active";
                        $(".table").append(
                            "<tr>" +
                            
                            "<td>  " + object.description + " </td>" +
                            "<td>  " + stat + " </td>" +

                            "<td style='text-align:right;'>" +
                                "<div class='btn-group' role='group'>" +
                                    "<a class='btn btn-success btn-sm theatre' id='" + object.polls_idpk + "' data-poll-title='" + object.description + "' data-poll-question='" + object.question + "' data-poll-id='" + object.polls_idpk + "' data-toggle='modal' data-target='#myModal'>View Details </a>" +
                                    "<a  data-toggle='modal' data-target='.bs-example-modal-sm ' class='btn btn-success btn-sm delete-survey' id='" + object.polls_idpk + "' data-poll-title='" + object.description + "' data-poll-question='" + object.question + "' data-poll-id='" + object.polls_idpk + "'><span class='glyphicon glyphicon-trash'></span></a>" +
                                "</div>" +
                            "</td>" +

                        

                            "</tr>"
                            );
                    });

                    $(".delete-survey").on("click", function () {
                        uid = "";
                        uid = $(this).data("poll-id");
                        $(".del_p").data("uid", uid);
                    });
                    $(".del_p").on("click", function () {
                        $.ajax({
                            type: "post",
                            url: "./poll-generator-ui.aspx/delete_survey",
                            data: "{'pollsPK' :'" + uid + "' }",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (r) {
                              
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
                            url: "./poll-generator-ui.aspx/pullPollOptions",
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
            //Function for passing Poll Generator inputs to the server
            
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


            if (pollTitle == "" || pollQ == "" ||  pollOptArr == "") {
                //Check all fields for empty value
                alert("All fields are required.");

            }
            else {
                var collegeid = $("#college_idpk").val();

                //Push to server using jquery Ajax
                $.ajax({
                    type: "POST",
                    url: "./poll-generator-ui.aspx/PushToDatabase",
                    data: "{'pollOptArr':  '" + pollOptArr + "','pollTitle': '" + pollTitle + "','pollQ': '" + pollQ + "','college_id': '" + collegeid + "' }",

                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        $("#txtPollTitle").val("");
                        $("#txtPollQuestionArea").val("");
                        pollTarget == "none";
                        $(container).empty();
                        $(container).remove();
                        $('#btSubmit').remove(); iCnt = 0;
                        $('#btAdd').removeAttr('disabled');
                        $('#btAdd').attr('class', 'bt');
                        console.log(response.d);
                        alert("Survey has been made,please wait for the apporval of Director. Thank you.");
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
</body>
</html>
