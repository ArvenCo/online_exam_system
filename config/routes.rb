Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get '/sign_up', to: 'sign_up#new'
  
  namespace :sign_up do
    resources :instructor
    resources :student
  end

  namespace :main do
    resources :subject
  end 

  get "/login", to: 'session#new' 
  post "/login", to: 'session#create'
  delete "/logout", to: 'session#destroy'

  get "up" => "rails/health#show", as: :rails_health_check
  root "instructor/subject#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
