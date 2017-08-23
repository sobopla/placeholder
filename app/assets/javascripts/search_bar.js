
$(document).ready(function(){
  
// HIDING LOGO AND SEARCH BAR ON SUBMIT TO SHOW THE BOPPIN BEFORE RESULTS LOAD
  $("form.search-bar").on("submit", function(){
    $("div.logo-to-hide img").hide();
    $("form").hide();
    $("div.band-results").hide();
    $("button#load-more-button").hide();
    $(".loading").toggleClass("hidden")

  })

// LOAD ONE MONTH MORE BUTTON FUNCTIONALITY
  $("#load-more-button").on("click", function(event){
    event.preventDefault();
    var button = $(this);
    var page = button.data("page");
    var user_input = button.data("user-search");

    var data = {
      user_input: user_input,
      page: page
    }
    $.post("/homes/search", data, function(response){
      for (var i = 0; i < response.partials.length; i++) {
        $("div .results").append(response.partials[i])
      }
      var more = parseInt($("button#load-more-button").attr("data-page"));
      $("button#load-more-button").attr("data-page", more + 1);
    })
  })

})
