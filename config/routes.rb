Rails.application.routes.draw do
  root "pages#home"
  get "/about", to:"pages#about"
  get "/dashboard", to:"pages#dashboard"
  get "/signup", to:"users#new"
  get 'login', to: 'sessions#new'
  resources :users, except: [:new]
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories
  
  resources :documents do
    resources :routes 
    collection do
      get 'pending'
      get 'processing'
      get 'completed'
      get '/preview/:id', to: "documents#preview"
    end
  end
  
  #resources :routes do
  #  resources :likes, only: [:create, :destroy]
  #end
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
