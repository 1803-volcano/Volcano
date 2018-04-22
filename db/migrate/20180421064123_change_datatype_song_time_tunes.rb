class ChangeDatatypeSongTimeTunes < ActiveRecord::Migration[5.1]
  def change
  	change_column :tunes, :song_time, :time
  end
end
