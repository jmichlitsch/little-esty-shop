class AddBulkReferenceToInvoiceItem < ActiveRecord::Migration[5.2]
  def change
    change_table :invoice_items do |t|
      t.references :bulk_discounts, foreign_key: true
    end
  end
end
