class WorkoutsController < ApplicationController
  before_action :authenticate_user!

  def index
    # provide a list of training_types/cats to the view for the filter control
    @training_types=TrainingType.all
    @categories=Category.all

    # filter the @workouts list based on user input
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        redirect_to workouts_path, alert: "User not found"
      else
        @workouts = @user.workouts
      end

    elsif !params[:category].blank? && !params[:training_type].blank? && !params[:difficulty].blank?
      category =Workout.by_category(params[:category])
      training =category.by_training_type(params[:training_type])
      @workouts =training.by_difficulty(params[:difficulty])

    elsif !params[:category].blank? && !params[:training_type].blank?
      category =Workout.by_category(params[:category])
      @workouts =category.by_training_type(params[:training_type])

    elsif !params[:category].blank? && !params[:difficulty].blank?
      category =Workout.by_category(params[:category])
      @workouts =category.by_difficulty(params[:difficulty])

    elsif !params[:training_type].blank? && !params[:difficulty].blank?
      training =Workout.by_training_type(params[:training_type])
      @workouts =training.by_difficulty(params[:difficulty])

    elsif !params[:category].blank?
      @workouts =Workout.by_category(params[:category])

    elsif !params[:training_type].blank?
      @workouts =Workout.by_training_type(params[:training_type])

    elsif !params[:difficulty].blank?
      @workouts =Workout.by_difficulty(params[:difficulty])

    elsif !params[:min].blank?
      @workouts =Workout.by_min(params[:min])

    elsif !params[:max].blank?
      @workouts =Workout.by_max(params[:max])

    else
      # if no filters are applied, show all workouts
      @workouts=Workout.all
    end
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @workout = @user.workouts.find_by_id(params[:id])

      if @workout.nil?
        redirect_to user_workouts_path(@user), alert: "Workout not found"
      end

      Workout.add_view(@workout)
    else
      @workout=Workout.find_by(id: params[:id])

      if @workout.nil?
        redirect_to workouts_path, alert: "Workout not found"
      end

      Workout.add_view(@workout)
    end
  end

  def new
    if params[:user_id] && !User.exists?( params[:user_id])
      redirect_to users_path, alert: "User Not Found"
    else
      @workout=Workout.new(user_id: params[:user_id])
    end
  end

  def create
    @workout = current_user.workouts.new(workout_params)
    @workout.photo=@workout.assign_photo(@workout.training_type_name)
    if @workout.save
      redirect_to @workout
    else
      render 'new'
    end
  end

  def edit
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        redirect_to workouts_path, alert: "User Not Found"
      else
        @workout = user.workouts.find_by_id(params[:id])
        redirect_to user_workouts_path(user), alert: "Workout Not Found" if @workout.nil?
      end
    else
      @workout=Workout.find(params[:id])
    end
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
    flash[:notice]= "Workout Deleted"
    redirect_to workouts_path
  end

  private

  def workout_params
    params.require(:workout).permit(:user_id, :name, :duration, :difficulty, :category_id, :training_type_name, :website, equipment_ids:[], equipments_attributes: [:name])
  end

end
