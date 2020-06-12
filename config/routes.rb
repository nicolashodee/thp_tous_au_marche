Rails.application.routes.draw do
  devise_for :users
  resources :users, :path => "My_user_profile"
  devise_for :producers
  resources :producers, :path => "My_producer_profile"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/contact', to: 'static_pages#contact'
end
