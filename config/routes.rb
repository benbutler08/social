Rails.application.routes.draw do
  resources :recipes
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :assignments
  resources :tasks
  resources :dashboards, path: '/'
end
