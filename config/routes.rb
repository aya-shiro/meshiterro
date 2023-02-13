Rails.application.routes.draw do

devise_for :users
root to: 'homes#top'

get "homes/about", as: "about"

resources :postimages, only: [:new, :create, :index, :show, :destroy]
resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
