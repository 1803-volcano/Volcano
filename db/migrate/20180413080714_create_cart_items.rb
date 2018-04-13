class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|

      t.references  :cart, index: true, foreign_key: true
      t.references  :product, index: true, foreign_key: true
      t.timestamps
    end
  end
end
