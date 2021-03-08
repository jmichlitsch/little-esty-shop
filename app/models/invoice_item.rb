class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  belongs_to :bulk_discount, optional: true
  
  enum status: {pending: 0, packaged: 1, shipped: 2}

  def change_status(status)
    self.update(status: status.downcase)
  end

  def self.calculate_revenue
   sum("invoice_items.unit_price * invoice_items.quantity")
  end
end
