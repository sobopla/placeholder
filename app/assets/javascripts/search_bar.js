

$(document).ready(function(){
  $(".loading").hide();

  $("form.search-bar").on("submit", function(event){
    event.preventDefault();
    $(".loading").show();
    console.log("maaa")
    var $form = $(this);
    var data = $form.serialize()

    $form.hide();
    
    $.post("homes/search", data, function(response){
    	console.log(response.partials)
      console.log(response)
      console.log("done")

      for (var i = 0; i < response.partials.length; i++) {
        console.log("i loopie!")
      	$("div .results").append(response.partials[i])
      }
      $(".loading").hide();
      $form.show();
    })


  })







})
