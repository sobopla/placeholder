class Genre < ApplicationRecord

  validates :genre, presence: :true
  has_many :artistgenres
  has_many :artists, through: :artistgenres
  has_many :searches
  has_many :users, through: :searches

end
