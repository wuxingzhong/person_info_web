
// Au scroll de la page
$(window).scroll(function() {

   var height_of_scroll = $(window).scrollTop();
   var height_window = $(window).height();
   if(height_of_scroll  > height_window) {
       $('.back-to-top').fadeIn();
   }
   if(height_of_scroll  < height_window) {
       $('.back-to-top').fadeOut();
   }
});

// Au redimensionnement de la page
$(window).resize(function() {
	
});

// Au chargement de la page
$(document).ready(function(){

	$('.back-to-top').click(function(){
       $('html, body').animate({ scrollTop: 0 }, 'slow');
       return false;
	});

	$.stellar({
        horizontalScrolling: false,
        verticalOffset: -200
    });

//effet parallax
if (navigator.userAgent.search("Safari") >= 0 && navigator.userAgent.search("Chrome") < 0) 
{
  // si safari alors pas de parallax !!!         
}
else {

  $('.bgParallax').each(function() { 
    var $obj = $(this); 

    $(window).scroll(function() { 
        var divTop = $('.bgParallax').offset().top;
        var yPos = 50 -( ( $(window).scrollTop() - divTop) / $obj.data('speed')); 
        console.log(yPos);
        var bgpos = 'center '+ yPos + '%'; 
        $obj.css('background-position', bgpos ); 
    }); 
  });
}
});



