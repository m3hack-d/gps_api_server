Rails.application.routes.draw do
  root to: 'top#index'

  namespace :api do
    resources :performances
  end

  namespace :admin do
  end
end
