Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'root#index'
  post '/login', to: 'login#create'
  get '/allow-admin', to: 'allow_admin#index'
end
