class TrainingMenusController < ApplicationController
  before_action :set_training_menu, only: [:edit, :update, :destroy]
  def index
    @q = current_user.training_menus.ransack(params[:q])
    @training_menus = @q.result(distinct: true).page(params[:page]).per(8)
  end

  def new
    @training_menu = TrainingMenu.new
  end

  
  def create
    @training_menu = TrainingMenu.new(training_menu_params)
    if @training_menu.save
      redirect_to training_menus_path, notice: "種目「#{@training_menu.title}」を登録しました。"
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @training_menu.update(training_menu_params)
      redirect_to training_menus_path, notice: "種目を更新しました。"
    else
      render :edit
    end
  end
  
  def destroy
    @training_menu.destroy
    head :no_content
  end

  def show
    @training_menu = TrainingMenu.find(params[:id])
    @workouts = @training_menu.workouts.page(params[:page]).per(8)
  end

  def workout_new
    @workout = Workout.new
  end

  def workout_edit
    @workout = Workout.find(params[:id])
  end

  private
  def training_menu_params
    params.require(:training_menu).permit(:title, :part_id).merge(user_id: current_user.id)
  end

  def set_training_menu
    @training_menu = current_user.training_menus.find(params[:id])
  end
end