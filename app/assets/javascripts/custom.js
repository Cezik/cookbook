$( document ).on('turbolinks:load', function() {
  $('.edit_recipe, .new_recipe').change(function(){
    $val = $(this).children("#recipe_difficult").val();
    $label = $(".recipe_difficult_text");
    $text = 'Trudność: ';

    for(i=0; i < $val; i++)
      $text += '<span class="glyphicon glyphicon-star"></span>';

    for(j=0; j < (5 - $val); j++)
      $text += '<span class="glyphicon glyphicon-star-empty"></span>';

    $label.html($text);
  });

  $('.flash-msg').delay(3000).fadeOut('slow');
})
