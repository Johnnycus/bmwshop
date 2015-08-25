Rails.application.routes.draw do

  root 'pages#index'

  resources :products
  resource :cart, only: [:show, :destroy]
  resources :order_items, only: [:create, :update, :destroy]

  resources :comments, only: [:create]

  resources :users, only: [:show]

  get '/contact' => 'comments#index'

  devise_for :admins
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  get '/:id' => 'high_voltage/pages#show', as: :static

end
