class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:destroy, :update]

  def create
    @training_menu = TrainingMenu.find(params[:id])
    @workout = @training_menu.workouts.new(workout_params)
    if @workout.save
      redirect_to training_menu_path,  notice: '記録を登録しました'
    else
      render template: "training_menus/workout_new"
    end
  end

  def update
    if @workout.update(workout_params_update)
      redirect_to training_menu_path(@workout.training_menu_id), notice: '記録を更新しました'
    else
      render template: "training_menus/workout_edit"
    end
  end

  def destroy
    @workout.destroy
    head :no_content
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :quality_id, :description, workout_details_attributes: [:id, :weight, :reps, :_destroy])
  end

  def workout_params_update
    params.require(:workout).permit(:date, :quality_id, :description, workout_details_attributes: [:id, :weight, :reps, :_destroy])
  end

  def set_training_menu
    @training_menu = TrainingMenu.find(params[:id])
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end
end