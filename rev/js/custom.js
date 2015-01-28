$(document).ready(function(){
    
    

   

    $(function () {
        $('#trigger').change(function () {
            $('.poll-q').slideToggle(!this.checked);
        }).change(); //ensure visible state matches initially
    });

    $(function () {
        $('#r1a').change(function () {
            $('.ep-stat-yes').slideToggle(this.checked);
            
        }).change(); //ensure visible state matches initially
    });

    $(function () {
        $('#r1b').change(function () {
            $('.ep-stat-no').slideToggle(this.checked);
          
        }).change(); //ensure visible state matches initially
    });

    $(function () {
        $('#self_emp').change(function () {
            $('.hid-q').slideToggle(this.checked);
        }).change(); //ensure visible state matches initially
    });

    $(function () {
        $('#r9a').change(function () {
            $('.hid-q-fu').slideToggle(this.checked);
        }).change(); //ensure visible state matches initially
    });

    $("#answer_poll").click(function (e) {
       
        $(".qa").slideToggle("slow");
    });

    

    
    

    
});