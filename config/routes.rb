Rails.application.routes.draw do

  root 'pages#index'

  get '/home' => 'pages#index'

  get '/:id' => 'high_voltage/pages#show', as: :static

end
