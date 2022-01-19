Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/forecasts', to: 'forecasts#show'
      get '/backgrounds', to: 'backgrounds#show'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
    end 
  end 
end
