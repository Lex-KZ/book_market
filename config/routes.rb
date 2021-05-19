Rails.application.routes.draw do

  root to: 'books#home'
  get 'books', to: 'books#index', as: 'books'
  post 'books', to: 'books#create'
  get 'books/new', to: 'books#new', as: 'new_book'
  get 'books/:id/edit', to: 'books#edit', as: 'edit_book'
  get 'books/:id', to: 'books#show', as: 'book'
  patch 'books/:id', to: 'books#update'
  put 'books/:id', to: 'books#update'
  delete 'books/:id', to: 'books#destroy'
  
  devise_for :users
  get 'users/index'
  get '/restricted', to: 'books#restricted', as: 'restricted'
  get '/users', to: 'users#index', as: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
end
