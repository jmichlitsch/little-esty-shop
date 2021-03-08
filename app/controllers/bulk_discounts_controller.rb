class BulkDiscountsController < ApplicationController
  def index
    @holidays = HolidayService.new.holidays
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.bulk_discounts
  end

  def show
    @discount = BulkDiscount.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.new
  end

  def create
    @discount = BulkDiscount.new(discount_params)
    redirect_to merchant_bulk_discounts_path(params[:merchant_id])
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  def update
    @discount = BulkDiscount.find(params[:id])
    @discount.update(discount_params)
    redirect_to merchant_bulk_discount_path(params[:merchant_id],params[:id])
  end

  def destroy
    @discount = BulkDiscount.find(params[:id])
    @discount.disable
    redirect_to merchant_bulk_discounts_path(params[:merchant_id])
  end
end

def discount_params
  params.require(:bulk_discount).permit(:percent_off, :item_quantity).merge(merchant_id: params[:merchant_id])
end
