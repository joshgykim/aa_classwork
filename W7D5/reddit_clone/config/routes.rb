Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :subs, except: [:destroy, :edit] do
    resources :posts, only: [:new, :create, :show]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :users do
    resources :subs, only: [:edit]
  end
  


end
