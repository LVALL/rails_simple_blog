Rails.application.routes.draw do
  root 'posts#index'
  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :authors
  resources :sessions
  resources :posts do
    resources :comments do
      patch :publish
    end
  end
end
