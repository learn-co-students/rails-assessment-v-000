class GuidesController < ApplicationController

  def index
    @guides = Guide.all
  end

  def show
    @game = which_game?
    @guide = Guide.find(params[:id])
  end

  def new
    @game = which_game?
    @guide = Guide.new
  end

  def create
    @game = which_game?
    @guide = Guide.new(guide_params)
    if @guide.valid?
      @guide.save
      redirect_to game_guide_path(@game, @guide)
    else
      render 'guides/new'
    end
  end

  def edit
    @game = which_game?
    @guide = Guide.find(params[:id])
  end

  def update
    @game = which_game?
    @guide = Guide.find(params[:id])
    @guide.update(guide_params)
    if @guide.valid?
      @guide.save
      redirect_to game_guide_path(@game, @guide)
    else
      render 'guides/new'
    end
  end



   def destroy
     @guide = Guide.find(params[:id])
     @game = which_game?
     @guide.destroy
     redirect_to game_path(@game)
   end





    private

    def guide_params
      params.require(:guide).permit(:title, :body, :game_id, :user_id)
    end

  end
