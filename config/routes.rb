Rails.application.routes.draw do

  resources :companies

  resources :authors

  get 'video/index'

  resources :videos
  resources :categories
  resource :contacts
  resource :abouts
  resources :blogs
  resources :events
  resources :images
  resources :adverts
  resources :articles

  resource :companies do
    resources :events
  end

  resources :authors do
    resources :blogs
  end

  resources :categories do
    resources :articles
  end

  root 'base#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount ActiveAdmin::Tinymce::Engine => '/', as: 'admin_editor'

  # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
