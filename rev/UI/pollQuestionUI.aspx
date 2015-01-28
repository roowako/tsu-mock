<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pollQuestionUI.aspx.vb" Inherits="pollQuestionUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TSU Alumin Tracer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="../css/custom.css" rel="stylesheet" />
    <link href="../css/normalize.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="contianer-fluid">
           <nav class="navbar navbar-inverse navbar-fixed-top shadowed default-color"> 
                <div class="container pulled-height ">
                <div class="navbar-header ">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand extended-brand " href="../coordinator.aspx">
                        <span class="pulled-left">
                            <asp:Image ID="Image1" runat="server" ImageUrl="../assets/images/TSULOGO.png" Height="60" Width="60" CssClass="floating-img-nav" />
                            <h3> &nbsp;&nbsp;Tarlac State University</h3>
                        </span>
                        <div class="clearfix"></div>
                    </a>

               
                </div>
                <div id="navbar" class="navbar-collapse collapse" > <!---collapse collapse -->
                        
                        <br />
                    <div class="navbar-form navbar-right">
                        <div class="form-group">
                            <div class="col-sm-10">
                            <div class="input-group">
                                <div class="input-group-addon">Search</div>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control res" ></asp:TextBox>
                            </div>
                            </div>
                        </div>
                    </div>
                </div><!--/.navbar-collapse -->
                </div>
                </nav>-->
             <div class="container pulled-down">
                 <div class="row ">
                     <div class="col-sm-2 left-nav-user highlighted-div full-height" id="appendable"">
                         <div class="row">
                                <div class="col-sm-12 left-nav-user">
                                  <asp:Image ImageUrl="../assets/images/default-dp.jpg" class="thumbnail mug-shot"  runat="server" />
                                  <h4 class="theming">&nbsp;Coordinator</h4>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-sm-12 left-nav-user">
                                  <h4>
                                    <span class="glyphicon glyphicon-comment shadow-enabled" aria-hidden="true"   >
                                      <asp:HyperLink ID="goto_messagesUI_c"  runat="server">Messages</asp:HyperLink>
                                    </span>
                                  </h4>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-sm-12 left-nav-user">
                                  <h4>
                                    <span class="glyphicon glyphicon-th-list shadow-enabled " aria-hidden="true">
                                      <asp:HyperLink ID="goto_pollUI" runat="server" class="pollQuestion_UI" NavigateUrl="~/UI/pollQuestionUI.aspx">Poll Questions</asp:HyperLink>
                                    </span>
                                  </h4>
                                </div>
                              </div>

                              <div class="row">
                                <div class="col-sm-12 left-nav-user">
                                  <h4>
                                    <span class="glyphicon glyphicon-globe shadow-enabled" aria-hidden="true">

                                      <asp:HyperLink ID="HyperLink3" runat="server">Notifications</asp:HyperLink>
                                    </span>
                                  </h4>
                                </div>
                              </div>

                              <div class="row">
                                <div class="col-sm-12 left-nav-user ">
                                  <h4>
                                    <span class="glyphicon glyphicon-list-alt shadow-enabled" aria-hidden="true">

                                      <asp:HyperLink ID="goto_surveyUI" runat="server" NavigateUrl="~/UI/surveyUI.aspx">Surveys</asp:HyperLink>
                                    </span>
                                  </h4>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-sm-12 left-nav-user">
                                  <h4>
                                    <span class="glyphicon glyphicon-star-empty shadow-enabled" aria-hidden="true">

                                      <asp:HyperLink ID="goto_tokenUI" runat="server" NavigateUrl="~/UI/tokenUI.aspx">Tokens</asp:HyperLink>
                                    </span>
                                  </h4>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-sm-12 left-nav-user">
                                  <h4>
                                    <span class="glyphicon glyphicon-stats shadow-enabled" aria-hidden="true">

                                      <asp:HyperLink ID="goto_statisticsUI" runat="server" NavigateUrl="~/UI/statisticsUI.aspx">Statistics</asp:HyperLink>
                                    </span>
                                  </h4>
                                </div>
                              </div>

  
  
                              <div class="row">
                                <div class="col-sm-12 left-nav-user">
                                  <h4>
                                    <span class="glyphicon glyphicon-off-s" aria-hidden="true">
                                      &nbsp;
                                      <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/index.aspx">Log out</asp:HyperLink>
                                    </span>
                                  </h4>
                                </div>
                              </div>

                     </div>

                     <div class="col-sm-6">
                         <h5 class="theming"> <span class="glyphicon glyphicon-star theming" aria-hidden="true">&nbsp;</span>Generate Poll Questions</h5>
 
                        
                            <br />
                        
                                <div class="row bg-enabled border-visible drop-shadow">
                                    <div class="col-sm-12">
                                        <br />
                                        <h4> Poll </h4>
                                        <div class="form-group">
                    
                                       
                                            <asp:TextBox  CssClass="form-control" TextMode="multiline"  Rows="3" runat="server" ID="finetext_poll" />
                        
                                            <br />
                                                   <p>Select where to post Poll Question :</p>
                                                    <asp:DropDownList ID="poll_post_selector" runat="server" CssClass="form-control" ClientIDMode="Static">
                                                        <asp:ListItem Text="" Value="none"/>
                                                        <asp:ListItem Text="Post to college"  Value="college-selected"/>
                                                        <asp:ListItem Text="Post to course" Value="course-selected"/>
                                                    </asp:DropDownList>
                                                    <div class="form-group course-wrap-selector"></div>             
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12 highlighted-div ">
                                                <h4>Populate Poll Options</h4>
                                            
                                                    <div class="row">
                                                        <div class="col-sm-12  enable-populate">
                                                            <br />
                                    

                                                           <input type="text" id="counterPart"/>   
                                                        </div>

                                                    </div>
                                                    <br /><br />
                                                <asp:HyperLink ID="add_poll_opt" class="btn btn-sm btn-primary" runat="server">Add Poll Option</asp:HyperLink>
                                                <asp:HyperLink ID="remove_poll_opt" class="btn btn-sm btn-warning" runat="server">Remove Poll Option</asp:HyperLink>
                                                <asp:HyperLink ID="remove_all_poll_opt" class="btn btn-sm btn-warning" runat="server">Remove All Poll Option</asp:HyperLink>
                                                <input id="btnGetTime" type="button" class="btn btn-sm btn-success" value="Submit Poll" onclick = "ShowCurrentTime()" />
                        
                                                <br /><br />
                      
                                            </div>
                                        </div>
                                    
                                    </div>
                                </div>
                           
                     </div>

                     <div class="col-sm-4"> </div>
                 </div>
             </div>
        </div>
    </form>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/dom-control.js"></script>
        <script>
        
        
       function ShowCurrentTime() {
           var pollTarget = $("#poll_post_selector option:selected").val();
           $(".populatedOpt").each(function (index) {
               var populated = $(this).val();
          
               console.log(populated);
           });
           $.ajax({
               type: "POST",
               url: "./Ui/pollQuestion.aspx/Sample",
               data: '{pollQ: "' + $("#<%=finetext_poll.ClientID%>")[0].value + '", pollTarget :"' + $("#<%=poll_post_selector.ClientID%>")[0].value + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
        function OnSuccess(response) {
            alert(response.d);
        }

        var iCnt = 0;
        var container = $(document.createElement('div')).attr('class', 'col-sm-12');
        $("#poll_post_selector").change(function () {
            
            var a = $("#poll_post_selector option:selected").val();
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
               
                $(container).append('<br/>' + '<input type=text class="input form-control populatedOpt" id=tb' + iCnt + ' ' +
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
