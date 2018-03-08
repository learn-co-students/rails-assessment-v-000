class WorkoutsController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to workouts_path, alert: "User not found"
      else
        @workouts = @user.workouts
      end
    else
      @workouts=Workout.all
    end
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @workout = @user.workouts.find_by(id: params[:id])
      if @workout.nil?
        redirect_to user_workouts_path(@user), alert: "Workout not found"
      end
    else
      @workout=Workout.find_by(id: params[:id])
      if @workout.nil?
        redirect_to workouts_path, alert: "Workout not found"
      end
    end
  end

  def new
    @workout=Workout.new
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    #@workout=Workout.create(workout_params)  <<this wouldn't create the user_id unless I added code below.
    #@workout.user_id=current_user.id
    @workout.photo=@workout.assign_photo(@workout.training_type_name)
    if @workout.save
      redirect_to @workout
    else
      render 'new'
    end
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
    params.require(:workout).permit(:name, :duration, :difficulty, :category_id, :training_type_name, :website, equipment_ids:[], equipments_attributes: [:name])
  end


end
