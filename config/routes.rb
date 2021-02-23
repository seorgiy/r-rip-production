Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      get 'posts', to: 'posts#index'
      put 'posts', to: 'posts#create'
      get '/posts/:id', to: 'posts#show'
      post '/posts/:id', to: 'posts#update'

      get '/users/:id', to: 'users#show'
      put 'users', to: 'users#create'

      get 'artifacts', to: 'artifacts#index'
      put 'artifacts', to: 'artifacts#create'
      get '/artifacts/:id', to: 'artifacts#show'
    end
  end

  namespace :admin do
      get 'posts', to: 'posts#index'
      get 'posts/:id/approve', to: 'posts#approve'
  end

  match 'api/*unmatched', to: 'api#route_not_found', via: :all
  get '/', to: 'application#index'
end
