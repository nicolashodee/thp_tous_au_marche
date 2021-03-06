Rails.application.routes.draw do
  root 'welcome#home'
  devise_for :users
  resources :users, :path => "mon_profil"
  
  devise_for :producers
  resources :producers, :path => "profil_producteur"
  
  resources :producers do
    put :favorite, on: :member
    member do
      delete :delete_image_attachment
    end
  end

  resources :contacts, only: [:new, :create]

  resources :comments
  resources :ratings

  namespace :admin do
    resources :producers, :comments, :users
  end
end
