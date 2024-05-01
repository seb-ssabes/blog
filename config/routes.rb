Rails.application.routes.draw do

  get "/blogposts/new", to: "blogposts#new", as: :new_blogpost
  get "/blogposts/:id", to: "blogposts#show", as: :blogpost
  post "/blogposts", to: "blogposts#create", as: :blogposts

  root "blogposts#index"
end
