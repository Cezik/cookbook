$( document ).on('turbolinks:load', function() {
  $('.edit_recipe, .new_recipe').change(function(){
    $val = $(this).children("#recipe_difficult").val();
    $label = $(".recipe_difficult_text");
    $label.text('Poziom trudności: ' + $val);
  })
})
