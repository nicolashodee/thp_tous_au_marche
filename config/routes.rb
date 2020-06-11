Rails.application.routes.draw do
  devise_for :users
  resources :users, :path => "my_user_profile"
  devise_for :producers
  resources :producers, :path => "my_producer_profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
