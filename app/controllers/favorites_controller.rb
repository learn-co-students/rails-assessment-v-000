class FavoritesController < ApplicationController

  def new
    @favorite=Favorite.create(
      :user_id => params[:user_id],
      :workout_id => params[:workout_id]
    )

    if @favorite.save
      flash[:notice] = "Workout Added to Favorites!"
    end

    redirect_to workout_path(@favorite.workout)
  end

end
