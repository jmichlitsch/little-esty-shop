require "rails_helper"
RSpec.describe "Bulk Discount Edit" do
  describe "bulk discounts edit page" do
    before :each do
      @merchant = create(:merchant)
      @discount = create(:bulk_discount, merchant_id: @merchant.id)
      visit edit_merchant_bulk_discount_path(@merchant.id,@discount.id)
    end

    it "redirects to show page upon successful submission" do
      fill_in "bulk_discount_item_quantity", with: 10
      click_on "Update Discount"
      expect(current_path).to eq(merchant_bulk_discount_path(@merchant.id,@discount.id))
    end
  end
end
