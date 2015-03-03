$(document).ready(function () {


    $("#searching").bindWithDelay("keyup", function (event) {
        $(this).alumniSearch(event);
    }, 500);



    $.fn.alumniSearch = function (event) {

        var ESC = 27;
        var SPACE = 32;
        var BACKSPAE = 8;
        event.preventDefault();
        var key = event.which || event.keyCode;
        var input = $(this).val().trim();
        var q = input.match(/^[a-zA-Z\s]+$/);
        var account_idfk;
        if (key !== ESC) {

            $(".resWrapper").addClass("revealWrap");
            if (q == null) {
                $(".resWrapper").html("");

                $(".resWrapper").append(
                    "<div class='clickable'>" +
                        "<span> <b> No results found </b> </span>" +
                    "</div>");
                $(".display").html("");
                $(".display").css("visibility", "hidden");
                $("#hidId").val("");
                $(".toFix").removeClass("forceFix");
                $(".toFix").addClass("toFix");
            }
            $.ajax({
                type: "post",
                url: "messaging-ui-alumni.aspx/search",
                data: "{'q':'" + q + "'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (response) {

                    data = response.d
                    data = jQuery.parseJSON(data)
                    if (data == null) {
                        $(".resWrapper").html("");

                        $(".resWrapper").append(
                            
                                "<div class='clickable' >" +
                                    "<span> <b> No results found </b> </span>" +
                                "</div>"
                            );
                        $(".display").html("");
                        $(".display").css("visibility", "hidden");
                    }
                    var toShow = data.length;
                    var displayMessage;
                    if (toShow == 1) {
                        displayMessage = "Displaying " + toShow + " result. "
                    } else {
                        displayMessage = "Displaying " + toShow + " results. "
                    }

                    console.log(data.length);
                    
                    if (data.length > 0) {

                        $(".resWrapper").html("");
                        $(".display").css("visibility", "visible");

                        $(".toFix").addClass("forceFix");
                        $(".toFix").removeClass("toFix");
                        $.each(data, function (i, o) {
                            
                            if( o.u == null){
                                $(".resWrapper").append(
                               "<a href='#' data-name='" + o.u1 + "' data-toggle='modal' data-id='" + o.uid + "' data-target='#myModal' class='uid'>" +
                                "<div class='clickable' >" +
                                    "<span> <b> " + o.u1 + " </b> </span>" +
                                "</div>" +
                                "</a>");
                            }else{
                                $(".resWrapper").append(
                              "<a href='#' data-name='" + o.u + "' data-toggle='modal' data-id='" + o.uid + "' data-target='#myModal' class='uid'>" +
                               "<div class='clickable' >" +
                                   "<span> <b> " + o.u + " </b> </span>" +
                               "</div>" +
                               "</a>");
                            }   
                           
                        })

                        $(".display").html("<span> <b> " + displayMessage + " </b> </span>")


                    }

                    $(".uid").click(function () {
                        sendTo = $(this).data("id");
                        $(".resWrapper").html("");
                        $(".resWrapper").removeClass("revealWrap");
                        $(".display").css("visibility", "hidden");

                        $(".appBtn").html("");
                        $("#messages").html("");
                        $("#myModalLabel").text("");
                        var fn = $(this).data("name");
                        $("#myModalLabel").text($(this).data("name"));
                        $(".modal-body").css("display", "none");
                        name = "";
                        $(".appBtn").append(
                                '<button type="button" class="btn btn-success btn-sm send" id="btnSend" style="float:left;"><span class="glyphicon glyphicon-send"></span>&nbsp;&nbsp;Send</button>' +
                                '<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal" style="float:right;margin-right:140px;">Close conversation</button>')
                        var sess_id = $("#account_idpk").val();
                        account_idfk = $(this).data("id");
                        

                        $.ajax({
                            type: "post",
                            url: "./messaging-ui-alumni.aspx/pullConversation",
                            data: "{'account_id':'" + sess_id + "','account_idfk':'" + account_idfk + "'}",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            async: true,
                            success: function (r) {
                                data = r.d
                                data = jQuery.parseJSON(data)
                                $.each(data, function (i, o) {
                                    var name;

                                    if (sess_id == o.sender_idfk) {
                                        name = "Me";
                                    }
                                    else {
                                        name = fn;
                                    }

                                    $("#messages").append(
                                            "<li class='messaging'><b> " + name + "</b> </li>" +
                                            "<li class='messaging'>" + o.actor_message + " </li>" +
                                            "<li style=font-size:10px;color:#333;> " + "  - " + o.formatedB + " </li>" +
                                            "<br>"
                                    );
                                });

                            }
                        });
                        $("#btnSend").click(function (e) {
                            e.preventDefault();
                            var sess_id = $("#account_idpk").val();
                            var message = $("#replyMessage").val();
                            var sendTo = account_idfk;
                            $.ajax({
                                type: "post",
                                url: "./messaging-ui-alumni.aspx/pushMessages",
                                data: "{'message':'" + message + "','actor_id':'" + sess_id + "','send_to':'" + sendTo + "'}",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                async: true,
                                success: function (r) {
                                    $("#actor-message").val("");
                                    $("#searching").val("");
                                    alert("Message sent.");
                                    window.location.reload(true);
                                }
                            });
                        });
                        console.log(account_idfk);
                    });

                   

                    if (data.length == 0) {
                        $(".resWrapper").html("");

                        $(".resWrapper").append(
                            "<div class='clickable'>" +
                                "<span> <b> No results found </b> </span>" +
                            "</div>");
                        $(".display").html("");
                        $(".display").css("visibility", "hidden");
                    }

                    
                }, error: function () {
                    $(".resWrapper").html("");

                    $(".resWrapper").append(
                        "<div class='clickable'>" +
                            "<span> <b> No results found </b> </span>" +
                        "</div>");
                    $(".display").html("");
                    $(".display").css("visibility", "hidden");
                }
            });





            if (input == "") {
                $(".resWrapper").html("");
                $(".resWrapper").removeClass("revealWrap");
                $(".display").html("");
                $(".display").css("visibility", "hidden");
            }
        }
    }
});