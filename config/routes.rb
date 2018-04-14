Rails.application.routes.draw do

  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions',
    :passwords => 'admins/passwords'
  }

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  resources :top, only: [:show]

  resources :products, only: [:index, :show] do
    resource :cart_items, only: [:create]
    resource :browsings, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :carts, only: [:create, :show] do
    resource :cart_items, only: [:destroy]
  end
  get '/carts/:id/select' => 'carts#select'
  get '/carts/:id/confirm' => 'carts#confirm'
  post '/carts/:id/confirm' => 'carts#purchase'
  get '/carts/:id/complete' => 'carts#camplete'

  resources :users, only: [:show, :edit, :update] do
    resource :purchasers, only: [:index, :show]
    resource :favorites, only: [:index]
  end
  get '/users/:id/unsubscribe' => 'users#unsubscribe'


  namespace :admins do
    resources :users, only: [:index]


  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


