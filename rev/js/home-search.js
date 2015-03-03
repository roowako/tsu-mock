$(document).ready(function () {


    $("#searching").bindWithDelay("keyup", function (event) {
        $(this).alumniSearch(event);
    }, 500);



    $.fn.alumniSearch = function(event){

        var ESC = 27;
        var SPACE = 32;
        var BACKSPAE = 8;
        event.preventDefault();
        var key = event.which || event.keyCode;
        var input = $(this).val().trim();
        var q = input.match(/^[a-zA-Z\s]+$/);

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
                url: "home.aspx/search",
                data: "{'q':'" + q + "'}",
                dataType: "json",
                processData: false,
                traditional: true,
                contentType: "application/json; charset=utf-8",
                success: function (response) {

                    data = response.d
                    data = jQuery.parseJSON(data)
                    var toShow = data.length;
                    var displayMessage;
                    if (toShow == 1) {
                        displayMessage = "Displaying "+ toShow +" result. "
                    } else {
                        displayMessage = "Displaying " + toShow + " results. "
                    }
                    console.log(data.length);
                    if (data.length > 0) {
                       
                        $(".resWrapper").html("");
                        $(".display").css("visibility", "visible");

                        $(".toFix").addClass("forceFix");
                        $(".toFix").removeClass("toFix");
                        $.each(data, function (i,o) {
                            if( o.u == null ){
                                $(".resWrapper").append(
                                "<a class='uid' href='./viewprofile.aspx?id=" + o.uid + "' >" +
                                "<div class='clickable'>" +
                                    "<span> <b> " + o.u1 + " </b> </span>" +
                                "</div>" +
                                "</a>");
                            } else{
                                $(".resWrapper").append(
                                "<a class='uid' href='./viewprofile.aspx?id=" + o.uid + "' >" +
                                "<div class='clickable'>" +
                                    "<span> <b> " + o.u + " </b> </span>" +
                                "</div>" +
                                "</a>");
                            }
                            
                        })
                        
                        $(".display").html("<span> <b> "+ displayMessage +" </b> </span>")
                       
                        
                    }


                    if (data.length == 0) {
                        $(".resWrapper").html("");
                        
                        $(".resWrapper").append(
                            "<div class='clickable'>" +
                                "<span> <b> No results found </b> </span>"+
                            "</div>");
                        $(".display").html("");
                        $(".display").css("visibility", "hidden");
                    }
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