Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/stations', to: 'stations#index'
      get '/usage', to: 'system_usage#index'
      get '/usage/hourly', to: 'system_usage#hourly'
    end
  end
end
