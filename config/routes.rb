Rails.application.routes.draw do
  devise_for :users
  root "users#home"
  resources :training_menus do
    member do
      get 'workout_new', to: 'training_menus#workout_new'
      get 'workout_edit', to: 'training_menus#workout_edit'
      resources :workouts, only: [:create, :update, :destroy]
    end
  end
end
