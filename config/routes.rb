Rails.application.routes.draw do
  devise_for :users
  resources :users, :path => "mon_profil"
  devise_for :producers
  resources :producers, :path => "profil_producteur"
  get '/contact', to: 'static_pages#contact'
  root 'welcome#home'
end
