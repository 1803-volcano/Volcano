class CreatePurchasers < ActiveRecord::Migration[5.1]
  def change
    create_table :purchasers do |t|

      t.references  :user, index: true, foreign_key: true
      t.string :p_code
      t.string :d_region
      t.string :d_street
      t.string :d_name
      t.string :pay
      t.string :status
      t.date :p_date
      t.timestamps
    end
  end
end
