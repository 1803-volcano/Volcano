class AddReplyToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :reply, :text
  end
end
