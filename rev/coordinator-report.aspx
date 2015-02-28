<%@ Page Language="VB" AutoEventWireup="false" CodeFile="coordinator-report.aspx.vb" Inherits="coordinator_report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/horizBarChart.css" rel="stylesheet" />
    <link href="./css/chart.css" rel="stylesheet" />
    <link href="./css/sidebar-theme.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">
            <div class="col-xs-12 col-sm-12"> 
                <div class="row">

                    
                </div>
            </div>

            <div class="col-xs-12 col-sm-12">             
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <td><h4><asp:Label ID="lblCollege" runat="server" Text="College"></asp:Label></h4></td>
                                <td><h4><asp:Label ID="lblCourse" runat="server" Text="Course"></asp:Label></h4></td>
                                <td><h4><asp:Label ID="lblSurveyType" runat="server" Text="Survey"></asp:Label> </h4></td>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <table class="table table-hover statisticsTable" id="statisticsTable">                        
                        <thead>
                            <tr> 
                                <td><b>Survey Details</b></td>
                                <td><b>Number of Respondents</b></td>
                            </tr>
                        </thead>
                        <tbody>
                                               
                        </tbody>
                    </table>
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
            var college_desc = $("#Label2").text();
            var course_desc = $("#Label1").text();

            $.ajax({
                type: "post",
                url: "./director-report.aspx/empstat",
                data: "{'college_desc':'" + college_desc + "','course_desc':'" + course_desc + "'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (dataOpt) {
                    data = dataOpt.d
                    data = jQuery.parseJSON(data)
                    var g;

                    $.each(data, function (i, o) {
                        $(".statisticsTable tbody").append(
                                "<tr>" +
                                    "<td><b> Are you current employed?</b></td>" +
                                    "<td>-</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td> Employed </td>" +
                                    "<td>" + o.Employed + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td> Unemployed </td>" +
                                    "<td>" + o.Unmployed + "</td>" +
                                "</tr>" + 
                               
                                "<tr>" +
                                    "<td><b> How long did it take to find your First employment? </b></td>" +
                                    "<td>-</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>1 to 3 months </td>" +
                                    "<td>" + o.Q1A + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>4 to 6 months </td>" +
                                    "<td>" + o.Q1B + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>7 months to 1 year </td>" +
                                    "<td>" + o.Q1C + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Others </td>" +
                                    "<td>" + o.Q1D + "</td>" +
                                "</tr>" +

                                "<tr>" +
                                    "<td><b> Is your current work/job is aligned to your field of education? </b></td>" +
                                    "<td>-</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Yes </td>" +
                                    "<td>" + o.Q2A + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>No </td>" +
                                    "<td>" + o.Q2B + "</td>" +
                                "</tr>" +

                                "<tr>" +
                                    "<td><b> Location of employment? </b></td>" +
                                    "<td>-</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Abroad </td>" +
                                    "<td>" + o.Q3A + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Local </td>" +
                                    "<td>" + o.Q3B + "</td>" +
                                "</tr>" +

                                "<tr>" +
                                    "<td><b> The classification of your company or institution? </b></td>" +
                                    "<td>-</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Private </td>" +
                                    "<td>" + o.Q4A + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Public </td>" +
                                    "<td>" + o.Q4B + "</td>" +
                                "</tr>" +

                                "<tr>" +
                                    "<td><b> Nature of appointment? </b></td>" +
                                    "<td>-</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Regular </td>" +
                                    "<td>" + o.Q5A + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Probation </td>" +
                                    "<td>" + o.Q5B + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Self-employed </td>" +
                                    "<td>" + o.Q5C + "</td>" +
                                "</tr>" +

                                "<tr>" +
                                    "<td><b> What is your present position? </b></td>" +
                                    "<td>-</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Rank and File </td>" +
                                    "<td>" + o.Q6A + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Supervisory Level </td>" +
                                    "<td>" + o.Q6B + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Managerial Level </td>" +
                                    "<td>" + o.Q6C + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Others </td>" +
                                    "<td>" + o.Q6D + "</td>" +
                                "</tr>" +

                                "<tr>" +
                                    "<td><b> How long have you been working in your current company? </b></td>" +
                                    "<td>-</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>1 to 6 months </td>" +
                                    "<td>" + o.Q7A + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>7 months to 1 year </td>" +
                                    "<td>" + o.Q7B + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>1 year to 3 years </td>" +
                                    "<td>" + o.Q7C + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Others </td>" +
                                    "<td>" + o.Q7D + "</td>" +
                                "</tr>" +

                                "<tr>" +
                                    "<td><b> Did you pursue a higher level of Education? </b></td>" +
                                    "<td>-</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Yes: </td>" +
                                    "<td>" + o.FSA + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>No: </td>" +
                                    "<td>" + o.FSB + "</td>" +
                                "</tr>" +

                                "<tr>" +
                                    "<td><b> Highest educational attainment. </b></td>" +
                                    "<td>-</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Doctoral </td>" +
                                    "<td>" + o.HEA1 + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Masteral </td>" +
                                    "<td>" + o.HEA2 + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                    "<td>Others </td>" +
                                    "<td>" + o.HEA2 + "</td>" +
                                "</tr>" +
                                "<br />" +
                                "<tr> <td> <input type='button' value='Print' id='print_report'/> </td> <td></td> </tr>" 
                                );

                        $("#print_report").click(function () {
                            window.print();
                        });
                    });
                }
            });
        });
    </script>

    </body>
</html>
