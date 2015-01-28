<%@ Page Language="VB" AutoEventWireup="false" CodeFile="poll-generator-ui.aspx.vb" Inherits="UI_poll_generator_ui" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Poll Generator</title>
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
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/images/TSULOGO.png" Height="55" Width="55" CssClass="img-float-nav" />
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
                         <h3 class="page-header"><span class="glyphicon glyphicon-list-alt">&nbsp;</span>Generate Poll Questions</h3>
                         <div class="row placeholders">
                             <br />
                             <!-- start main-content -->
                             <div class="col-xs-6 col-sm-6 placeholder ">
                              
                                <div class="row">
                                    <div class="col-xs-12 border-enabled">
                                        <h4 class="header-padded ">Poll Question</h4>
                                        <div class=" row">
                                            <div class="theme-color col-xs-12 highlighted-div">
                                                <div class="form-group">
                                                    <asp:TextBox ID="txtxPollTitle" runat="server" placeholder="Poll Title" CssClass="form-control"></asp:TextBox>
                                                    <br />
                                                    <asp:TextBox ID="txtPollQuestionArea" runat="server" TextMode="MultiLine" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                                    <br />
                                                    <br />
                                                    <label class="text-theme">Select where to post</label>
                                                    <asp:DropDownList ID="select_to_post_coor" runat="server" CssClass="form-control" ClientIDMode="Static">
                                                        <asp:ListItem Text="" Value="none"/>
                                                        <asp:ListItem Text="College" Value="college-selected"/>
                                                        <asp:ListItem Text="Course" Value="course-selected"/>
                                                    </asp:DropDownList>
                                                    <div class="form-group course-wrap-selector"></div> 
                                                </div>
                                                
                                            </div>

                                           
                                        </div>

                                        <div class="row">
                                            <br />
                                            <div class="col-xs-12">
                                                <h4 class="header-padded">Populate Poll Options</h4>
                                                <div class="row">
                                                    <div class="col-xs-12 enable-populate form-group">
                                                        <asp:TextBox ID="txtPollOption" runat="server" CssClass="form-control" placeholder="Poll Option"></asp:TextBox>
                                                        
                                                    </div>
                                                </div>
                                                 <br /><br />
                                                 <div class="row">
                                                     <div class="col-xs-12">
                                                         <asp:ListView ID="ListView1" runat="server">
                                                             
                                                         </asp:ListView>
                                                     
                                                     
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
                                  <h5 >&nbsp; Active Polls</h5>
                                  <div class="row">
                                      <div class="col-xs-12 highlighted-div ">
                                          <div class="form-group">
                                              
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
    <script type="text/javascript">
        function pushToServer() {
            var g = $("#counterPart").val();
            var pollTarget = $("#select_to_post_coor option:selected").val();
            var pollQ = $("#txtPollQuestionArea").val();
            var pollOptArr = [];
            console.log(g);
            $(".populatedOpt").each(function (i, o) {
                pollOptArr.push($(o).val());
                console.log(pollOptArr);
            });

            $.ajax({
                type: "POST",
                url: "./poll-generator-ui.aspx/Sample",
                data: "{'pollOptArr':  '" + pollOptArr + "'  }",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    $.each(function response(i,o) {
                        console.log(o);
                    })
                    
                }
            });
           
        }
      
        var iCnt = 0;
        var container = $(document.createElement('div')).attr('class', 'col-sm-12');
        $("#select_to_post_coor").change(function () {

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

        $("#add_poll_opt").click(function () {

            if (iCnt <= 30) {

                iCnt = iCnt + 1;
                var g = $("#counterPart").val(iCnt);

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

        $("#remove_poll_opt").click(function () {
            if (iCnt != 0) { $('#tb' + iCnt).remove(); iCnt = iCnt - 1; }
            if (iCnt == 0) {
                $(container).empty();
                $(container).remove();
                $('#btSubmit').remove();
                $('#btAdd').removeAttr('disabled');
                $('#btAdd').attr('class', 'bt')
            }
        });

        $('#remove_all_poll_opt').click(function () {    // REMOVE ALL THE ELEMENTS IN THE CONTAINER.
            $(container).empty();
            $(container).remove();
            $('#btSubmit').remove(); iCnt = 0;
            $('#btAdd').removeAttr('disabled');
            $('#btAdd').attr('class', 'bt');
        });
    </script>
</body>
</html>
