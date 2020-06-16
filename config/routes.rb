Rails.application.routes.draw do
  root 'welcome#home'
  devise_for :users
  resources :users, :path => "mon_profil"
  devise_for :producers
  resources :producers, :path => "profil_producteur"
  resources :comments
  get '/contact', to: 'static_pages#contact'
  namespace :admin do
    resources :producers, :comments, :users
  end
end
