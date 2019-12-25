Rails.application.routes.draw do
  resources :user
  resources :articles
  resources :comments
end
