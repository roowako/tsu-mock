﻿ <div class="col-sm-3 col-md-2 sidebar">
	    <ul class="nav nav-sidebar">
		    <li>
			    <a href="#" >

				    <asp:Image ID="Image2" runat="server" ImageUrl="./assets/images/default-dp.jpg" Height="75" Width="75" BorderColor="White" BorderStyle="Solid" BorderWidth="3" />          

			    </a>

		    </li>
		    <li><a href="#" class="bolder"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Director</a></li>
		  
		    <li><a href="./director-ui.aspx" ><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Timeline</a></li>
		    <li><a href="./messaging-ui-director.aspx" ><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;Messages</a></li>
		    <li><a href="./notification-center-ui.aspx"><span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;Notification Center</a></li>
        <li>
          <a href="./pending-reg-ui.aspx">
            <span class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;Pending Registration
          </a>
        </li>
        <li><a href="./pending-ui.aspx"><span class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;Pending Surveys</a></li>
        <li>
          <a href="./survey-gen-director.aspx">
            <span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;Surveys
          </a>
        </li>
		    <li><a href="./statistics-ui.aspx"><span class="glyphicon glyphicon-signal"></span>&nbsp;&nbsp;Statistics</a></li>
			  <li><a href="./director-list-ui.aspx"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;List of Coordinators</a></li>
			  <li><a href="./alumni-list-ui.aspx"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;List of Registered users</a></li>
        <li>
          <a href="#" id="alumni_logout" runat="server">
            <span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;Log out
          </a>
        </li>
        <li>
          <asp:TextBox ID="account_idpk" runat="server" ></asp:TextBox>
        </li>
	    </ul>

    </div>