Rails.application.routes.draw do
  # resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # index
  get "/blogs", to: "blogs#index"

end
