Rails.application.routes.draw do
  root to: "dashboards#index"

  resources :events, only: [:create]
end
