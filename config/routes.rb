Rails.application.routes.draw do

  resources :products
  root 'products#index'
  get '/home' => 'products#index'
  get '/contact' => 'comments#index'

  resources :comments, only: [:create]

  get '/:id' => 'high_voltage/pages#show', as: :static

end
