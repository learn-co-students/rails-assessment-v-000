class GamesController < ApplicationController

  def index
    @games = Game.search(params[:search])
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.valid?
      @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end




    private

    def game_params
      params.require(:game).permit(:title, :game_system)
    end

end
