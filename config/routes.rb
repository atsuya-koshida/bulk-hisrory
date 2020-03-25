Rails.application.routes.draw do
  devise_for :users
  root "users#home"
  resources :training_menus do
    member do
      get 'workout_new', to: 'training_menus#workout_new'
      resources :workouts, only: [:create]
    end
  end
end
