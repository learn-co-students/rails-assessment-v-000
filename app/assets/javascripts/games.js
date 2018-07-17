function Game(attributes){
  this.title = attributes.title
  this.id = attributes.id
  this.game_system = attributes.game_system
}

Game.success = function(json){
  var $div = $("div.show_games")
  var $ol = $("div.show_guides ol")
  $div.html("")
  $ol.html("")
  var game = new Game(json)
  var gameGuidesLinkOL = HandlebarsTemplates['games/show_guides_link']({games: game})
  var gameLI = HandlebarsTemplates['games/index']({games: game})
  $div.append(gameLI)
  $ol.append(gameGuidesLinkOL)
}

Game.showGames = function(e){
  e.preventDefault()
  //$.get(this.href).done(Game.success)
  fetch(this.href).
    then(response => response.json()).
    then(json => Game.success(json))
}

Game.eventTrigger = function(){
  $(".show_games").on("click", "a.show_games_link", Game.showGames)
}

Game.prototype.plusOne = function(){
  return (this.id + 1)
}

$(function(){
  Game.eventTrigger()
})
