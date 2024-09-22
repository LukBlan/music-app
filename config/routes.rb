Rails.application.routes.draw do
  resources :users do
    collection do
      get "activate"
    end
  end
  resource :session

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:create, :edit, :update, :destroy, :show] do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :edit, :update, :show, :destroy] do
    resources :notes, only: [:new]
  end

  resources :notes, only: [:create, :destroy]
end
