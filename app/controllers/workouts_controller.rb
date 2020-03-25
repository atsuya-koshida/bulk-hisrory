class WorkoutsController < ApplicationController

  def create
    @training_menu = TrainingMenu.find(params[:id])
    @workout = @training_menu.workouts.new(workout_params)
    if @workout.save
      redirect_to training_menu_path
    else
      render workout_new_training_menu_path(params[:id])
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :quality_id, :description)
  end
end