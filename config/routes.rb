Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "/home" , to: "pages#home"


  # get "/recipes" , to: "recipes#index"
  # get "/recipes/new" , to: "recipes#new"
  # post "/recipes" , to: "recipes#create"
  # get "/recipes/:id" , to: "recipes#show" , as: "recipe"

  
  resources :recipes

  get '/signup' , to: 'chefs#new'
  resources :chefs, except: [:new]

  get '/login' , to: "session#new"
  post '/login' , to: "session#create"
  delete '/logout' , to: "session#destroy"
  
end
