Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  constraints format: :json do
    resources :smartwatches, only: [:index]
  end
end
