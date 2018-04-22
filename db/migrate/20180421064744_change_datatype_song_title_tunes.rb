class ChangeDatatypeSongTitleTunes < ActiveRecord::Migration[5.1]
  def change
  	change_column :tunes, :song_title, :string
  end
end
