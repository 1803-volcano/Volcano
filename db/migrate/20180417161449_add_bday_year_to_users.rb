class AddBdayYearToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bday_year, :date
    add_column :users, :bday_month, :date
    add_column :users, :bday_day, :date
  end
end
