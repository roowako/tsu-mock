<%@ Page Language="VB" AutoEventWireup="false" CodeFile="survey-pending.aspx.vb" Inherits="UI_profile" %>

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
        <div>
            <ul>
                <li><asp:DropDownList ID="cboPending_Surveys" runat="server"></asp:DropDownList></li>
                <asp:Button id="qwe" Text="view" runat="server"/>
            </ul>
        </div>

    </form>
</body>
</html>
