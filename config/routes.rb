Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :items do
        get '/:id/best_day', to: 'best_day#show'
        get '/most_items', to: 'most_items#index'
        get '/most_revenue', to: 'most_revenue#index'
      end

      namespace :merchants do
        get '/:id/revenue', to: 'revenue#show'
        get '/:id/customers_with_pending_invoices', to: 'customers_with_pending_invoices#index'
        get '/:id/favorite_customer', to: 'favorite_customer#show'
      end

      namespace :customers do
        get '/:id/favorite_merchant', to: 'favorite_merchant#show'
      end

      resources :merchants, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :invoices, only: [:index, :show]
    end
  end
end
