Rails.application.routes.draw do
  devise_for :admins, path: 'admins'
  devise_for :users, path: 'users'

  namespace :admin do
    resources :agencies
  end

  root to: "admin/agencies#index"

end
