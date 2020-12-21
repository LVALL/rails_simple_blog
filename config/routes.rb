Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    resources :comments do
      patch :publish
    end
  end
end
