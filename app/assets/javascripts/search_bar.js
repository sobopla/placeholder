
$(document).ready(function(){
  $(".loading").hide();
  $(".load_more").hide();

  $("form.search-bar").on("submit", function(event){
    event.preventDefault();
    $(".loading").show();

    var $form = $(this);
    var page = $(".load_more").attr("data-page");
    $form.hide();

    var data = {
      user_input: $("input.flexsearch--input").val(),
      page: page
    }

    $.post("homes/search", data, function(response){
      for (var i = 0; i < response.partials.length; i++) {
      	$("div .results").append(response.partials[i])
      }
      $(".loading").hide();
      $form.show();
      $(".load_more").show();

      var more = parseInt($("button.load_more").attr("data-page"));
      $("button.load_more").attr("data-page", more + 1);
    })

    $(".load_more").on("click", function(event){
      event.preventDefault();
      console.log("you clicked me");
      var button = $(this);
      var page = button.data("page");

      var data = {
        user_input: $("input.flexsearch--input").val(),
        page: page
      }

      $.post("homes/search", data, function(response){
        console.log(response)
        for (var i = 0; i < response.partials.length; i++) {
          $("div .results").append(response.partials[i])
        }
        var more = parseInt($("button.load_more").attr("data-page"));
        $("button.load_more").attr("data-page", more + 1);
      })
    })

  })







})
