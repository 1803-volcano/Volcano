class AddCdHiraToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :cd_hira, :string
    add_column :products, :cd_kana, :string
    add_column :products, :a_hira, :string
    add_column :products, :a_kana, :string
  end
end
