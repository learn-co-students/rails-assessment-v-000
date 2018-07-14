$(function(){
  $("a.show_guides_link").on("click", function(e){
    $.get(this.href).done(function(json){
      var $ol = $("div.show_guides ol")
      $ol.html("")
      for(const element of json.guides) {
        $ol.append("<li>" + "Name: " + element.title.link("/games/" + element.game_id + "/guides/" + element.id) + "</br>" + "</li>")
      }
    });
    e.preventDefault();
  })
})
