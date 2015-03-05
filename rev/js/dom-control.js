$(document).ready(function () {
   
   


    $(function () {
        $("#goto_messagesUI_c").click(function (e) {
            e.preventDefault();
            $.get("./Ui/messagesUI-coordinator.aspx", function (autoLoad) {
                $("#content-updatable").html(autoLoad).show();

            });
        });

        $("#goto_messagesUI_c").click(function (e) {
            e.preventDefault();
            $.get("./Ui/messagesSideBar-coordinator.aspx", function (autoLoad) {
                $("#sidebar-updatable").html(autoLoad).show();

            });
        });

    });





    $(function () {
        $("#goto_pollUI").click(function (e) {
            e.preventDefault();
            $.get("./Ui/pollQuestion.aspx", function (autoLoad) {
                $("#content-updatable").html(autoLoad).show();
              
            });
        });

        $("#goto_pollUI").click(function (e) {
            e.preventDefault();
            $.get("./Ui/pollSideBar.aspx", function (autoLoad) {
                $("#sidebar-updatable").html(autoLoad).show();
                
            });
        });

    });


    $(function () {
        $("#goto_surveyUI").click(function (e) {
            e.preventDefault();
            $.get("./Ui/surveyUI.aspx", function (autoLoad) {
                $("#content-updatable").html(autoLoad).show();
               
            });
        });

        $("#goto_surveyUI").click(function (e) {
            e.preventDefault();
            $.get("./Ui/surveySideBar.aspx", function (autoLoad) {
                $("#sidebar-updatable").html(autoLoad).show();
               
            });
        });

    });

    $(function () {
        $("#goto_tokenUI").click(function (e) {
            e.preventDefault();
            $.get("./Ui/tokenUI.aspx", function (autoLoad) {
                $("#content-updatable").html(autoLoad).show();

            });
        });

        $("#goto_tokenUI").click(function (e) {
            e.preventDefault();
            $.get("./Ui/tokenSideBar.aspx", function (autoLoad) {
                $("#sidebar-updatable").html(autoLoad).show();

            });
        });

    });

    $(function () {
        $("#goto_statisticsUI").click(function (e) {
            e.preventDefault();
            $.get("./Ui/statisticsUI.aspx", function (autoLoad) {
                $("#content-updatable").html(autoLoad).show();

            });
        });

        $("#goto_statisticsUI").click(function (e) {
            e.preventDefault();
            $.get("./Ui/tokenSideBar.aspx", function (autoLoad) {
                $("#sidebar-updatable").html("").hide();

            });
        });

    });
    

    var divs = $(".traverse-cont>.traverse");
    var defaultView = 0;
    $("#prev").hide();
    $("#create_btn").hide();
    divs.hide().first().show();
  
    $("#next").click(function (e) {
        divs.eq(defaultView).hide();
        defaultView = (defaultView + 1 < divs.length) ? defaultView + 1 : 0;
        divs.eq(defaultView).show();
       
        $("#prev").show();
    });

    $("#prev").click(function(e){
        divs.eq(defaultView).hide();
        defaultView = (defaultView > 0) ? defaultView - 1 : divs.length - 1;
        divs.eq(defaultView).show();
        if (defaultView == 0) { $(this).hide(); }
    });
        
    var travDiv = $(".traversable-stat").css("display", "none");

    $("#grad").click(function () {
        
        $(".graduating-status-opt").show();
        $(".alumni-status-opt").hide();
        $(".password-show").show();
        $(".createShow").show();
        $(".ep-yes").hide();
    });


    $("#alumni").click(function () {
        $(".graduating-status-opt").hide();
        $(".alumni-status-opt").show();
        $(".password-show").hide();
        $(".createShow").hide();
       
    });

    $("#employed_no").click(function () {
        $(".ep-yes").hide();
        $(".password-show").show();
        $(".createShow").show();
    });

    $("#employed_yes").click(function () {
        $(".ep-yes").show();
        $(".ep-no").hide();
        $(".password-show").show();
        $(".createShow").show();
    });

    $("#self_emp_opt").change(function () {
        $("#self-employed-opt").show();
    });

    $(".nat_app").click(function () {
        $("#self-employed-opt").hide();
    });

    $("#fu_opt_yes").click(function () {
        $(".fu-ans").show();
        $("#create_btn").show();
    });
    $("#fu_opt_no").click(function () {
        $(".fu-ans").hide();
        $("#create_btn").show();
    });
});


$("#cboGender").change(function () {
    if ($(this).val() == "Male") {
        $("#txtMaiden_Name").hide();
    } else if ($(this).val() == "Female" && $("#cboMarital_Status").val() == "Married") {
        $("#txtMaiden_Name").show();
    } else if ($(this).val() == "Female" && $("#cboMarital_Status").val() == "Widowed") {
        $("#txtMaiden_Name").show();
    } else { $("#txtMaiden_Name").hide(); }
});

$("#cboMarital_Status").change(function () {

    if ($(this).val() == "Single" && $("#cboGender").val() == "Male" ) {
        $("#txtMaiden_Name").hide();
    } else if ($(this).val() == "Married" && $("#cboGender").val() == "Female") {
        $("#txtMaiden_Name").show();
    }
    else if ($(this).val() == "Widowed" && $("#cboGender").val() == "Female") {
        $("#txtMaiden_Name").show();
    } else if ($(this).val() == "Single" && $("#cboGender").val() == "Female") {
        $("#txtMaiden_Name").hide();
    }
});