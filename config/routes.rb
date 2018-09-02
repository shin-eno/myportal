Rails.application.routes.draw do
  root "top#index"
  get  "top/index"
  get "about" => "top#about", as: "about" 
  
  get "/kakeibos/list" => "kakeibos#list"
  post "/kakeibos/list" => "kakeibos#list"

  resources :kakeibos
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
