Rails.application.routes.draw do
  root to: "dashboards#show"

  resources :events, only: [:create]
  resource :dashboard, only: [:create, :show]
end
