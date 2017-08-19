class CreateArtistgenres < ActiveRecord::Migration[5.1]
  def change
    create_table :artistgenres do |t|
      t.references  :artist
      t.references  :genre

      t.timestamps
    end
  end
end
