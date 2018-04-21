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
    #resource :browsings, only: [:create, :destroy]
    #resource :favorites, only: [:create, :destroy]
    member do
      post "add", to: "favorites#create"
    end
  end
  resources :favorites, only: [:destroy, :index]


  resources :carts, only: [:create, :show] do
    resource :cart_items, only: [:destroy]
  end
  get '/carts/:id/select' => 'carts#select', as: 'select_cart'
  get '/carts/:id/confirm' => 'carts#confirm', as: 'confirm_cart'
  post '/carts/:id/confirm' => 'carts#purchase'
  get '/carts/:id/complete' => 'carts#complete', as: 'complete_cart'

  resources :users, only: [:show, :edit, :update] do
    resources :purchasers, only: [:index, :show]
    #resources :favorites, only: [:index]
  end
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe_user'


  namespace :admins do
    resources :top, only: [:show, :edit, :update]
    resources :users, only: [:index, :show]
    put '/users/:id' => 'users#delete', as: 'delete_user'
    resources :products, only: [:new, :create, :edit, :update, :index, :show]
    resources :purchasers, only: [:index, :show, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
