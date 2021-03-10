require "rails_helper"

RSpec.describe "Bulk Discount Destroy" do
  describe " bulk discounts delete function" do
    before :each do
      @merchant = create(:merchant)
      @discount1 = BulkDiscount.create!(merchant_id: @merchant.id, item_quantity: 1, percent_off: 20)
      @discount2 = BulkDiscount.create!(merchant_id: @merchant.id, item_quantity: 1, percent_off: 30)
      visit merchant_bulk_discounts_path(@merchant.id)
    end
    it "has a link to delete the discount next to each discount which disables it" do

      expect(page).to have_content(@discount1.percent_off)
      expect(page).to have_content(@discount2.percent_off)
      within("#discount-#{@discount1.id}") do
        click_on "Delete"
        expect(current_path).to eq("/merchant/#{@merchant.id}/bulk_discounts")
      end
      expect(page).to_not have_content(@discount1.percent_off)
      expect(page).to have_content(@discount2.percent_off)
    end
  end
end
