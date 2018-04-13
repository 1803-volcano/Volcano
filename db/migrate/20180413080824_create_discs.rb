class CreateDiscs < ActiveRecord::Migration[5.1]
  def change
    create_table :discs do |t|

      t.references  :product, index: true, foreign_key: true
      t.string :disc_name
      t.timestamps
    end
  end
end
