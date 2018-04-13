Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  resouces :top, only: [:show]

  resouces :products, only: [:index, :show] do
  	resouce :cart_items, only: [:create]
  end

  resouces :carts, only: [:create, :show] do
  	resouce :cart_items, only: [:destroy]
  end
  get '/carts/:id/select' => 'carts#select'
  get '/carts/:id/confirm' => 'carts#confirm'
  post '/carts/:id/confirm' => 'carts#purchase'
  get '/carts/:id/complete' => 'carts#camplete'

  resouces :users, only: [:show, :edit, :update]
  get '/'

  resouces :purchasers
  resouces :admins
  resouces :browsings
  resouces :favorites

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


resouces :cart_items, only: [:create, :destroy]





resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  end

  root 'post_images#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

post '/posts' => 'posts#create'
  get '/posts/:id' => 'posts#show', as: 'post'
  get '/posts' => 'posts#index'
  get '/posts/:id/edit' => 'posts#edit', as: 'edit_post'
  patch '/posts/:id' => 'posts#update', as: 'update_post'
  delete '/posts/:id' => 'posts#destroy', as: 'destroy_post
