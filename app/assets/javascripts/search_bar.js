$(document).ready(function(){

// HIDING LOGO AND SEARCH BAR ON SUBMIT TO SHOW THE BOPPIN BEFORE RESULTS LOAD
  $("form.search-bar").on("submit", function(){
    $("div.logo-to-hide img").hide();
    $("form").hide();
    $("#homepage-desc").hide();
    $("div.band-results").hide();
    $("div#data-for-load-more").hide();
    $("button#load-more-button").hide();
    $(".devise-container").hide();
    $(".error-no-match").hide();
    $(".user-show").hide();
    $(".profile-page").hide();
    $(".loading").toggleClass("hidden");
  })

// LOAD ONE MONTH MORE BUTTON FUNCTIONALITY
  $("#load-more-button").on("click", function(event){
    event.preventDefault();
    var page = $("div#data-for-load-more").attr("data-page");
    var user_input = $("div#data-for-load-more").data("user-search");
    $(".error-no-match").hide();
    $(".loading").toggleClass("hidden")

    var data = {
      user_input: user_input,
      page: page
    }

    $.post("/homes/search", data, function(response){
      for (var i = 0; i < response.partials.length; i++) {
        $("div .results").append(response.partials[i])
      }

      var more = parseInt($("div#data-for-load-more").attr("data-page"));
      $("div#data-for-load-more").attr("data-page", more + 1);
      $(".loading").toggleClass("hidden");
    })
  })

})
