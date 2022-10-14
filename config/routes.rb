Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout'}, controllers: {sessions: 'users/sessions'}
  resources :users
  #get '/users/:id/edit_password', to: 'users#edit_password', as: 'user_cazzo'

  get 'pages/home'
  get 'mockups/page_a'
  get 'mockups/edu_sign_in'
  get 'mockups/edu_index'
  get 'mockups/edu_student_bookmark'
  get 'mockups/edu_faq'
  get 'mockups/sign_in'
  get 'mockups/homepage'
  get 'mockups/lessons_show'
  get 'mockups/lessons_show_steps_show'
  get 'mockups/users_show'
  get 'mockups/users_edit'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
end
