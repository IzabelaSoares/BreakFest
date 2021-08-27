$(document).ready(function(){
  $('#dropDown').click(function(event){
    $('.drop-down').toggleClass('drop-down--active');
    event.stopPropagation();
  });

  $(document).click(function(event) {
    	if (!$(event.target).hasClass('drop-down--active')) {
      		$(".drop-down").removeClass("drop-down--active");
    	}
  	});





});
