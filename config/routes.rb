Rails.application.routes.draw do

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :products
  root 'pages#index'
  get '/contact' => 'comments#index'

  resources :comments, only: [:create]

  get '/:id' => 'high_voltage/pages#show', as: :static

end
