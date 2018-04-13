Rails.application.routes.draw do

  root 'users#index'

  devise_for :admins
  devise_for :users

  resouces :top, only: [:show]

  resouces :products, only: [:index, :show] do
  	resouce :cart_items, only: [:create]
  	resouce :browsings, only: [:create]
    resouce :favorites, only: [:create, :destroy]
  end

  resouces :carts, only: [:create, :show] do
  	resouce :cart_items, only: [:destroy]
  end
  get '/carts/:id/select' => 'carts#select'
  get '/carts/:id/confirm' => 'carts#confirm'
  post '/carts/:id/confirm' => 'carts#purchase'
  get '/carts/:id/complete' => 'carts#camplete'

  resouces :users, only: [:show, :edit, :update] do
  	resouce :purchasers, only: [:index, :show]
  end
  get '/users/:id/unsubscribe' => 'users#unsubscribe'


  resouces :admins, only: [:show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


