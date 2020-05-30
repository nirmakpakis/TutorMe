Rails.application.routes.draw do
  root to: 'courses#index'
  devise_for :users

  resources :courses, :tutors, :students

  get '/tutor/:user_id/course/:course_id', to: 'tutors#create_tutor', as: 'create_tutor'
  get '/student/:user_id/course/:course_id', to: 'students#create_student', as: 'create_student'
  
  # get '/login' => 'project#login'
  # get '/index' => 'project#index'
  # get '/register' => 'project#register'
  # get '/forgetPassword' => 'project#forgetPassword'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
