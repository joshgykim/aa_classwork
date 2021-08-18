Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :new, :create, :show]
  
  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, except: [:index, :new]

  resource :session, only: [:new, :create, :destroy]

end