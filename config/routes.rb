Rails.application.routes.draw do

  resources :products
  root 'pages#index'
  get '/contact' => 'comments#index'

  resources :comments, only: [:create]

  get '/:id' => 'high_voltage/pages#show', as: :static

end
