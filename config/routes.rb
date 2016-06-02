Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  get 'switch_user' => 'switch_user#set_current_user'

  ActiveAdmin.routes self

  resource :session_timeout, only: :show

  resources :customers
  resources :visits
end
