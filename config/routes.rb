Rails.application.routes.draw do
  resources :blogposts
  root "blogposts#index"
end
