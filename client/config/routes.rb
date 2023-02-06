Rails.application.routes.draw do
  root 'pages#home'
  post 'create_post', to: 'pages#create_post'
  delete 'destroy_post/:id', to: 'pages#destroy_post', as: 'destroy_post'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
