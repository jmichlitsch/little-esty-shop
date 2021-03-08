require "rails_helper"

describe BulkDiscount, type: :model do
  describe "relationships" do
    it {should have_many :invoice_items}
    it {should belong_to :merchant}
  end
end
