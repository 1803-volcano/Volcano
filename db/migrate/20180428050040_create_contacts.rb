class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|

      t.string :title
      t.string :body
 	  t.string :email,              null: false, default: ""
      t.string :name_sei
      t.string :name_mei
      t.string :name_kana_sei
      t.string :name_kana_mei
      t.date :birthday
      t.string :sex
      t.string :postal_code
      t.string :region
      t.string :street
      t.string :phone
      t.timestamps
    end
  end
end
