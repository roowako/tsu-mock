<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" EnableEventValidation="False"%>

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
              <!--#include file="./includes/login.inc"-->
            
                <!-- Content Start  -->
            
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
                                <input runat="server" type="text" id="txtStudent_Number" name="qwe" class="form-control" placeholder="Student Number" pattern="[0-0]{1}[9-9]{1}[0-9]{9}" title="09051234567" />
                            </div>
                            <div class="col-xs-6">
                                <p>Leave blank if you forgot your student number.</p>
                            </div>
                        </div>
                         <div class="row form-group" style="z-index:90;">
                            <div class="col-xs-6">
                                <input type="text" id="txtGiven_Name" pattern="[A-Za-z]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Given Name" required/>
                            </div>
                            <div class="col-xs-6">
                                <input type="text" id="txtFamily_Name" pattern="[A-Za-z]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Family Name" required/>
                            </div>
                         </div>
                         <div class="row form-group">
                            <div class="col-xs-6">
                                 <div class="input-group">
                                      <div class="input-group-addon">Middle Name</div>
                                      <input type="text"  id="txtMiddle_Name" pattern="[A-Za-z]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Middle Name" required/>
                                 </div>
                            </div>
                          </div>
                            <div class="row form-group">
                            <div class="col-xs-6">
                               <input type="text" style= "display:none;" id="txtMaiden_Name" pattern="[A-Za-z]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Maiden Name ( married only )" />
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
                                    <input type="text" id="txtCitizenship" pattern="[A-Za-z]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Citizenship" required />
                                </div>
                                <div class="col-xs-6">
                                    <input type="text" id="txtReligion" pattern="[A-Za-z]+" title="Numbers are not accepted." runat="server" class="form-control" placeholder="Religion" required />
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
                                            <asp:DropDownList ID="cboYearGraduated" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="1990" />
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
                            <div class="row form-group" id="self-employed-opt" style="display:none;">
                                <div class="col-xs-12">
                                    <label>Self-employment type  </label>
                                    <br /><br />
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                        <asp:ListItem Text="Business" />
                                        <asp:ListItem Text="Others" />
                                    </asp:RadioButtonList>
                                   
                                  
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
                                        <input type="text" id="txtPassword" runat="server" class="form-control" placeholder="Password" required />
                                    </div>
                                </div>
                            </div>
                             <div class="row form-group password-show" style="display:none;">
                                <div class=" col-sm-12">
                                     <div class="input-group ">
                                        <div class="input-group-addon">Re-type Password</div>
                                        <input type="text" id="txtConfirm_Password" runat="server" class="form-control" placeholder="Confirm Password" required />
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
        $(document).ready(function () {
            var q1;
            var q2;
            var q3;
            var q4;
            var q5;
            var self_employed_stats;
            var q6;
            var q7;

            var student_status;
            var emp_status;
            var unemp_status;
            var higher_education;
            var highest_education;

            $(".student_status").click(function () {
                student_status = $(".student_status :checked").val();
            });

            $(".emp_status").click(function () {
                emp_status = $(".emp_status :checked").val();
            });

            $("#emp_status_no").each(function () {
                $(this).click(function () {
                    unemp_status = $("#emp_status_no :checked").val();
                });
            });

  
            $("#first_emp").each(function () {
                $(this).click(function () {
                   q1 = $("#first_emp :checked").val();
                });
            });

            $("#field_relation").each(function () {
                $(this).click(function () {
                    q2 = $("#field_relation :checked").val();
                });
            });
            
            $("#employment_location").each(function () {
                $(this).click(function () {
                    q3 = $("#employment_location :checked").val();
                });
            });

            $("#company_classification").each(function () {
                $(this).click(function () {
                    q4 = $("#company_classification :checked").val();
                });
            });

            $(".nat_app").click(function () {
                q5 = $(".nat_app :checked").val();
            });

            $("#RadioButtonList1").each(function () {
                $(this).click(function () {
                    self_employed_stats = $("#RadioButtonList1 :checked").val();
                });
            });

            $("#pres_pos").each(function () {
                $(this).click(function () {
                    q6 = $("#pres_pos :checked").val();
                });
            });

            $("#work_duration").each(function () {
                $(this).click(function () {
                    q7 = $("#work_duration :checked").val();
                });
            });

            $(".fu-opt").click(function () {
                higher_education = $(".fu-opt :checked").val();
            });

            $("#highest_educ_attainment").each(function () {
                $(this).click(function () {
                    highest_education = $("#highest_educ_attainment :checked").val();
                });
            });

            //REGISTER
            
            $("#myForm").submit(function (e) {

                e.preventDefault();
                var data = $(this).serializeArray();
                $.ajax({
                    type: "post",
                    url: "./Default.aspx/pushToserver",
                    data: "",
                    success: function (r) {
                        alert(r);
                    }
                });
            });
            //FETCH COURSES
            $("#cboCollege").change(function () {
                $("#cboCourse").empty();
                var fk = $("#cboCollege option:selected").val();
                $.ajax({
                    type: "post",
                    url: "Default.aspx/fetchCourseByIdfk",
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
