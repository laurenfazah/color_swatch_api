Rails.application.routes.draw do
  root to: "api/v1/colors#index"
  namespace :api do
    namespace :v1 do
      resources :colors, only: [:index, :create]
      get "top_color", to: "top_color#show"
    end
  end
end
