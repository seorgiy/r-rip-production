Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config

  # constraints(port: "1488") do

  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      get 'posts', to: 'posts#index'
      put 'posts', to: 'posts#create'
      get '/posts/:id', to: 'posts#show'
      post '/posts/:id', to: 'posts#update'

      get '/users/:id', to: 'users#show'
      put 'users', to: 'users#create'
    end
  end

    namespace :admin do
        get 'posts', to: 'posts#index'
        get 'posts/:id/approve', to: 'posts#approve'
    end
  # end

  root 'application#index'
  devise_for :users

  # get '/*path', to: 'application#index'
  match 'api/*unmatched', to: 'api#route_not_found', via: :all
end
