<nav class="navbar navbar-inverse navbar-fixed-top shadowed default-theme"> 
                    <div class="container pulled-height ">
                    <div class="navbar-header ">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand extended-brand " href="./Default.aspx">
                            <span class="pulled-left">
                                <asp:Image ID="Image1" style="float:left;" runat="server"  ImageUrl="~/rev/assets/images/TSULOGO.png" Height="60" Width="60" />
                                <h4 style="float:left;margin-left:30px;margin-top:20px;"> Tarlac State University</h4>
                               </span>

                            <div class="clearfix">
                                
                            </div>
                        </a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse" > <!---collapse collapse -->
                        
                            <br />
                        <div class="navbar-form navbar-right">
                        <div class="form-group">
                            <asp:TextBox placeholder="Student Number" class="form-control input-sm" runat="server" ID="txtLog_Username"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox placeholder="Password" TextMode="Password" class="form-control input-sm" runat="server" ID="txtLog_Password" ></asp:TextBox>
                        </div>
                          <input type="button" class="btn btn-warning btn-sm" value="Sign in" id="btnLogin"/>
                            <a href="./password-recovery.aspx" style="color:#fff;font-size:12px;">Forgot password?</a>
                       </div>
                        
                        
                    </div><!--/.navbar-collapse -->
                       
                    </div>
            </nav>-->