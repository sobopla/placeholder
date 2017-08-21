

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
    	console.log(response)
    	$("div.results").append(response)
    	console.log("done")
    	$(".loading").hide();
    	$form.show();
    })


  })







})
