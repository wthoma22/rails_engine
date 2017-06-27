require 'csv'

namespace :rails_engine do
  desc "Creates corresponding objects from the CSV sales data"
  task seed: :environment do
    data = {
      customers: "./db/sales_data/customers.csv",
      invoice_items: "./db/sales_data/invoice_items.csv",
      invoices: "./db/sales_data/invoices.csv",
      items: "./db/sales_data/items.csv",
      merchants: "./db/sales_data/merchants.csv",
      transactions: "./db/sales_data/transactions.csv",
    }

    # CSV.foreach(data[:customers],{:headers=>:first_row}) do |row|
    #     Customer.create!(first_name: row["first_name"],
    #                       last_name: row["last_name"]
    #                     )
    #     puts "Creating customer: #{row["first_name"]}"
    # end
    #
    # CSV.foreach(data[:merchants],{:headers=>:first_row}) do |row|
    #     Merchant.create!(name: row["name"])
    #     puts "Creating Merchant: #{row["name"]}"
    # end

    # CSV.foreach(data[:items],{:headers=>:first_row}) do |row|
    #   Item.create!(name: row["name"],
    #                 description: row["description"],
    #                 unit_price: row["unit_price"].to_i,
    #                 merchant_id: row["merchant_id"].to_i
    #               )
    #   puts "Creating Item: #{row["name"]}"
    # end

    CSV.foreach(data[:invoices],{:headers=>:first_row}) do |row|
      Invoice.create!(customer_id: row["customer_id"].to_i,
                      status: row["status"],
                      merchant_id: row["merchant_id"].to_i
                      created_at: row["created_at"],
                      updated_at: row["updated_at"]
                      )
      puts "Creating Invoice for Customer #{row["customer_id"]}"
    end
    #
    # CSV.foreach(data[:invoice_items],{:headers=>:first_row}) do |row|
    #   InvoiceItem.create!(quantity: row["quantity"],
    #                         unit_price: row["unit_price"].to_i,
    #                         item_id: row["item_id"].to_i,
    #                         invoice_id: row["invoice_id"].to_i
    #                       )
    #   puts "Creating InvoiceItems for Item: #{row["item_id"]}"
    # end
    #
    # CSV.foreach(data[:transactions],{:headers=>:first_row}) do |row|
    #   Transaction.create!(credit_card_number: row["credit_card_number"],
    #                       credit_card_expiration_date: row["credit_card_expiration_date"],
    #                       result: row["result"],
    #                       invoice_id: row["invoice_id"]
    #                       )
    #   puts "Creating Transaction for Invoice: #{row["invoice_id"]}"
    # end
  end
end
