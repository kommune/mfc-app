Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :admin do
    resources :agencies
  end

  root to: "admin/agencies#index"

end
