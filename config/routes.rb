Rails.application.routes.draw do
  resources :tasks
  resources :dashboards, path: '/'
end
