//$(function(){
//  $("a.user_guides").on("click", function(e){
//    $.get(this.href).done(function(json){
//      var $ol = $("div.users_guides ol")
//      $ol.html("")
//      for(const element of json.guides) {
//        $ol.append("<li>" + "Name: " + `<a href='/games/${element.game_id}/guides/${element.id}>` + element.title + "</a>" + "</br>" + "Body: " + element.body + "</li>")
//      }
//    });
//    e.preventDefault();
//  })
//})
