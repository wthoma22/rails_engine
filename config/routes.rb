Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :items do
        get '/find_all',   to: 'item#index'
        get '/:id/best_day', to: 'item#best_day'
        get '/most_items', to: 'item#most_items'
        get '/most_revenue', to: 'item#most_revenue'
      end

      namespace :merchants do

      end

      namespace :customers do

      end

      resources :merchants, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :customers, only: [:index, :show]

    end
  end
end
