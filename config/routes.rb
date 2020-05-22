Rails.application.routes.draw do
  get 'project/login'
  get '/' => 'project#login'
  get '/index' => 'project#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
