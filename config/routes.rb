Rails.application.routes.draw do

    resources :contacts, only: [:index, :show, :create, :new]

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

  get 'top/contact' => 'top#contact', as: 'contact_top'
  get 'top/about' => 'top#about', as: 'about_top'
  get 'top/genre' => 'top#genre', as: 'genre_top'
  get 'top/company' => 'top#company', as: 'company_top'

  resources :products, only: [:index, :show] do
    resource :cart_items, only: [:create]
    resource :browsings, only: [:create, :destroy]
    resources :favorites, only: [:destroy]
    member do
      post "add", to: "favorites#create"

      #post "add", to: "browsings#create"
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

  get '/users/mypage' => 'users#mypage', as: 'mypage_user'
  resources :users, only: [:show, :edit, :update] do
    resources :purchasers, only: [:index, :show]
    #resources :favorites, only: [:index]
  end
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe_user'


  namespace :admins do
    resources :top, only: [:show, :edit, :update]
    resources :users, only: [:index, :show, :update, :edit]
    put '/users/:id' => 'users#delete', as: 'delete_user'
    resources :products, only: [:new, :create, :edit, :update, :index, :show]
    resources :purchasers, only: [:index, :show, :update]
    resources :contacts, only: [:index, :show, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
