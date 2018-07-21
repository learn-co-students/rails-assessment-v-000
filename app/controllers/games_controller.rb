class GamesController < ApplicationController

  def index
  end

  def most_popular
    @most_popular_game = Game.most_popular_game
  end

  def show
    @game = Game.find(params[:id])
    @guide = Guide.new
    respond_to do |format|
      format.json {render json: @game}
      format.html
    end
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
