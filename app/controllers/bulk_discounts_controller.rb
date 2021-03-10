class BulkDiscountsController < ApplicationController
  def index
    @holidays = HolidayService.new.holidays
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.bulk_discounts
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.new
  end

  def create
    @discount = BulkDiscount.new(discount_params)
    @discount.save
    redirect_to merchant_bulk_discounts_path(params[:merchant_id])
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
    @discount.update(discount_params)
    @discount.save
    redirect_to merchant_bulk_discount_path(@merchant, @discount)
  end

  def destroy
    @merchant = Merchant.find(params[:merchant_id])
    BulkDiscount.destroy(params[:id])
    redirect_to "/merchant/#{@merchant.id}/bulk_discounts"
  end


private

  def discount_params
  params.permit(:percent_off, :item_quantity, :merchant_id)
  end
end
