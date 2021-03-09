class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item

  enum status: {pending: 0, packaged: 1, shipped: 2}

  def change_status(status)
    self.update(status: status.downcase)
  end

  def self.calculate_revenue
    sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def best_discount
    item.merchant.bulk_discounts
    .where("bulk_discounts.item_quantity <= ?", quantity)
    .order(percent_off: :desc)
    .first
  end

  def revenue
    quantity * unit_price
  end

  def take_off
    return 0 if best_discount.nil?
    best_discount.item_quantity * (unit_price * (best_discount.percent_off/100))
  end

  def final_revenue
      revenue - take_off
  end
end
