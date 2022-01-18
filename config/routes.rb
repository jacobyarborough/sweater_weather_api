Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      get '/forecast', to: 'forecasts#show'
      get '/background', to: 'backgrounds#show'
      get '/book-search', to: 'location_books#index'
    end 
  end 
end
