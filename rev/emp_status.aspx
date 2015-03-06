<%@ Page Language="VB" AutoEventWireup="false" CodeFile="emp_status.aspx.vb" Inherits="emp_status" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employment Survey</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />
    <link href="./css/normalize.css" rel="stylesheet" />
    <link href="./css/sidebar-theme.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
          <nav class="navbar navbar-inverse navbar-fixed-top default-theme shadowed"> 
                <div class="container-fluid">
                <div class="navbar-header ">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand extended-brand " href="./#">
                        <span class="">
                            <asp:Image ID="Image1" runat="server" ImageUrl="./assets/images/TSULOGO.png" Height="55" Width="55" CssClass="img-float-nav" />
                            <h3>&nbsp;&nbsp;&nbsp;Dashboard</h3>
                                <span class="clearfix"></span>
                        </span>                      
                    </a>            
                </div>
                <div id="navbar" class="navbar-collapse collapse" > <!---collapse collapse -->
                
                </div><!--/.navbar-collapse -->
                </div>
            </nav>-->
       
            <div class="container" style="margin-top:50px;">
                <div class="row">
                    <div class="col-xs-3">
                      
                    </div>
                    <div class="col-xs-5">
                   
                        <div class="row">
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
                                    <br />
                                    <asp:RadioButton  ID="fu_opt_yes" runat="server" Text="Yes" GroupName="d" CssClass="fu-opt" />
                                    <asp:RadioButton  ID="fu_opt_no" runat="server" Text="No" GroupName="d" CssClass="fu-opt"/>
                                   
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
                            </div>

                            
                   
                             <div class="row form-group createShow">
                                 <br />
                                <div class="col-sm-4">
                                    <input type="button"  value="Submit my answers" class="btn btn-success" id="s"/>
                                </div>
                            </div>
                             
                            <br />
                        </div>
                    </div>
                    <div class="col-xs-4">
                        
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" src="./js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./js/dom-control.js"></script>
    <script>



        $("#s").click(function (e) {
       
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

            if (employment_status == "" || employment_status == null) {
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
                        url: "./emp_status.aspx/alumni_register",
                        data: "{'highest_education':'" + highest_education + "','higher_education':'" + higher_education + "','q7':'" + q7 + "','q6':'" + q6 + "','q5':'" + q5 + "','q4':'" + q4 + "','q3':'" + q3 + "','q2':'" + q2 + "','q1':'" + q1 + "','employment_status':'" + employment_status + "'}",
                        dataType: "json",
                        processData: false,
                        traditional: true,
                        contentType: "application/json; charset=utf-8",
                        success: function (r) {
                            alert(r.d);

                            if (r.d == "gg") {
                                document.location = "./home.aspx";
                            } 
                        }
                    });
                }
            }
        

        });
        
    </script>
</body>
</html>
