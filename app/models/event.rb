class Event < ApplicationRecord

	belongs_to :user
	validates_uniqueness_of :title, :scope => [:artist, :start, :venue, :image, :user]

end
