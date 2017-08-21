

$(document).ready(function(){
  $(".loading").hide();

  $("form.search-bar").on("submit", function(event){
    event.preventDefault();
    $(".loading").show();

    var $form = $(this);
    var data = $form.serialize()

    $form.hide();

    $.post("homes/search", data, function(response){
      for (var i = 0; i < response.partials.length; i++) {
      	$("div .results").append(response.partials[i])
      }
      $(".loading").hide();
      $form.show();
    })


  })







})
