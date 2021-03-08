class BulkDiscount < ApplicationRecord
  has_many :invoice_items
  belongs_to :merchant

  def disable
    update(active: false)
  end
end
