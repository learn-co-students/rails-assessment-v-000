function Guide(attributes){
  this.title = attributes.title
  this.id = attributes.id
  this.game_id = attributes.game_id
  this.user_id = attributes.user_id
}

Guide.success = function(json){
  var $ol = $("div.show_guides ol")
  $ol.html("")
  for(const newGuide of json.guides){
    var guide = new Guide(newGuide)
    var guideLI = HandlebarsTemplates['guides/show']({guides: guide})
    $ol.append(guideLI)
  }
}

Guide.showGuides = function(e){
  e.preventDefault()
  //$.get(this.href).done(Guide.success)
  fetch(this.href).
    then(response => response.json()).
    then(json => Guide.success(json))
}

Guide.newGuide = function(e){
  e.preventDefault()
  debugger
}
Guide.showEventTrigger = function(){
  $(".show_guides").on("click", "a.show_guides_link", Guide.showGuides)
}

Guide.newEventTrigger = function(){
  $(".new_guide").on("submit", Guide.newGuide)
}

$(function(){
  Guide.showEventTrigger()
  Guide.newEventTrigger()
})
