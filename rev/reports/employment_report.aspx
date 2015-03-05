<%@ Page Language="VB" AutoEventWireup="false" CodeFile="employment_report.aspx.vb" Inherits="reports_employment_report" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TSU Alumni Tracer - General Employment Survey Statistics</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/sidebar-theme.css" rel="stylesheet" />
    <link href="../css/normalize.css" rel="stylesheet" />
</head>

<body>
    <form id="form1" runat="server">
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="table-responsive">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <rsweb:ReportViewer ID="rptViewer" runat="server" Font-Names="Segoe UI" Font-Size="8pt" Height="11.25in" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="8.75in" ShowRefreshButton="False" ZoomMode="PageWidth" BorderColor="#CC0000" ZoomPercent="60">
                    <ServerReport DisplayName="TSU Alumni Tracer - Reports" />
                        
                    <LocalReport ReportPath="RPTemployment_survey.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DSalumni_list" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
            </div>
        </div> 
    </form>
</body>
</html>
