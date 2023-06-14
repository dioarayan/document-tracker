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
  get 'pending', to: 'pages#pending'
  get 'processing', to: 'pages#processing'
  get 'completed', to: 'pages#completed'
  
  resources :documents do
    get '/preview', to: "documents#preview"
    resources :routes do
      get '/accept', to: 'routes#new'
      get '/reject', to: 'routes#destroy'
    end 
  end

# resources :routes do
  # resources :likes, only: [:create, :destroy]
# end
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
