class AddGenreToEvents < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :genre, :string
  end
end
