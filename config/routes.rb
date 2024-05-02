Rails.application.routes.draw do
  devise_for :users
  resources :blogposts
  root "blogposts#index"
end
