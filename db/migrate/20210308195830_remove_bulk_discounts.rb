class RemoveBulkDiscounts < ActiveRecord::Migration[5.2]
  def change
    remove_column :invoice_items, :bulk_discounts_id
  end
end
