Rails.application.routes.draw do
  resources :people
  resources :movies
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root 'movies#index'
end
