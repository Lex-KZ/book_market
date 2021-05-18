Rails.application.routes.draw do

  root to: "books#home"


  devise_for :users
  # get 'users/index'
  # get '/restricted', to: 'contacts#restricted', as: 'restricted'
  # get '/users', to: 'users#index', as: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
end
