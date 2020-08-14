Rails.application.routes.draw do
  root to: "static#home"
  
  # resources :users

  get "/signup", to: "users#new", as: "signup" # signup_path or signup_url
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :users, only: [] do
    resources :blogs
  end

  get "/auth/github/callback", to: "sessions#github"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # # index
  # get "/blogs", to: "blogs#index", as: "blogs"

  # # new / create
  # get "/blogs/new", to: "blogs#new", as: "new_blog"
  # post "/blogs", to: "blogs#create"

  # # show
  # get "/blogs/:id", to: "blogs#show", as: "blog"

  # # edit / update

  # get "/blogs/:id/edit", to: "blogs#edit", as: "edit_blog"
  # patch "/blogs/:id", to: "blogs#update"

  # # destroy

  # delete "/blogs/:id", to: "blogs#destroy"
end
