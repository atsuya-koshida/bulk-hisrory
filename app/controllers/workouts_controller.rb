class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:destroy, :update]
  def create
    @training_menu = TrainingMenu.find(params[:id])
    @workout = @training_menu.workouts.new(workout_params)
    if @workout.save
      redirect_to training_menu_path
    else
      render workout_new_training_menu_path(params[:id])
    end
  end

  def update
    @workout.update(workout_params)
    redirect_to training_menu_path(@workout.training_menu_id)
  end

  def destroy
    @workout.destroy
    head :no_content
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :quality_id, :description)
  end

  def set_training_menu
    @training_menu = TrainingMenu.find(params[:id])
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end
end