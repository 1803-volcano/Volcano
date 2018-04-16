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

  root 'top#show'

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
    resources :purchasers, only: [:index, :show]
    resources :favorites, only: [:index]
  end
  get '/users/:id/unsubscribe' => 'users#unsubscribe'


  namespace :admins do
    resources :top, only: [:show, :edit, :update]
    resources :users, only: [:index]
    put '/users/:id' => 'users#delete'
    resources :products, only: [:new, :create, :edit, :update]
    get '/products/list' => 'products#list'
    resources :purchasers, only: [:index, :show, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


