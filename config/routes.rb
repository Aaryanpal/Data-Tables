Rails.application.routes.draw do
  get '/employees/home', to: 'employees#home'
  resources :employees
  root "employees#index"
  # resources :homes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
