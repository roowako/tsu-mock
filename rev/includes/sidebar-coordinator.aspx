<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sidebar-coordinator.aspx.vb" Inherits="includes_sidebar_coordinator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div class="col-sm-3 col-md-2 sidebar">
	    <ul class="nav nav-sidebar">
		    <li>
			    <a href="#" >

				    <asp:Image ID="Image2" runat="server" ImageUrl="~/assets/images/default-dp.jpg" Height="75" Width="75" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />          

			    </a>

		    </li>
		    <li><a href="#" class="bolder"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Coordinator</a></li>
		    <li>
			    <br />
		    </li>
		    <li><a href="./coordinator-custom.aspx" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline</a></li>
		    <li><a href="#" ><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Messages</a></li>
		    <li><a href="./poll-generator-ui.aspx"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Poll Questions</a></li>
		    <li><a href="#"><span class="glyphicon glyphicon-globe"></span>&nbsp;&nbsp;Notifications</a></li>
		    <li><a href="./survey-generator.aspx"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;Surveys</a></li>
		    <li><a href="./token-generator-ui.aspx"><span class="glyphicon glyphicon-star"></span>&nbsp;&nbsp;Tokens</a></li>
		    <li><a href="./statistics-ui.aspx"><span class="glyphicon glyphicon-stats"></span>&nbsp;&nbsp;Statistics</a></li>
		    <li><a href="#"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;Log out</a></li>
	    </ul>

    </div>
</body>
</html>
