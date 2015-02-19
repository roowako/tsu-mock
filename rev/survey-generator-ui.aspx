<%@ Page Language="VB" AutoEventWireup="false" CodeFile="survey-generator-ui.aspx.vb" Inherits="survey_generator_ui" %>

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
             <div class="container-fluid">
                <div class="row">
                    <!--#include file="./includes/sidebar-coordinator.inc"-->

                     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                         <h3 class="page-header"><span class="glyphicon glyphicon-th-list">&nbsp;</span>Generate Survey</h3>
                         <div class="row placeholders">
                             <br />
                             <!-- start main-content -->
                             <div class="col-xs-6 col-sm-6 placeholder ">
                              
                                <div class="row">
                                    <div class="col-xs-12 border-enabled">
                                        <h4 class="header-padded ">Survey</h4>
                                        <div class=" row">
                                            <div class="theme-color col-xs-12 highlighted-div">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtSurveyTitle" runat="server" placeholder="Survey Title" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="txtSurveyQuestionArea" runat="server" TextMode="MultiLine" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                                    <br />
                                                    <br />
                                                    
                                                    
                                                </div>
                                                
                                            </div>

                                           
                                        </div>

                                        <div class="row">
                                            <br />
                                            <div class="col-xs-12">
                                                <h4 class="header-padded">Populate Survey Options</h4>
                                                <div class="row">
                                                    <div class="col-xs-12 enable-populate form-group">
                                                        
                                                       
                                                       

                                                    </div>
                                                        
                                                </div>
                                                 <br /><br />
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <asp:HyperLink ID="btnAddOption" runat="server" CssClass="btn btn-primary">Add Option</asp:HyperLink>
                                                        <asp:HyperLink ID="remove_poll_opt" runat="server" CssClass="btn btn-warning">Remove Option</asp:HyperLink>
                                                        <asp:HyperLink ID="remove_all_poll_opt" runat="server" CssClass="btn btn-warning">Remove all option</asp:HyperLink>
                                                        <input id="btnGetTime" type="button" class="btn btn-sm btn-success" value="Submit Survey" onclick = "pushToServer()" />
                                                       
                                                        <br />
                                                        <br />
                                                    </div>
                                                     <br />
                                                     <br />
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
                                  <h5 >&nbsp;List of Surveys </h5>
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
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://ajax.cdnjs.com/ajax/libs/json2/20110223/json2.js"></script>
    <script>

        function pullFromServer() {

            $.ajax({
                type: "post",
                url: "./survey-generator-ui.aspx/pullFromServer",
                dataType: "json",
                contentType: "application/json; charset=utf-8",


                success: function (r) {
                    //Response from server side 
                    data = r.d
                    console.log(r)
                    data = jQuery.parseJSON(data);
                    $.each(data, function (i, object) {
                        var surveyStatus = object.status;
                        if (surveyStatus == 1) {
                            var modStatus = "Approved";
                        } else {
                            modStatus = "Pending"
                        }
                      
                        $(".table").append(
                            "<tr>" +
                            "<td>  " + object.survey_idpk + " </td>" +
                            "<td>  " + object.description + " </td>" +
                            "<td>  " + modStatus + " </td>" +
                            "<td>   " + "<a class='btn btn-success btn-sm theatre' id='" + object.polls_idpk + "' data-poll-title='" + object.description + "' data-poll-question='" + object.question + "' data-poll-id='" + object.polls_idpk + "' data-toggle='modal' data-target='#myModal'>View Details </a>" + " </td>" +
                            "</tr>"
                            );

                    });

                    $(".theatre").click(function () {
                        $("#placeholderOptions").html("");
                        $("#questionPlaceholder").text($(this).data("poll-question"));
                        $("#myModalLabel").text($(this).data("poll-title"));
                        pollsPK = $(this).data("poll-id");


                        $.ajax({
                            type: "post",
                            url: "./survey-ui.aspx/pullPollOptions",
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


                                console.log(dataOpt.d);
                            }
                        });

                    });

                }
            });
        }
        function pushToServer() {
            
            //Push data to server
            var surveyTitle = $("#txtSurveyTitle").val();
            var surveyQuestion = $("#txtSurveyQuestionArea").val();
            var surveyOptions = [];
            $(".populatedOpt").each(function () {
                surveyOptions.push($(this).val());
                console.log(surveyOptions);
            });

            console.log(surveyTitle);
            console.log(surveyQuestion);

            if( surveyTitle == "" || surveyQuestion == "" || surveyOptions == "" ){
                alert("There are missing fields.");
            } else {

                //Push to server
                $.ajax({
                    type: "POST",
                    url: "./survey-generator-ui.aspx/PushToDatabase",
                    data: "{'surveyOptArr':  '" + surveyOptions + "','pollTitle': '" + surveyTitle + "','pollQ': '" + surveyQuestion + "'}",
                    dataType:"json",
                    contentType: "application/json; charset=utf-8",
                    processData: false,
                    traditional: true,
                    success: function (surveyResults) {

                    }

                });
            }
        }



        //Dynamic Textboxes
        var dynamicCounter = 0;
        var container = $(document.createElement('div')).attr('class', 'col-sm-12');//Div container for dynamic textboxes
        $("#btnAddOption").click(function (e) {
            //Function for adding dynamic textboxes
            e.preventDefault();
            if (dynamicCounter <= 30) {

                dynamicCounter = dynamicCounter + 1;
                var g = $("#counterPart").val(dynamicCounter);

                //Appending textboxes to the container
                $(container).append('<br/>' + '<input type="text" class="input form-control populatedOpt" id=tb' + dynamicCounter + ' ' +
                                'placeholder="Option ' + dynamicCounter + '" />');


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
            if (dynamicCounter != 0) { $('#tb' + dynamicCounter).remove(); dynamicCounter = dynamicCounter - 1; }
            if (dynamicCounter == 0) {
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
            $('#btSubmit').remove(); dynamicCounter = 0;
            $('#btAdd').removeAttr('disabled');
            $('#btAdd').attr('class', 'bt');
        });



        
        
    </script>
</body>
</html>
