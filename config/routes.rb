Rails.application.routes.draw do
  root to: "dashboards#show"

  resources :events, only: [:create]
  resource :dashboard, only: [:create, :show]
  resource :data_request, only: [:create]
  resource :real_time_events, only: [:show]
end
