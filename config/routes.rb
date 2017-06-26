Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :items do
        get '/:id/best_day', to: 'item#best_day'
        get '/most_items', to: 'item#most_items'
        get '/most_revenue', to: 'item#most_revenue'
      end

      namespace :merchants do
        get '/:id/revenue', to: 'merchant#revenue'
        get '/:id/customers_with_pending_invoices', to: 'merchant#customers_with_pending_invoices'
        get '/:id/favorite_customer', to: 'merchant#favorite_customer'
      end

      namespace :customers do
        get '/:id/favorite_merchant', to: 'customer#favorite_merchant'
      end

      resources :merchants, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :customers, only: [:index, :show]

    end
  end
end
