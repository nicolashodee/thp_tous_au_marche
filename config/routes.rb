Rails.application.routes.draw do
  get 'contacts/new'
  root 'welcome#home'
  devise_for :users
  resources :users, :path => "mon_profil"
  
  devise_for :producers
  resources :producers, :path => "profil_producteur"
  
  resources :producers do
    put :favorite, on: :member
  end

  resources :contacts, only: [:new, :create]

  resources :comments
  resources :ratings
  get '/contact', to: 'static_pages#contact'

  root 'welcome#home'

  resources :producers, only: [:show] do
    resources :avatars, only: [:create]
    resources :images, only: [:create]
  end
  
  namespace :admin do
    resources :producers, :comments, :users
  end

  resources :users, only: [:show] do
    resources :avatar_users, only: [:create]
  end
end
