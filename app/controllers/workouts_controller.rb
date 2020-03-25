class WorkoutsController < ApplicationController

  def index
    training_menu = TrainingMenu.find(params[:training_menu_id])
    @workouts = training_menu.workouts
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.save
      redirect_to workouts_path
    else
      render :new
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :quality, :description).merge(id: training_menu_id)
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end

end
