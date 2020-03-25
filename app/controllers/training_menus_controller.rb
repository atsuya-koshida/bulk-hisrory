class TrainingMenusController < ApplicationController
  before_action :set_training_menu, only: [:edit, :update, :destroy]
  def index
    @training_menus = TrainingMenu.all
  end

  def new
    @training_menu = TrainingMenu.new
  end

  
  def create
    @training_menu = TrainingMenu.new(training_menu_params)
    if @training_menu.save
      redirect_to training_menus_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @training_menu.update(training_menu_params)
    redirect_to training_menus_path, notice: "種目「#{@training_menu.title}」を更新しました。"
  end
  
  def destroy
    @training_menu.destroy
    head :no_content
  end

  def show
    @training_menu = TrainingMenu.find(params[:id])
    @workouts = @training_menu.workouts
  end

  def workout_new
    @training_menu = TrainingMenu.new
    @workout = Workout.new
  end

  private
  def training_menu_params
    params.require(:training_menu).permit(:title, :part_id).merge(user_id: current_user.id)
  end

  def set_training_menu
    @training_menu = current_user.training_menus.find(params[:id])
  end
end