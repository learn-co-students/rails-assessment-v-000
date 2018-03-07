class WorkoutsController < ApplicationController

  def index
    @workouts=Workout.all
  end

  def new
    @workout=Workout.new
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    #@workout=Workout.create(workout_params)
    #@workout.user_id=current_user.id
    @workout.photo=@workout.assign_photo(@workout.training_type)
    if @workout.save
      redirect_to @workout
    else
      render 'new'
    end
  end

  def show
    @workout=Workout.find(params[:id])
  end

  def edit
    @workout=Workout.find(params[:id])
  end

  def update
    @workout=Workout.find(params[:id])
    if @workout.update(workout_params)
      redirect_to @workout
    else
      render 'edit'
    end
  end

  def destroy
    @workout=Workout.find(params[:id]).destroy
    redirect_to workouts_path
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :duration, :difficulty, :body_focus, :training_type, :equipment_needed, :website, :notes)
  end


end
