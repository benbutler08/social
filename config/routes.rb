Rails.application.routes.draw do
  resources :assignments
  resources :tasks
  resources :dashboards, path: '/'
end
