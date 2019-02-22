Rails.application.routes.draw do
  root to: 'home#index'

  resources :movies
  resources :tv_shows
end
