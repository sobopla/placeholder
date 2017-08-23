class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
    	t.string			:title
    	t.string			:artist
    	t.datetime		:start
    	t.string			:venue
    	t.string			:image
    	t.references	:user

      t.timestamps
    end
  end
end