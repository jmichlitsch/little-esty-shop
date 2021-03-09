class ChangePercentOffToDec < ActiveRecord::Migration[5.2]
  def change
    change_column :bulk_discounts, :percent_off, :decimal
  end
end
