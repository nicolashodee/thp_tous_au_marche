Rails.application.routes.draw do
  devise_for :users
  resources :users, :path => "My_user_profile"
  devise_for :producers
  resources :producers, :path => "My_producer_profile"
  get '/contact', to: 'static_pages#contact'
  root 'welcome#home'
end
