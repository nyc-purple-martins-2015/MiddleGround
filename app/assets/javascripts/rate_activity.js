$(document).ready(function(){
  $(".rating-button").on('click', function(event){
    $(this).parents(".ratings").children(".rate-form").slideToggle();
  })
});

