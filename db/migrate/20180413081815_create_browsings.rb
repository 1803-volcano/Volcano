class CreateBrowsings < ActiveRecord::Migration[5.1]
  def change
    create_table :browsings do |t|

      t.references  :product, index: true, foreign_key: true
      t.references  :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
