<%@ Page Language="VB" AutoEventWireup="false" CodeFile="token-print.aspx.vb" Inherits="director_report" %>

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
    <div class="printables">
        <div class="col-xs-6 slicable">
            <table class="chart table table-bordered aligned">
                <thead class="aligned">
                    <tr> <th class="aligned">Token Description</th> </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div class="col-xs-6 slicable fied" style="display:none;">
            <table class="chart2 table table-bordered aligned">
                <thead class="aligned">
                    <tr> <th class="aligned">Token Description</th> </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        
    </div>
        <asp:Label ID="Label1" runat="server" Text="Label" ></asp:Label> <br />
        <asp:Label ID="Label2" runat="server" Text="Label" ></asp:Label>
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
            var college_fk = $("#Label1").text();
            var number_of_tokens = $("#Label2").text();

            $.ajax({
                type: "post",
                url: "./token-print.aspx/fetchtokens",
                data: "{'college_fk':'" + college_fk + "','number_of_tokens':'" + number_of_tokens + "'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (dataOpt) {
                    data = dataOpt.d;
                    data = jQuery.parseJSON(data);
                    var limit = 15;
                    var sub;
                  
                       
                   
                    $.each(data, function (i, o) {
                      
                        sub = i - limit;
                        console.log(sub);
                        if(i <  limit ){
                            $(".chart").append(
                               "<tr>" +
                                   "<td>" + data[i].description + " </td>" +
                               "</tr>"
                           );
                        } else {
                            $(".fied").css("display", "block");
                            $(".chart2").append(
                                "<tr>" +
                                   "<td>" + data[sub].description + " </td>" +
                               "</tr>"
                                );
                        }
                           
                       
                            
                        })
                   
                        
                    
                }
            });
        });
    </script>

    </body>
</html>
