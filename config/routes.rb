Rails.application.routes.draw do
  devise_for :users

  root 'application#main'
  get '/*path', to: 'application#main'
end
