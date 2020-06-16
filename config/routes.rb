Rails.application.routes.draw do
  root 'welcome#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, :path => "mon_profil"
  devise_for :producers
  resources :producers, :path => "profil_producteur"
  resources :comments
  get '/contact', to: 'static_pages#contact'
end
