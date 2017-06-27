require 'rails_helper'

RSpec.describe InvoiceItems, type: :model do
  describe "relationships" do
  it { should belong_to :invoices }
  it { should belong_to :items }
end
  describe "validations" do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:item_id) }
    it { should validate_presence_of(:invoice_id) }
  end
end
