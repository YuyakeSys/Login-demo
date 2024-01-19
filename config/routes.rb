Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # resources :projects
  namespace :api do 
    namespace :v1 do 
     resources :projects, only: [:index]
    end 
  end 
  # Defines the root path route ("/")
  # root "articles#index"
  get '/projects', to: 'projects#index', as: 'projects'
end
