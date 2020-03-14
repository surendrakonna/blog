Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :articles
    resources :comments

    resources :docs, only: [:index]
  end
end
