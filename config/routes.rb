Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }

  

  namespace :admin do
    resources :agencies
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

  root to: "admin/agencies#index"

end
