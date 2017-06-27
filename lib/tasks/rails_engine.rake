require 'csv'

namespace :rails_engine do
  desc "TODO"
  task seed: :environment do
    data = {
      customers: "./db/sales_data/customers.csv",
      invoice_items: "../db/sales_data/invoice_items",
      invoices: "../db/sales_data/invoices",
      items: "../db/sales_data/items",
      merchants: "../db/sales_data/merchants",
      transactions: "../db/sales_data/transactions",
    }

    CSV.foreach(data[:customers],{:headers=>:first_row}) do |row|
        binding.pry
    end

    # load_customers

      # load_invoice_items
      # load_invoices
      # load_items
      # load_merchants
      # load_transactions
  end
end

# CSV.open(args[key], headers: true, header_converters: :symbol)
