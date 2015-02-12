<%@ Page Language="VB" AutoEventWireup="false" CodeFile="timeline.aspx.vb" Inherits="rev_alumni_timeline" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>TSU Alumin Tracer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/normalize.css" rel="stylesheet" />
    <link href="../css/sidebar-theme.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
 
      
            <div class="row padded-left">
            <div class="col-xs-6 col-sm-6 border-enabled">er</div>
            
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
                    url: "./home2.aspx/pullFromServer",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",

                    success: function (r) {
                        //Response from server side 
                        data = r.d
                        console.log(r)
                        data = jQuery.parseJSON(data);
                        $.each(data, function (i, object) {

                            object.status = "active";
                            $(".table").append(
                                "<tr>" +
                                "<td>  " + object.polls_idpk + " </td>" +
                                "<td>  " + object.description + " </td>" +
                                "<td>  " + object.status + " </td>" +
                                "<td>   " + "<a class='btn btn-success btn-sm theatre' id='" + object.polls_idpk + "' data-poll-title='" + object.description + "' data-poll-question='" + object.question + "' data-poll-id='" + object.polls_idpk + "' data-toggle='modal' data-target='#myModal'>View Details and participate </a>" + " </td>" +
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
                                url: "./home.aspx/pullPollOptions",
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
                                         "<li><input type='radio' name='polloptions + "+ pollOpt.polls_idfk +"' value=" + replaced + "> &nbsp; " + replaced + " </li>"
                                         );
                                    });

                                    console.log(dataOpt.d);
                                }
                            });

                        });

                    }
                });
            }

        
            $.ajax({
                type: "post",
                url: "director-ui.aspx/pullAnnouncement",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (announceReturn) {
                    if (announceReturn.d == "[]") {
                        $(".announcementHolder").append("<p> No available announcement as of the moment. </p>");
                    } else {
                        data = announceReturn.d
                        data = jQuery.parseJSON(data)
                        $.each(data, function (i, object) {

                            $(".announcementHolder").append(

                                "<div class='row'>" +
                                    "<div class='col-xs-12 border-enabled'>" +
                                        "<h4 class='header-padded'>" + object.account_idfk + " </h4>" +
                                        "<div class='row'>" +
                                            "<div class='theme-color col-xs-3 highlighted-div'>" +
                                                "<p> " + object.description + "   </p>" +
                                                "<input type='button' '  id='btnAuth' value='Authorize' class='btn btn-default' />" +
                                            "</div>" +

                                        "</div> " +
                                    "</div>" +
                                "</div>" +

                                "<br />"
                                );
                        });
                    }
                }

            });
            $.ajax({
                type: "post",
                url: "home.aspx/pullPoll",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (pollResponse) {
                }
            });
      
    </script>
</body>
</html>
