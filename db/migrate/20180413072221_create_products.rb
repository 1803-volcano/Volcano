class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|

      t.string :cd_title
      t.string :artist
      t.text :picture_id
      t.text :sound_source
      t.integer :price
      t.string :label
      t.string :genre
      t.integer :stock
      t.date :start_date
      t.boolean :product_flg
      t.timestamps
    end
  end
end
