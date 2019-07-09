Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "todolist#index"
  get "item/new", to: "todolist#new", as: "new_item"
  post "item/create", to: "todolist#create", as: "items"
  get "item/:id/edit", to: "todolist#edit", as: "item_edit"
  patch "item/:id", to: "todolist#update", as: "item"
  delete "item/:id", to: "todolist#destroy", as: "item_delete"
  
end
