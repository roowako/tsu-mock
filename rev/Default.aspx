<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TSU Alumin Tracer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/custom.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
</head>
<body>
        <form  runat="server">
        <div class="container-fluid">
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
                            <div class="clearfix"></div>
                        </a>

               
                    </div>
                    <div id="navbar" class="navbar-collapse collapse" > <!---collapse collapse -->
                        
                            <br />
                        <div class="navbar-form navbar-right">
                        <div class="form-group">
                            <asp:TextBox placeholder="Student Number" class="form-control input-sm" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox placeholder="Password" TextMode="Password" class="form-control input-sm" runat="server" ID="txtPassword" ></asp:TextBox>
                        </div>

         
                            <asp:Button ID="btnLogin" class="btn btn-default btn-sm" runat="server" Text="Sign In" />
                       </div>
                    </div><!--/.navbar-collapse -->
                    </div>
            </nav>-->
            
            <!-- Content Start  -->
            
            <div class="container pulled-down">
                <div class="row ">
                    <div class="col-sm-6 ">
                    </div>

                    <div class="col-sm-6 traverse-cont">
                        <div>
                            <h3 style="float:left;margin-top:0px;"> Register</h3>
                            <div class="clearfix"></div>
                         </div>     
                         <br />
                        <div class="">
                         
                        <div class="row form-group">
                            <div class="col-xs-6">
                                <asp:TextBox ID="txtStudent_Number" runat="server" CssClass="form-control" placeholder="Student Number"></asp:TextBox>
                            </div>
                            <div class="col-xs-6">
                                <p>Leave blank if you forgot your student number.</p>
                            </div>
                        </div>
                         <div class="row form-group" style="z-index:90;">
                            <div class="col-xs-6">
                                <asp:TextBox ID="txtGiven_Name" runat="server" CssClass="form-control" placeholder="Given Name" required></asp:TextBox>
                            </div>
                            <div class="col-xs-6">
                                <asp:TextBox ID="txtFamily_Name" runat="server" CssClass="form-control" placeholder="Family Name" required></asp:TextBox>
                            </div>
                         </div>

                         <div class="row form-group">
                             <div class="col-sm-6">
                                 <div class="input-group">
                                    <div class="input-group-addon">Gender &nbsp;</div>
                                        <asp:DropDownList ID="cboGender" runat="server" CssClass="form-control" required>
                                            <asp:ListItem Text="" />
                                            <asp:ListItem Text="Male" />
                                            <asp:ListItem Text="Female" />
                                        </asp:DropDownList>
                                 </div>
                            </div>
                        </div>

                         <div class="row form-group">
                            <div class="col-xs-6">
                                <asp:TextBox  ID="txtMiddle_Name" runat="server" CssClass="form-control" placeholder="Middle Name" required></asp:TextBox>
                            </div>
                            <div class="col-xs-6">
                                <asp:TextBox style= "display:none;" ID="txtMaiden_Name" runat="server" CssClass="form-control" placeholder="Maiden Name ( married only )"></asp:TextBox>
                            </div>
                        </div>

                         <div class="row form-group">
                             <div class="col-xs-12">
                                 <div class="input-group">
                                    <div class="input-group-addon"> Home Address</div>
                                    <asp:TextBox  CssClass="form-control" TextMode="multiline"  Rows="2" runat="server" ID="txtAddress" required/>
                                </div>
                             </div>
                         </div>

                         <div class="row form-group">
                             <div class="col-xs-5">
                                 <div class="input-group">
                                    <div class="input-group-addon"> Birthday Info</div>
                                        <asp:DropDownList ID="cboMonth" runat="server" CssClass="form-control" required>
                                            <asp:ListItem Text="January" />
                                            <asp:ListItem Text="February" />
                                            <asp:ListItem Text="March" />
                                            <asp:ListItem Text="April" />
                                            <asp:ListItem Text="May" />
                                            <asp:ListItem Text=" June" />
                                            <asp:ListItem Text="July" />
                                            <asp:ListItem Text="August" />
                                            <asp:ListItem Text="September" />
                                            <asp:ListItem Text="October" />
                                            <asp:ListItem Text="November" />
                                            <asp:ListItem Text="December" />
                                        </asp:DropDownList>
                                </div>
                             </div>

                             <div class="col-xs-3">
                                 <asp:DropDownList ID="cboDay" runat="server" CssClass="form-control" required>
                                    <asp:ListItem Text="1" />
                                    <asp:ListItem Text="2" />
                                    <asp:ListItem Text="3" />
                                    <asp:ListItem Text="4" />
                                    <asp:ListItem Text="5" />
                                    <asp:ListItem Text="6" />
                                    <asp:ListItem Text="7" />
                                    <asp:ListItem Text="8" />
                                    <asp:ListItem Text="9" />
                                    <asp:ListItem Text="10" />
                                    <asp:ListItem Text="11" />
                                    <asp:ListItem Text="12" />
                                    <asp:ListItem Text="13" />
                                    <asp:ListItem Text="14" />
                                    <asp:ListItem Text="15" />
                                    <asp:ListItem Text="16" />
                                    <asp:ListItem Text="17" />
                                    <asp:ListItem Text="18" />
                                    <asp:ListItem Text="19" />
                                    <asp:ListItem Text="20" />
                                    <asp:ListItem Text="21" />
                                    <asp:ListItem Text="22" />
                                    <asp:ListItem Text="23" />
                                    <asp:ListItem Text="24" />
                                    <asp:ListItem Text="25" />
                                    <asp:ListItem Text="26" />
                                    <asp:ListItem Text="27" />
                                    <asp:ListItem Text="28" />
                                    <asp:ListItem Text="29" />
                                    <asp:ListItem Text="30" />
                                    <asp:ListItem Text="31" />
                                </asp:DropDownList>
                             </div>

                             <div class="col-xs-4">
                                 <asp:DropDownList ID="cboYear" runat="server" CssClass="form-control" required>
                                    <asp:ListItem Text="1970" />
                                    <asp:ListItem Text="1971" />
                                    <asp:ListItem Text="1972" />
                                    <asp:ListItem Text="1973" />
                                    <asp:ListItem Text="1974" />
                                    <asp:ListItem Text="1975" />
                                    <asp:ListItem Text="1976" />
                                    <asp:ListItem Text="1977" />
                                    <asp:ListItem Text="1978" />
                                    <asp:ListItem Text="1979" />
                                    <asp:ListItem Text="1980" />
                                    <asp:ListItem Text="1981" />
                                    <asp:ListItem Text="1982" />
                                    <asp:ListItem Text="1983" />
                                    <asp:ListItem Text="1984" />
                                    <asp:ListItem Text="1985" />
                                    <asp:ListItem Text="1986" />
                                    <asp:ListItem Text="1987" />
                                    <asp:ListItem Text="1988" />
                                    <asp:ListItem Text="1989" />
                                    <asp:ListItem Text="1990" />
                                    <asp:ListItem Text="1991" />
                                    <asp:ListItem Text="1992" />
                                    <asp:ListItem Text="1993" />
                                    <asp:ListItem Text="1994" />
                                    <asp:ListItem Text="1995" />
                                    <asp:ListItem Text="1997" />
                                    <asp:ListItem Text="1998" />
                                    <asp:ListItem Text="1999" />
                                    <asp:ListItem Text="2000" />
                                </asp:DropDownList>
                             </div>
                         </div>

                         <div class="row form-group">
                             <div class="col-xs-12">
                                 <div class="input-group">
                                    <div class="input-group-addon">Birth Place</div>
                                 
                                    <asp:TextBox  CssClass="form-control" TextMode="multiline"  Rows="2" runat="server" ID="txtBirth_Place" required/>
                                </div>
                             </div>
                         </div>
                        </div>
                        
                        <div class="">
                            <div class="row form-group ">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <div class="input-group-addon">Telephone no. / Mobile no.</div>
                                        <asp:TextBox ID="txtMobile_Number" runat="server" placeholder="Contact Number" CssClass="form-control" required></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group phase-2">
                                <div class="col-xs-6">
                                    <asp:TextBox ID="txtCitizenship" runat="server" CssClass="form-control" placeholder="Citizenship" required></asp:TextBox>
                                </div>
                                <div class="col-xs-6">
                                    <asp:TextBox ID="txtReligion" runat="server" CssClass="form-control" placeholder="Religion" required></asp:TextBox>
                                </div>
                            </div>  
                        
                            <div class="form-group row phase-2">
                                <div class="col-xs-6">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Email Address" required></asp:TextBox>
                                </div>
                                  <div class="col-xs-6">
                                    <asp:TextBox ID="txtConfirm_Email" runat="server" CssClass="form-control" placeholder="Verify Email Address" required></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-xs-6">
                                    <div class="input-group">
                                        <div class="input-group-addon">Marital Status</div>
                                         <asp:DropDownList ID="cboMarital_Status" runat="server" CssClass="form-control" required>
                                            <asp:ListItem Text="Single" />
                                            <asp:ListItem Text="Married" />
                                            <asp:ListItem Text="Widowed" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="">
                            <div class="row form-group">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <div class="input-group-addon">Your current status</div>
                                        <div class="form-control">
                                            <asp:RadioButton ID="grad" runat="server" Text="Graduating" GroupName="userStat" ClientIDMode="Static" />
                                            &nbsp;
                                            <asp:RadioButton ID="alumni" runat="server" Text="Alumni" GroupName="userStat" ClientIDMode="Static" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="graduating-status-opt traversable-stat">
                                <div class="row form-group token_div" >
                                    <div class="col-xs-12">
                                        <asp:TextBox ID="token" runat="server" CssClass="form-control" placeholder="Token"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                            <div class="alumni-status-opt traversable-stat">
                                <div class="row  form-group" id="alumni_div">
                                    <div class="col-xs-12">
                                        <h3>Employment Status</h3>
                                        <label>Are you currently employed?</label>
                                        <asp:RadioButton ID="employed_yes" runat="server" Text="Yes" GroupName="ep_q" ClientIDMode="Static" />
                                        &nbsp;<asp:RadioButton ID="employed_no" runat="server" Text="No" GroupName="ep_q" ClientIDMode="Static" />
                                    </div>
                                </div>
                                <div class="row form-group ep-no" style="display:none;">
                                    <div class="col-xs-12">
                                        <asp:Label Text="If unemployed choose your status" runat="server" />
                                        <br /><br />
                                        <asp:RadioButtonList ID="emp_status_no" runat="server">
                                       
                                            <asp:ListItem Text="End of Contract" />
                                            <asp:ListItem Text="Resigned or Terminated" />
                                            <asp:ListItem Text="Not employed but seeking employment" />
                                            <asp:ListItem Text="Not employed and not intending to be employed " />
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                              
                                <div class="row form-group ep-yes" style="display:none;">
                                    <div class="col-xs-12">
                                        <label>1. How long did it take to find your First employment? </label>
                                        <br /><br />
                                        <asp:RadioButtonList ID="first_emp" runat="server">
                                            <asp:ListItem Text="1 to 3 months " />
                                            <asp:ListItem Text="4 to 6 months" />
                                            <asp:ListItem Text="7 months to 1 year" />
                                            <asp:ListItem Text="Others" />
                                        </asp:RadioButtonList>
                                    </div>
                                    
                                </div>
                                <div class="row form-group ep-yes" style="display:none;">
                                    <div class="col-xs-12">
                                        <label>2. Is your current work/job is aligned to your field of education?  </label>
                                        <br /><br />
                                        <asp:RadioButtonList ID="field_relation" runat="server">                                      
                                                <asp:ListItem Text="Yes" />
                                                <asp:ListItem Text="No" />
                                        </asp:RadioButtonList>
                                    </div>
                                    
                                </div>
                            </div>
                            
                        </div>

                        <div class="">
                            <div class="row form-group ep-yes" style="display:none;">
                                <div class="col-xs-12">
                                    <label>3. Location of employment:   </label>
                                    <br /><br />
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                           
                                            <asp:ListItem Text="Abroad" />
                                            <asp:ListItem Text="Local" />
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="row form-group ep-yes" style="display:none;">
                                <div class="col-xs-12">
                                    <label>4. The classification of your company or institution:    </label>
                                    <br /><br />
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                                           
                                            <asp:ListItem Text="Private" />
                                            <asp:ListItem Text="Public" />
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="row form-group ep-yes" style="display:none;">
                                <div class="col-xs-12">
                                    <label>5. Nature of Appointment: </label>
                                    <br /><br />
                                    <asp:RadioButton CssClass="nat_app" ID="RadioButton1" runat="server" Text="Regular" GroupName="nature_app" />
                                    <asp:RadioButton CssClass="nat_app" ID="RadioButton2" runat="server" Text="Probation" GroupName="nature_app" />
                                    <asp:RadioButton ID="self_emp_opt" runat="server" Text="Self-employed" GroupName="nature_app" />
                                </div>
                            </div>
                            <div class="row form-group" id="self-employed-opt" style="display:none;">
                                <div class="col-xs-12">
                                    <label>Self-employment type  </label>
                                    <br /><br />
                                    <asp:RadioButton ID="RadioButton4" runat="server" Text="Business" GroupName="sep_type" />
                                    <asp:RadioButton ID="RadioButton5" runat="server" Text="Others" GroupName="sep_type" />
                                  
                                </div>
                            </div>
                        </div>

                        <div class="">
                            <div class="row form-group ep-yes" style="display:none;">
                                <div class="col-xs-12">
                                    <label>6. What is your Present Position? </label>
                                    <br /><br />
                                    <asp:RadioButton  ID="pres_pos1" runat="server" Text="Rank and File" GroupName="b" />
                                    <asp:RadioButton  ID="pres_pos2" runat="server" Text="Supervisory Level" GroupName="b" />
                                    <asp:RadioButton ID="pres_pos3" runat="server" Text="Self-employed" GroupName="b" />
                                    <asp:RadioButton ID="pres_pos4" runat="server" Text="Self-employed" GroupName="b" />
                                </div>
                            </div>

                            <div class="row form-group ep-yes" style="display:none;">
                                <div class="col-xs-12">
                                    <label>7. How long have you been working in your current company? </label>
                                    <br /><br />
                                    <asp:RadioButton  ID="RadioButton3" runat="server" Text="1 to 6 months " GroupName="c" />
                                    <asp:RadioButton  ID="RadioButton6" runat="server" Text="7 months to 1 year" GroupName="c" />
                                    <asp:RadioButton ID="RadioButton7" runat="server" Text="1 year to 3 years" GroupName="c" />
                                    <asp:RadioButton ID="RadioButton8" runat="server" Text="Others " GroupName="c" />
                                </div>
                            </div>
                            <div class="row form-group ep-yes" style="display:none;">
                                <div class="col-xs-12">
                                    <label>Further Study : </label>
                                     <label>Did you pursue a higher level of Education?</label>

                                    <asp:RadioButton  ID="fu_opt_yes" runat="server" Text="Yes" GroupName="d" CssClass="fu-opt" />
                                    <asp:RadioButton  ID="fu_opt_no" runat="server" Text="No" GroupName="d" CssClass="fu-opt"/>
                                   
                                </div>
                            </div>
                            <div class="row form-group fu-ans" style="display:none;">
                                <div class="col-xs-12">
                                    <label>Choose your highest Educational Attainment </label>
                                 
                                    <asp:RadioButton  ID="RadioButton9" runat="server" Text="Doctoral" GroupName="e" CssClass="fu-opt" />
                                    <asp:RadioButton  ID="RadioButton10" runat="server" Text="Masters" GroupName="e" CssClass="fu-opt"/>
                                    <asp:RadioButton  ID="RadioButton11" runat="server" Text="Others" GroupName="e" CssClass="fu-opt"/>
                                   
                                </div>
                            </div>

                          
                            <div class="row form-group password-show" style="display:none;">
                                <div class=" col-sm-12">
                                    <div class="input-group">
                                        <div class="input-group-addon">Password</div>
                                        <asp:TextBox ID="txtAccountPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>

                                    </div>
                                </div>
                            </div>
                             <div class="row form-group password-show" style="display:none;">
                                <div class=" col-sm-12">
                                     <div class="input-group ">
                                        <div class="input-group-addon">Re-type Password</div>
                                        <asp:TextBox ID="txtRetypePassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>

                                    </div>
                                </div>
                            </div>

                            <div class="row form-group createShow" style="display:none;">
                                <div class="col-sm-4">
                                    <asp:Button ID="creatBtn" runat="server" Text="Create Account" CssClass="btn btn-success" />
                                </div>
                            </div>
                        </div>
                     
                    </div>



                     
            </div>
               
                </div>
       </div>
       
     </form>

    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
</body>
</html>
