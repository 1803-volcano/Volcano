class CreateTunes < ActiveRecord::Migration[5.1]
  def change
    create_table :tunes do |t|

      t.references  :disc, index: true, foreign_key: true
      t.integer :order
      t.string :song_title
      t.date :song_time
      t.timestamps
    end
  end
end
