class BulkDiscount < ApplicationRecord
  has_many :invoice_items
  belongs_to :merchant

  def disable
    update(active: false)
  end

  def enable
    update(active: true)
  end
end
