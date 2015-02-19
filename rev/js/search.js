$(document).ready(function () {
    var last;
    var sortBy;

    //Search Function
    $.fn.search = function (event) {
        var ESC = 27;
        var SPACE = 32;
        var BACKSPAE = 8;
        event.preventDefault();
        var key = event.which || event.keyCode;
        var input = $(this).val().trim();
        var f = input.match(/^[a-zA-Z\s]+$/);

        if (key !== ESC) {
            $(".resultContainer").html("Fetching results");
           
            $.ajax({
                type: "post",
                url: "alumni-list-ui.aspx/searchQ",
                data: "{'q':'" + f + "'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (response) {

                    if (response.d == "[]") {
                        $(".resultContainer").html("");
                        $(".resultContainer").addClass("animateOnDisplay");
                        $(".resultContainer").append("<br>" + "No results found for " + "<span>" + input + " </span>");
                        

                    } 
                        $("#searchableTable tbody").html("");
                        data = response.d;
                        data = jQuery.parseJSON(data);
                        var last = data.length - 1;
                        $.each(data, function (i, o) {
                          
                            
                             
                                $(".resultContainer").html("");
                                $(".resultContainer").append("<br>" + "Found " + "<span>" + data.length + " result(s) for " + input + " </span>");

                                if (o.userlevel_idfk == 1) {
                                    var mod = ("<tr class='success'>" +
                                               "<td> " + o.account_idpk + " </td>" +
                                               "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                               "<td> " + o.collegeDes + " </td>" +
                                               "<td> " + o.courseDes + " </td>" +
                                               "<td></td>" +
                                               "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'> View info </a> </td>" +
                                                "</tr>");
                                } else {
                                    var mod = ("<tr class='warning'>" +
                                              "<td> " + o.account_idpk + " </td>" +
                                              "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                              "<td> " + o.collegeDes + " </td>" +
                                              "<td> " + o.courseDes + " </td>" +
                                              "<td></td>" +
                                              "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg'> View info </a> </td>" +
                                               "</tr>");
                                }
                               
                                $(".resultContainer").addClass("animateOnDisplay");

                                $(".searchableTable tbody").append(
                                   mod
                               );

                            
                            
                           
                        });

                        $(".viewAccountInfo").click(function () {

                            accId = $(this).data("account-id");
                            $("#accountInfoPlaceholder tbody ").html("");
                            $.ajax({
                                type: "post",
                                url: "pending-reg-ui.aspx/fetchAccountInfo",
                                data: "{'accId':'" + accId + "'}",
                                dataType: "json",
                                processData: false,
                                traditional: true,
                                contentType: "application/json; charset=utf-8",
                                success: function (approvalResponse) {
                                    response = approvalResponse.d;
                                    response = jQuery.parseJSON(response);
                                    $.each(response, function (i, o) {
                                        console.log(o.student_id);


                                        $("#myModalLabel").text(o.given_name + "  " + o.middle_name + " " + o.family_name);


                                        $(".update-sudnumber").attr("data-id", o.account_idpk);
                                        if (o.student_id == "") {
                                            $("#studNumberPlacer").removeAttr("disabled");
                                            $(".update-sudnumber").removeAttr("disabled");
                                        } else {
                                            $(".update-sudnumber").attr("disabled", "disabled");
                                            $("#studNumberPlacer").attr("disabled", "disabled");
                                            $("#studNumberPlacer").val(o.student_id);
                                        }
                                        $("#accountInfoPlaceholder tbody").append(

                                                "<tr>" +

                                                    "<td> " + o.account_idpk + " </td>" +
                                                    "<td> " + o.student_id + " </td>" +
                                                    "<td> " + o.address + " </td>" +
                                                    "<td> " + o.telephone_number + " </td>" +
                                                    "<td> " + o.email_address + " </td>" +
                                                    "<td> " + o.formatedB + " </td>" +
                                                    "<td> " + o.citizenship + " </td>" +
                                                    "<td> " + o.religion + " </td>" +
                                                    "<td> " + o.marital_status + " </td>" +
                                                    "<td> " + o.gender + " </td>" +
                                                "</tr>"


                                            );
                                    });
                                }
                            });
                        });
                    


                }

            });
        } if (input == "") {
            $(".searchableTable tbody").loadDef();
            $(".resultContainer").removeClass("animateOnDisplay");
            $(".resultContainer").html("");
           

        }


    }


    //Load Default
    $.fn.loadDef = function (event) {

         sortBy = $("#sortBy option:selected").val();
        var legend;
        if (sortBy == "alumni") {
            legend = "success";
            $("#filterCollege").val($("#filterCollege option:first").val());
        } else if (sortBy == "graduating") {
            legend = "warning"
            $("#filterCollege").val($("#filterCollege option:first").val());
        }
        $("#searchableTable tbody").html("");
        console.log(sortBy);
        $.ajax({
            type: "post",
            url: "alumni-list-ui.aspx/pullAll",
            data: "{'sortBy':'" + sortBy + "'}",
            dataType: "json",
            processData: false,
            traditional: true,
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                data = response.d;
                data = jQuery.parseJSON(data);
                var p = data.length - 2;
                $.each(data, function (i, o) {
                 
                    if (o.userlevel_idfk == 1) {
                        var mod = ("<tr class='success'>" +
                                        "<td> " + o.account_idpk + " </td>" +
                                        "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                        "<td> " + o.collegeDes + " </td>" +
                                        "<td>" + o.courseDes + "</td>" +

                                        "<td></td>" +
                                        "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg' > View info </a> </td>" +
                                    "</tr>");

                    } else {
                        var mod = ("<tr class='warning'>" +
                                    "<td> " + o.account_idpk + " </td>" +
                                    "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                    "<td> " + o.collegeDes + " </td>" +
                                    "<td>" + o.courseDes + "</td>" +

                                    "<td></td>" +
                                    "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg' > View info </a> </td>" +
                                "</tr>");
                    }
                   
                    $(".searchableTable tbody").append(
                            mod
                        );
                });
                $(".viewAccountInfo").click(function () {

                    accId = $(this).data("account-id");
                    $("#accountInfoPlaceholder tbody ").html("");
                    $.ajax({
                        type: "post",
                        url: "alumni-list-ui.aspx/fetchAccountInfo",
                        data: "{'accId':'" + accId + "'}",
                        dataType: "json",
                        processData: false,
                        traditional: true,
                        contentType: "application/json; charset=utf-8",
                        success: function (approvalResponse) {
                            response = approvalResponse.d;
                            response = jQuery.parseJSON(response);
                            $.each(response, function (i, o) {
                                console.log(o.student_id);

                                $("#myModalLabel").text(o.given_name + "  " + o.middle_name + " " + o.family_name);

                                $(".update-sudnumber").attr("data-id", o.account_idpk);
                                if (o.student_id == "") {
                                    $("#studNumberPlacer").removeAttr("disabled");
                                    $(".update-sudnumber").removeAttr("disabled");
                                } else {
                                    $(".update-sudnumber").attr("disabled", "disabled");
                                    $("#studNumberPlacer").attr("disabled", "disabled");
                                    $("#studNumberPlacer").val(o.student_id);
                                }
                                $("#accountInfoPlaceholder tbody").append(

                                        "<tr>" +

                                            "<td> " + o.account_idpk + " </td>" +
                                            "<td> " + o.student_id + " </td>" +
                                            "<td> " + o.address + " </td>" +
                                            "<td> " + o.telephone_number + " </td>" +
                                            "<td> " + o.email_address + " </td>" +
                                            "<td> " + o.formatedB + " </td>" +
                                            "<td> " + o.citizenship + " </td>" +
                                            "<td> " + o.religion + " </td>" +
                                            "<td> " + o.marital_status + " </td>" +
                                            "<td> " + o.gender + " </td>" +
                                        "</tr>"


                                    );
                            });
                        }
                    });
                });
                console.log(response.d);
            }
        });
    }




    //Filter by college
    $("#filterCollege").change(function () {
        var sortColleges = $("#filterCollege option:selected").attr("data-id");
        sortBy = $("#sortBy option:selected").val();
        
        $(".searchableTable tbody").html("");
        

        $.ajax({
            type: "post",
            url: "alumni-list-ui.aspx/filterView",
            data: "{'sortBy':'" + sortBy + "','college_id':'" + sortColleges + "'}",
            dataType: "json",
            processData: false,
            traditional: true,
            contentType: "application/json; charset=utf-8",
            success: function (response) {
                if (response.d == "[]") { $(".searchableTable tbody").html("No result."); }
                data = response.d;
                data = jQuery.parseJSON(data);
                $.each(data, function (i, o) {
                    
                    if (o.userlevel_idfk == 1) {
                        var mod = ("<tr class='success'>" +
                                        "<td> " + o.account_idpk + " </td>" +
                                        "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                        "<td> " + o.collegeDes + " </td>" +
                                        "<td>" + o.courseDes + "</td>" +

                                        "<td>" + o.year_graduated + "</td>" +
                                        "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg' > View info </a> </td>" +
                                    "</tr>");

                    } else {
                        var mod = ("<tr class='warning'>" +
                                    "<td> " + o.account_idpk + " </td>" +
                                    "<td> " + o.given_name + "  " + o.middle_name + " " + o.family_name + " </td>" +
                                    "<td> " + o.collegeDes + " </td>" +
                                    "<td>" + o.courseDes + "</td>" +

                                    "<td>" + o.year_graduated + "</td>" +
                                    "<td> <a class='btn btn-primary btn-sm viewAccountInfo' data-account-id='" + o.account_idpk + "' data-toggle='modal' data-target='.bs-example-modal-lg' > View info </a> </td>" +
                                "</tr>");
                    }
                       
                    $(".searchableTable tbody").append(
                                    mod
                                );

                });

                //Theatre
                $(".viewAccountInfo").click(function () {
                   
                    accId = $(this).data("account-id");
                    $("#accountInfoPlaceholder tbody ").html("");
                    $.ajax({
                        type: "post",
                        url: "alumni-list-ui.aspx/fetchAccountInfo",
                        data: "{'accId':'" + accId + "'}",
                        dataType: "json",
                        processData: false,
                        traditional: true,
                        contentType: "application/json; charset=utf-8",
                        success: function (approvalResponse) {
                            response = approvalResponse.d;
                            response = jQuery.parseJSON(response);
                            $.each(response, function (i, o) {
                                console.log(o.student_id);


                                $("#myModalLabel").text(o.given_name + "  " + o.middle_name + " " + o.family_name);


                                $(".update-sudnumber").attr("data-id", o.account_idpk);
                                if (o.student_id == "") {
                                    $("#studNumberPlacer").removeAttr("disabled");
                                    $(".update-sudnumber").removeAttr("disabled");
                                } else {
                                    $(".update-sudnumber").attr("disabled", "disabled");
                                    $("#studNumberPlacer").attr("disabled", "disabled");
                                    $("#studNumberPlacer").val(o.student_id);
                                }
                                $("#accountInfoPlaceholder tbody").append(

                                        "<tr>" +

                                            "<td> " + o.account_idpk + " </td>" +
                                            "<td> " + o.student_id + " </td>" +
                                            "<td> " + o.address + " </td>" +
                                            "<td> " + o.telephone_number + " </td>" +
                                            "<td> " + o.email_address + " </td>" +
                                            "<td> " + o.formatedB + " </td>" +
                                            "<td> " + o.citizenship + " </td>" +
                                            "<td> " + o.religion + " </td>" +
                                            "<td> " + o.marital_status + " </td>" +
                                            "<td> " + o.gender + " </td>" +
                                            "<td> " + o.year_graduated + " </td>" +
                                        "</tr>"


                                    );
                            });
                        }, error: function (response) {
                            console.log("Opps something went wrong.");
                        }
                    });

                });
            }
        });
    });


});