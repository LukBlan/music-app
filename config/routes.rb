Rails.application.routes.draw do
  resources :users
  resources :cats
  resource :session
  resources :bands
end
