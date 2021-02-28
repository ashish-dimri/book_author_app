Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :authors
  resources :books

  namespace :api do
  	resources :authors, only: [:index, :show]
  end
end
