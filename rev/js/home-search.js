$(document).ready(function () {


    $("#searching").on("keyup", function (event) {
        $(this).alumniSearch(event);
    });



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
                        $.each(data, function (i,o) {
                            $(".resWrapper").html("");
                            $(".resWrapper").append(
                                "<div class='clickable'>" +
                                    "<span> <b> "+ o.u +" </b> </span>" +
                                "</div>"+
                                "<div class='display'>" +
                                    "<span> " + displayMessage + " </span>" +
                                "</div>");
                        })
                       
                       
                      
                    }


                    if (data.length == 0) {
                        $(".resWrapper").html("");
                        $(".resWrapper").append(
                            "<div class='clickable'>" +
                                "<span> <b> No results found </b> </span>"+
                            "</div>");
                    }
                }
            });





            if (input == "") {
                $(".resWrapper").html("");
                $(".resWrapper").removeClass("revealWrap");
            }
        } 
    }
});