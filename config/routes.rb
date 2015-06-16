Rails.application.routes.draw do
  root to: 'top#index'

  namespace :api do
    resources :performances do
      get :callback, :exist_file, on: :collection
      delete :delete_file, on: :collection
    end
  end
end
