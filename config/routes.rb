Rails.application.routes.draw do
  devise_for :agencyusers, path: 'agencyusers', controllers: { sessions: "agencyusers/sessions" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }

  resources :agencies, only: [:index, :show] do
    get 'home', on: :collection
  end
  resources :categories, only: [:show]

  resources :users, only: [:edit, :update]

  resources :message_boards, only: [:new, :create, :show, :index, :destroy]

  root to: "agencies#home"

  namespace :admin do
    resources :agencies
    resources :agencyusers
    resources :categories
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    root to: "agencies#index"
  end

mount ActionCable.server => '/cable'

end
