Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
mount MailPreview => 'mail_view' if Rails.env.development?end
