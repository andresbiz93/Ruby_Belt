Rails.application.routes.draw do
  get "/main" => "sessions#index"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"
  post "/users/create" => "users#create"
  get "/users/:id" => "users#show"
  get "/songs" => "songs#all"
  get "/songs/:id" => "songs#show"
  post "/songs/create" => "songs#create"
  post "/songs/:id/add" => "entries#create"
end
