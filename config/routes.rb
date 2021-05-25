Rails.application.routes.draw do

  devise_for :users

  root to: 'books#index'

  resources :books
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  resources :transactions, only: [:create]
  get 'checkout/success', to: 'transactions#success'

end
