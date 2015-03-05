<%@ Page Language="VB" AutoEventWireup="false" CodeFile="token_report.aspx.vb" Inherits="reports_token_report" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TSU Alumni Tracer - Token Print</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/sidebar-theme.css" rel="stylesheet" />
    <link href="../css/normalize.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager3" EnablePageMethods="true" EnablePartialRendering="true" runat="server"></asp:ScriptManager>

        <div class="container" style="margin-top:-30px;">
            <div class="row">
            <div class="col-sm-1"></div>

                <div class="col-sm-9" style="vertical-align:middle;text-align:center">
                    <div class="row">
                        <div class="col-sm-12">
                            <rsweb:ReportViewer ID="rptViewer" runat="server" Font-Names="Segoe UI" Font-Size="8pt" Height="11in" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="8.5in" ShowRefreshButton="False" ZoomMode="PageWidth" BorderColor="#CC0000" ZoomPercent="60" SizeToReportContent="True">
                                <ServerReport DisplayName="TSU Alumni Tracer - Reports" />
                        
                                <LocalReport ReportPath="reports\RPTtoken_print.rdlc">
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DSalumni_list" />
                                    </DataSources>
                                </LocalReport>
                            </rsweb:ReportViewer>
                        </div>
                    </div> 
                </div>

            <div class="col-sm-1"></div>
            </div>
        </div>
               
    </form>
</body>
</html>
