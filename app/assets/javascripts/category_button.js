$(document).ready(function() {
    $("button.btn").click(function(event){
        if (window.location.href != "127.0.0.1:3000/"){
          window.location.href='127.0.0.1:3000/';

        };
        $.ajax({
                type: "POST",
                url: "/cat/"+this.id,
                dataType: "html"
            }).done(function(data){
                    $('section#body div.inner').fadeOut(800, function(){
                     $('section#body div.inner').html(data);
                    });
                    $('section#body div.inner').fadeIn(2000);
                })
            event.preventDefault();
    });
});
