require "rails_helper"
describe "merchant bulk discounts index page" do
  before :each do
    @merchant = create(:merchant)
    @discounts = create_list(:bulk_discount,5,merchant_id: @merchant.id)
    visit merchant_bulk_discounts_path(@merchant.id)
  end

  it "lists all merchant discounts" do
    @discounts.each do |discount|
      within("#discount-#{discount.id}") do
        expect(page).to have_content(discount.percent_off)
        expect(page).to have_content(discount.item_quantity)
      end
    end
  end

  it "has links to each discount's show page" do
    @discounts.each do |discount|
      within("#discount-#{discount.id}") do
        click_on "See Details"
        expect(current_path).to eq(merchant_bulk_discount_path(@merchant.id,discount.id))
      end
      visit merchant_bulk_discounts_path(@merchant.id)
    end
  end

  it "has a link to create a new discount" do
    click_on "New Discount"
    expect(current_path).to eq(new_merchant_bulk_discount_path(@merchant.id))
  end

  it "has a link to edit the discount's properties" do
    visit merchant_bulk_discount_path(@merchant.id, @discounts[0].id)
    click_on "Edit Discount"
    expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant.id,@discounts[0].id))
  end

  it "has a link to delete the discount next to each discount which disables it" do
    @discounts.each do |discount|
      within("#discount-#{discount.id}") do
        click_on "Delete Discount"
      end
    end
  end
end
