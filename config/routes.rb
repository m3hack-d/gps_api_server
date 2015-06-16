Rails.application.routes.draw do
  root to: 'top#index'

  namespace :api do
    resources :performances do
      get :callback, on: :collection
    end
  end
end
