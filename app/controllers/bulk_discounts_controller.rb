class BulkDiscountsController < ApplicationController
  def index
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
    redirect_to merchant_bulk_discounts_path[:merchant_id]
  end

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end
end

def discount_params
  params.require(:bulk_discount).permit(:percent_off, :item_quantity).merge(merchant_id: params[:merchant_id])
end
