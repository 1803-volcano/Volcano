class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|

      t.references  :purchaser, index: true, foreign_key: true
      t.references  :product, index: true, foreign_key: true
      t.integer :sale
      t.integer :sale_price
      t.timestamps
    end
  end
end
