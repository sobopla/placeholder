var artists = ["Muse", "Hot Hot Heat", "Forever the Sickest Kids", "Natalie Portman's Shaved Head", "asdfasdf"]


$(document).ready(function(){


  $("form.search-bar").on("submit", function(event){
    event.preventDefault();
    var $form = $(this);
    var data = $form.serialize()

    $.get("/homes/wiki", data , function(response){
      console.log(response)
      console.log("done")
    })
  })

  for (var i = 0; i < artists.length; i++) {
    // format the url
    var artist_link = artists[i].replace(/\s/g, "_")
    $.get("https://en.wikipedia.org/wiki/" + artist_link, function(data){
      console.log("here")
    })

  }






})
