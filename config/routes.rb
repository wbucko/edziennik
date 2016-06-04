Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :tests
  resources :grades
  devise_for :users
  resources :users do
    resource :profile
  end

    
  resources :contacts
  get '/about' => 'pages#about'
  root 'pages#home'
  

end
