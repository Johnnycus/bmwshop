Rails.application.routes.draw do

  root 'pages#index'

  get '/home' => 'pages#index'

  get '/contact' => 'comments#index'

  resources :comments, only: [:create]

  get '/:id' => 'high_voltage/pages#show', as: :static

  #resources :pages

end
