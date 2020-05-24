Rails.application.routes.draw do
  
  root to: 'project#index'
  
  devise_for :users
  
  # get '/login' => 'project#login'
  # get '/index' => 'project#index'
  # get '/register' => 'project#register'
  # get '/forgetPassword' => 'project#forgetPassword'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
