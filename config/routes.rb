Rails.application.routes.draw do
  devise_for :users
  root "users#home"
  resources :training_menus do
    resources :workouts
  end
end
