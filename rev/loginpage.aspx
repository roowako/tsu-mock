<%@ Page Language="VB" AutoEventWireup="false" CodeFile="loginpage.aspx.vb" Inherits="_Default" EnableEventValidation="True"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TSU Alumin Tracer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/custom.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
</head>
<body>
    <form action="Default.aspx" runat="server" id="myForm">
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
                            <span class="pulled-left">
                                <asp:Image ID="Image1" style="float:left;" runat="server"  ImageUrl="./assets/images/TSULOGO.png" Height="60" Width="60" />
                                <h4 style="float:left;margin-left:30px;margin-top:20px;"> Tarlac State University</h4>
                               </span>

                            <div class="clearfix">
                                
                            </div>
                        </a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse" > <!---collapse collapse -->
                        <br />
                        <div class="navbar-form navbar-right">

                            <a href="./Default.aspx" class="btn btn-warning btn-sm" style="color:#fff;font-size:13px;">Already have an account? Log in here</a>
                       </div>
                        
                        
                    </div><!--/.navbar-collapse -->
                       
                    </div>
            </nav>
                             

            <div class="container pulled-down">
                <div class="row ">
                    <div class="col-sm-6 ">
                        <div class="clearfix">
                            <asp:Label runat="server" ID="login_result"></asp:Label>
                        </div>                                  
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
                                <input runat="server" type="text" id="txtStudent_Number" name="qwe" class="form-control" placeholder="Student Number" pattern="[0-9]+" title="Letters and special characters are not allowed" />
                            </div>
                            <div class="col-xs-6">
                                <p>Leave blank if you forgot your student number.</p>
                            </div>
                        </div>
                         <div class="row form-group" style="z-index:90;">
                            <div class="col-xs-6">
                                <input type="text" id="txtGiven_Name" pattern="[A-Za-z\s]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Given Name" required/>
                            </div>
                            <div class="col-xs-6">
                                <input type="text" id="txtFamily_Name" pattern="[A-Za-z\s]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Family Name" required/>
                            </div>
                         </div>
                         <div class="row form-group">
                            <div class="col-xs-6">
                                 <div class="input-group">
                                      <div class="input-group-addon">Middle Name</div>
                                      <input type="text"  id="txtMiddle_Name" pattern="[A-Za-z\s]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Middle Name" required/>
                                 </div>
                            </div>
                          </div>
                            <div class="row form-group">
                            <div class="col-xs-6">
                               <input type="text" style= "display:none;" id="txtMaiden_Name" pattern="[A-Za-z\s]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Maiden Name ( married only )" />
                            </div>
                            </div>
                         <div class="row form-group">
                             <div class="col-sm-6">
                                 <div class="input-group">
                                    <div class="input-group-addon">Gender &nbsp;</div>
                                        <asp:DropDownList ID="cboGender" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="" />
                                            <asp:ListItem Text="Male" />
                                            <asp:ListItem Text="Female" />
                                        </asp:DropDownList>
                                 </div>
                            </div>
                              <div class="col-xs-6">
                                    <div class="input-group">
                                        <div class="input-group-addon">Marital Status</div>
                                         <asp:DropDownList ID="cboMarital_Status" runat="server" CssClass="form-control" >
                                            <asp:ListItem Text="Single" />
                                            <asp:ListItem Text="Married" />
                                            <asp:ListItem Text="Widowed" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                        </div>

                        

                         <div class="row form-group">
                             <div class="col-xs-12">
                                 <div class="input-group">
                                    <div class="input-group-addon"> Home Address</div>
                                    <input type="text"  class="form-control" textmode="multiline"  rows="2" runat="server" id="txtAddress" required />
                                </div>
                             </div>
                         </div>

                         <div class="row form-group">
                             <div class="col-xs-5">
                                 <div class="input-group">
                                    <div class="input-group-addon"> Birthday Info</div>
                                        <asp:DropDownList ID="cboMonth" runat="server" CssClass="form-control" >
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
                                 <asp:DropDownList ID="cboDay" runat="server" CssClass="form-control" >
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
                                 <asp:DropDownList ID="cboYear" runat="server" CssClass="form-control" >
                                       
                                </asp:DropDownList>
                             </div>
                         </div>

                         <div class="row form-group">
                             <div class="col-xs-12">
                                 <div class="input-group">
                                    <div class="input-group-addon">Birth Place</div>
                                 
                                    <input type="text" class="form-control" textmode="multiline"  rows="2" runat="server" id="txtBirth_Place" required/>
                                </div>
                             </div>
                         </div>
                        </div>
                        
                        <div class="">
                            <div class="row form-group ">
                                <div class="col-xs-12">
                                    <div class="input-group">
                                        <div class="input-group-addon">Telephone no. / Mobile no.</div>
                                       <label for="txtMobile_Number"></label>
                                        <input type="text"  name="name" pattern="[0-0]{1}[9-9]{1}[0-9]{9}" title="091512345678" id="txtMobile_Number" placeholder="Contact Number" class="form-control" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group phase-2">
                                <div class="col-xs-6">
                                    <input type="text" id="txtCitizenship" pattern="[A-Za-z\s]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Citizenship" required />
                                </div>
                                <div class="col-xs-6">
                                    <input type="text" id="txtReligion" pattern="[A-Za-z\s]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Religion" required />
                                </div>
                            </div>  
                        
                            <div class="form-group row phase-2">
                                <div class="col-xs-6">
                                    <input type="email" name="name" value=" " id="txtEmail"  placeholder="Email Address" class="form-control" required />
                                </div>
                                  <div class="col-xs-6">
                                    <input type="email" id="txtConfirm_Email" class="form-control" placeholder="Verify Email Address" required />
                                </div>
                            </div>

                            <div class="form-group row">
                               
                            </div>

                            <div class="form-group row">
                                <div class="col-xs-6">
                                    <div class="input-group">
                                        <div class="input-group-addon">College</div>
                                         <asp:DropDownList ID="cboCollege" runat="server" CssClass="form-control" ClientIDMode="Static">
                                             <asp:ListItem Text="College 1" />
                                        </asp:DropDownList>
                                    </div>
                                     
                                </div>
                                <div class="col-xs-6">
                                    <div class="input-group">
                                        <div class="input-group-addon">Course</div>

                                            <asp:DropDownList ID="cboCourse" runat="server" CssClass="form-control">

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
                                            <asp:RadioButton ID="grad" runat="server" Text="Graduating" GroupName="userStat" ClientIDMode="Static " CssClass="student_status"/>
                                            &nbsp;
                                            <asp:RadioButton ID="alumni" runat="server" Text="Alumni" GroupName="userStat" ClientIDMode="Static " CssClass="student_status"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="graduating-status-opt traversable-stat">
                                <div class="row form-group token_div" >
                                    <div class="col-xs-12">
                                        <input type="text" id="token" runat="server" class="form-control" placeholder="Token" />
                                    </div>
                                </div>
                            </div>

                            <div class="alumni-status-opt traversable-stat">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="input-group">
                                            <div class="input-group-addon">Year Graduated</div>
                                            <asp:DropDownList ID="cboYear_Graduated" runat="server" CssClass="form-control">
                                                
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row  form-group" id="alumni_div">

                                    <div class="col-xs-12">
                                        <h3>Employment Status</h3>
                                        <label>Are you currently employed?</label>
                                        <asp:RadioButton ID="employed_yes" runat="server" Text="Yes" GroupName="ep_q" ClientIDMode="Static" CssClass="emp_status"/>
                                        &nbsp;<asp:RadioButton ID="employed_no" runat="server" Text="No" GroupName="ep_q" ClientIDMode="Static" CssClass="emp_status"/>
                                    </div>
                                </div>
                                <div class="row form-group ep-nos" style="display:none;">
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
                                        <asp:RadioButtonList ID="first_emp" runat="server" ClientIDMode="Static">
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
                                    <asp:RadioButtonList ID="employment_location" runat="server">
                                            <asp:ListItem Text="Abroad" />
                                            <asp:ListItem Text="Local" />
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="row form-group ep-yes" style="display:none;">
                                <div class="col-xs-12">
                                    <label>4. The classification of your company or institution:    </label>
                                    <br /><br />
                                    <asp:RadioButtonList ID="company_classification" runat="server">
                                            <asp:ListItem Text="Private" />
                                            <asp:ListItem Text="Public" />
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="row form-group ep-yes" style="display:none;">
                                <div class="col-xs-12">
                                    <label>5. Nature of Appointment: </label>
                                    <br /><br />
                                    <asp:RadioButton CssClass="nat_app" ID="nat_app_reg" runat="server" Text="Regular" GroupName="nature_app" />
                                    <asp:RadioButton CssClass="nat_app" ID="nat_app_prob" runat="server" Text="Probation" GroupName="nature_app" />
                                    <asp:RadioButton CssClass="nat_app" ID="self_emp_opt" runat="server" Text="Self-employed" GroupName="nature_app" />
                                </div>
                            </div>
                            
                        </div>

                        <div class="">
                            <div class="row form-group ep-yes" style="display:none;">
                                <div class="col-xs-12">
                                    <label>6. What is your Present Position? </label>
                                    <br /><br />

                                    <asp:RadioButtonList ID="pres_pos" runat="server">
                                        <asp:ListItem Text="Rank and File" />
                                        <asp:ListItem Text="Supervisory Level" />
                                        <asp:ListItem Text="Managerial Level" />
                                        <asp:ListItem Text="Others" />
                                    </asp:RadioButtonList>

                                    
                                </div>
                            </div>

                            <div class="row form-group ep-yes" style="display:none;">
                                <div class="col-xs-12">
                                    <label>7. How long have you been working in your current company? </label>
                                    <br /><br />
                                    <asp:RadioButtonList ID="work_duration" runat="server">
                                        <asp:ListItem Text="1 to 6 months" />
                                        <asp:ListItem Text="7 months to 1 year" />
                                        <asp:ListItem Text="1 year to 3 years" />
                                        <asp:ListItem Text="Others" />    
                                    </asp:RadioButtonList>                                    
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
                                    <asp:RadioButtonList ID="highest_educ_attainment" runat="server">
                                        <asp:ListItem Text="Doctoral" />
                                        <asp:ListItem Text="Masteral" />
                                        <asp:ListItem Text="Others" />
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                   
                            <div class="row form-group password-show" style="display:none;">
                                <div class=" col-sm-12">
                                    <div class="input-group">
                                        <div class="input-group-addon">Password</div>
                                        <input type="password" id="txtPassword" pattern=".{8,}" title="Minimum of 8 characters for password required." runat="server" class="form-control" placeholder="Password" required />
                                    </div>
                                </div>
                            </div>

                             <div class="row form-group password-show" style="display:none;">
                                <div class=" col-sm-12">
                                     <div class="input-group ">
                                        <div class="input-group-addon">Re-type Password</div>
                                        <input type="password" id="txtConfirm_Password" pattern=".{8,}" title="Minimum of 8 characters for password required." runat="server" class="form-control" placeholder="Confirm Password" required />
                                    </div>
                                </div>
                            </div>

                            <div class="row form-group createShow">
                                <div class="col-sm-4">
                                    <input type="submit" runat="server" value="Create account" id="createBtn" class="btn btn-success"/>
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
    <script>
        document.getElementById("myForm").addEventListener("submit", myFunction);

        //REGISTRATION
        function myFunction() {
            var student_number = $("#txtStudent_Number").val();
            var given_name = $("#txtGiven_Name").val();
            var middle_name = $("#txtMiddle_Name").val();
            var family_name = $("#txtFamily_Name").val();
            var maiden_name = $("#txtMaiden_Name").val();
            var gender = $("#cboGender").val();
            var marital_status = $("#cboMarital_Status").val();
            var address = $("#txtAddress").val();
            var birthday = $("#cboMonth").val() + " " + $("#cboDay").val() + ", " + $("#cboYear").val();
            var birthplace = $("#txtBirth_Place").val();
            var number = $("#txtMobile_Number").val();
            var citizenship = $("#txtCitizenship").val();
            var religion = $("#txtReligion").val();
            var email = $("#txtEmail").val();
            var cemail = $("#txtConfirm_Email").val();
            var password = $("#txtPassword").val();
            var cpassword = $("#txtConfirm_Password").val();
            var token = $("#token").val();

            var student_status = $(".student_status :checked").val();
            var college = $("#cboCollege").val();
            var course = $("#cboCourse").val();

            var year_graduated = $("#cboYear_Graduated").val();
            var employment_status = $(".emp_status :checked").val();
            var unemployed_status = $("#emp_status_no :checked").val();
            var q1 = $("#first_emp :checked").val();
            var q2 = $("#field_relation :checked").val();
            var q3 = $("#employment_location :checked").val();
            var q4 = $("#company_classification :checked").val();
            var q5 = $(".nat_app :checked").val();
            var q6 = $("#pres_pos :checked").val();
            var q7 = $("#work_duration :checked").val();
            var higher_education = $(".fu-opt :checked").val();
            var highest_education = $("#highest_educ_attainment :checked").val();

            if (student_status == "grad") {
                if (student_number == "" || student_number == null) {
                    alert("Student number is required for graduating students.");
                }
                else if (gender == "" || gender == null) {
                    alert("Please select your gender.");
                }
                else if (email != cemail) {
                    alert("Emails do not match.")
                }
                else if (college == " " || college == null) {
                    alert("Please select college.");
                }
                else if (course == " " || course == null) {
                    alert("Please select course.");
                }
                else if (password != cpassword) {
                    alert("Passwords do not match.");
                }
                else {
                    $.ajax({
                        type: "post",
                        url: "./loginpage.aspx/graduate_register",
                        data: "{'student_number':'" + student_number + "','given_name':'" + given_name + "','middle_name':'" + middle_name + "','family_name':'" + family_name + "','maiden_name':'" + maiden_name + "','gender':'" + gender + "','marital_status':'" + marital_status + "','address':'" + address + "','birthday':'" + birthday + "','birthplace':'" + birthplace + "','number':'" + number + "','citizenship':'" + citizenship + "','religion':'" + religion + "','email':'" + email + "','password':'" + password + "','college':'" + college + "','course':'" + course + "','token':'" + token + "'}",
                        dataType: "json",
                        processData: false,
                        traditional: true,
                        contentType: "application/json; charset=utf-8",
                        success: function (r) {
                            alert(r.d);

                            if (r.d == "Thank you for registering. You are registered as graduating. You can now login your account.") {
                                window.location.reload(true);
                            } 
                        }
                    });
                }
            }
            else if (student_status == "alumni") {
                if (gender == "" || gender == null) {
                    alert("Please select your gender.");
                }
                else if (email != cemail) {
                    alert("Emails do not match.")
                }
                else if (college == " " || college == null) {
                    alert("Please select college.");
                }
                else if (course == " " || course == null) {
                    alert("Please select course.");
                }
                else if (password != cpassword) {
                    alert("Passwords do not match.");
                }
                else if (employment_status == "" || employment_status == null) {
                    alert("Please select employment status.");
                }
                else {
                    if (employment_status == "employed_yes" && q1 == undefined) {
                        alert("Please answer survey question 1.");
                    }
                    else if (employment_status == "employed_yes" && q2 == undefined) {
                        alert("Please answer survey question 2.");
                    }
                    else if (employment_status == "employed_yes" && q3 == undefined) {
                        alert("Please answer survey question 3.");
                    }
                    else if (employment_status == "employed_yes" && q4 == undefined) {
                        alert("Please answer survey question 4.");
                    }
                    else if (employment_status == "employed_yes" && q5 == undefined) {
                        alert("Please answer survey question 5.");
                    }
                    else if (employment_status == "employed_yes" && q6 == undefined) {
                        alert("Please answer survey question 6.");
                    }
                    else if (employment_status == "employed_yes" && q7 == undefined) {
                        alert("Please answer survey question 7.");
                    }
                    else if (employment_status == "employed_yes" && higher_education == undefined) {
                        alert("Please select if you pursue higher level of education.");
                    }
                    else if (higher_education == "fu_opt_yes" && highest_education == undefined) {
                        alert("Please select your highest educational attainment.");
                    }
                    else {
                        $.ajax({
                            type: "post",
                            url: "./loginpage.aspx/alumni_register",
                            data: "{'highest_education':'" + highest_education + "','higher_education':'" + higher_education + "','q7':'" + q7 + "','q6':'" + q6 + "','q5':'" + q5 + "','q4':'" + q4 + "','q3':'" + q3 + "','q2':'" + q2 + "','q1':'" + q1 + "','employment_status':'" + employment_status + "','year_graduated':'" + year_graduated + "','student_number':'" + student_number + "','given_name':'" + given_name + "','middle_name':'" + middle_name + "','family_name':'" + family_name + "','maiden_name':'" + maiden_name + "','gender':'" + gender + "','marital_status':'" + marital_status + "','address':'" + address + "','birthday':'" + birthday + "','birthplace':'" + birthplace + "','number':'" + number + "','citizenship':'" + citizenship + "','religion':'" + religion + "','email':'" + email + "','password':'" + password + "','college':'" + college + "','course':'" + course + "'}",
                            dataType: "json",
                            processData: false,
                            traditional: true,
                            contentType: "application/json; charset=utf-8",
                            success: function (r) {
                                alert(r.d);

                                if (r.d == "Registration successful, your account is under review due to lack of information. Please wait for your account to be activated." || r.d == "Registration successful. Thank you for registering, you can now login.") {
                                    window.location.reload(true);
                                } 
                            }
                        });
                    }
                }
            }
            else {
                alert("Please select your current status.")
            }
        }
    </script>

    <script>
        $(document).ready(function () {
            //REGISTER
            $("#myForm").submit(function (e) {
                e.preventDefault();
            });

            //FETCH COURSES
            $("#cboCollege").change(function () {
                $("#cboCourse").empty();
                var fk = $("#cboCollege option:selected").val();
                console.log(fk);
                $.ajax({
                    type: "post",
                    url: "loginpage.aspx/fetchCourseByIdfk",
                    data: "{'collegeFk':'" + fk + "'}",
                    dataType: "json",
                    processData: false,
                    traditional: true,
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        data = response.d;
                        data = jQuery.parseJSON(data);
                        $.each(data, function (i, o) {

                            $("#cboCourse").append(
                                "<option>" + o.description  + " </option>"
                                );
                        });
                        console.log(response.d);
                    }

                });
                
            });
        });
    </script>

    
</body>
</html>
