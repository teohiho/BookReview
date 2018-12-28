Rails.application.routes.draw do
  
  get    "login"  => "sessions#new"
  post   "login"  => "sessions#create"
  delete "logout" => "sessions#destroy"
  get 'home/index'
  get 'books/thongbao'
  get  "resigter" => "users#new"
  get  "addbook" => "books#new"
  get '/button', to: 'favorites#button', as: 'button'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


root 'books#index'
  
  resources :books do

  resources :reviews
  resources :comments
  resources :bookfavorites
  end


  resources :users do
  resources :bookfavorites 
  end 
  resources :requires

end
