Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get '/form', to: 'form#index'
  get '/form/:id', to: 'form#show'
  post '/form', to: 'form#create'
  delete '/form/:id', to: 'form#delete'
  put '/form/:id', to: 'form#update'
end
