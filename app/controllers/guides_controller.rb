class GuidesController < ApplicationController

  def new
    @guide = Guide.new
  end

  def create
    @guide = Guide.new(guide_params)
    if @guide.valid?
      @guide.save
      redirect_to game_guide_path(@guide)
    else
      render :new
    end
  end



    private

    def guide_params
      params.require(:guide).permit(:title, :body)
    end

  end
