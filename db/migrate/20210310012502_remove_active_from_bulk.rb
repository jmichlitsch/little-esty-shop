class RemoveActiveFromBulk < ActiveRecord::Migration[5.2]
  def change
    remove_column :bulk_discounts, :active, :boolean
  end
end
