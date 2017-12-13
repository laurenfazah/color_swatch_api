Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :colors, only: [:create]
      get "top_color", to: "top_color#show"
    end
  end
end
