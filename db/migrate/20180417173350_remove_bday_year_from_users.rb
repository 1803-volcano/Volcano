class RemoveBdayYearFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :bday_year, :date
    remove_column :users, :bday_month, :date
    remove_column :users, :bday_day, :date
  end
end
