Rails.application.routes.draw do
  devise_for :agencyusers, path: 'agencyusers', controllers: { sessions: "agencyusers/sessions" }
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }

  resources :agencies, only: [:index, :show]

  resources :users, only: [:edit, :update]

  resources :message_boards, only: [:new, :create, :show, :index]

  namespace :agency do
    resources :message_boards, only: [:new, :create, :show, :index]
  end

  root to: "agencies#index"

  namespace :admin do
    resources :agencies
    resources :agencyusers
    resources :categories
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    root to: "agencies#index"
  end



end
