Rails.application.routes.draw do

  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations"}

  authenticate :admin  do
    mount Searchjoy::Engine, at: "admin/searches"
  end

  resources :agencies, only: [:index, :show] do
    get 'home', on: :collection
    get 'search', on: :collection
    post 'filter', on: :collection
  end
  resources :categories, only: [:show]

  resources :users, only: [:edit, :update] do
    resources :message_boards, only: [:new, :create, :show, :index, :destroy]
  end

  resources :messages, only: [:create]

  resources :contacts, only: [:create]

  root to: "agencies#home"

  namespace :admin do
    get '/dashboard', to: 'agencies#dashboard'
    resources :agencies
    resources :categories
    resources :contacts, only: [:index, :show, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy] do
      get 'public', on: :collection
      get 'agency', on: :collection
    end
    root to: "agencies#index"
  end

mount ActionCable.server => '/cable'

end
