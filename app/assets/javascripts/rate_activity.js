$(document).ready(function(){
  $(".rating-button").on('click', function(event){
    $(this).parent().children(".rate-form").slideToggle();
  })
});

