require "rails_helper"
RSpec.describe "Bulk Discount New" do
  describe "bulk discount creation page" do
    before :each do
      @merchant = create(:merchant)
      visit new_merchant_bulk_discount_path(@merchant.id)
    end

    it "redirects to bulk discount index upon successful creation" do
      fill_in "bulk_discount_item_quantity", with: 10
      fill_in "bulk_discount_percent_off", with: 50
      click_on "Create Discount"
      expect(current_path).to eq(merchant_bulk_discounts_path(@merchant.id))
    end
  end
end
